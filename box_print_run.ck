fun string prompt(string msg)
{
    ConsoleInput cin;
    cin.prompt(msg) => now;
    StringTokenizer tok;
    string response;
    while(cin.more()) {
        tok.set(cin.getLine());
        while(tok.more()) {
            tok.next() => response;
        }
    }
    return response;
}

int midiChannel;
int x;
int y;
int width;
int height;
if(me.args() > 0) {
    Std.atoi(me.arg(0)) => midiChannel;
} else {
    Std.atoi(prompt("Enter Midi port #: ")) => midiChannel;
    Std.atoi(prompt("X: ")) => x;
    Std.atoi(prompt("Y: ")) => y;
    Std.atoi(prompt("Width: ")) => width;
    Std.atoi(prompt("Height: ")) => height;
}

Launchpad.Launchpad(midiChannel) @=> Launchpad lp;
Box b;
b.init(lp, x, y, width, height);
while(true) {
    100::ms => now;
}
