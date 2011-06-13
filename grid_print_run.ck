int midiChannel;

if(me.args() > 0) {
    Std.atoi(me.arg(0)) => midiChannel;
} else {
    ConsoleInput cin;
    cin.prompt("Enter MIDI port # to echo: ") => now;
    StringTokenizer tok;
    int midiChannel;
    while(cin.more()) {
        tok.set(cin.getLine());
        while(tok.more()) {
            Std.atoi(tok.next()) => midiChannel;
        }
    }
}

Launchpad.Launchpad(midiChannel) @=> Launchpad lp;
Grid.Grid(lp, 0, 0, 4, 3) @=> Grid grid;
while(true) {
    100::ms => now;
}
