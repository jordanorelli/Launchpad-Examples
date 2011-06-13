/*
Copyright (C) 2011 by Jordan Orelli

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/
int midiChannel;
if(me.args() > 0) {
    Std.atoi(me.arg(0)) => midiChannel;
} else {
    ConsoleInput cin;
    cin.prompt("Enter MIDI port for Launchpad: ") => now;
    StringTokenizer tok;
    int midiChannel;
    while(cin.more()) {
        tok.set(cin.getLine());
        while(tok.more()) {
            Std.atoi(tok.next()) => midiChannel;
        }
    }
}

SinOsc @ oscBank[8][8];
// that's columns, rows, column step, row step, base frequency, and tones per
// octave.  If you change the first two, shit will break.  The others you can
// change freely.  I set it so that it moves chromatically along the horizontal
// axis (3rd parameter is 1) and in fourths along the vertical axis (4th
// parameter is 5).  Changing the last parameter is not for the faint of heart.
ToneCalc.grid(8, 8, 1, 5, 55.0, 12.0) @=> float toneMap[][];

for(0 => int i; i < 8; i++) {
    for(0 => int j; j < 8; j++) {
        SinOsc s;
        toneMap[i][j] => s.freq;
        0.8 => s.gain;
        s @=> oscBank[i][j];
    }
}

fun void play(Launchpad @ lp) {
    while(true) {
        lp.e => now;

        // ignore button presses that are not on the grid
        if(lp.e.column < 0 || lp.e.column > 7) continue;
        if(lp.e.row < 0 || lp.e.row > 7) continue;

        if(lp.e.velocity == 127) {
            oscBank[lp.e.column][lp.e.row] => dac;
        } else if (lp.e.velocity == 0) {
            oscBank[lp.e.column][lp.e.row] =< dac;
        }
        lp.setGridLight(lp.e);
    }
}

Launchpad.Launchpad(midiChannel) @=> Launchpad lp;
spork ~ play(lp);
while(true) {
    100::ms => now;
}
