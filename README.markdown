Provides an interface for working with the Novation Launchpad in [ChucK](http://chuck.cs.princeton.edu/).  Some
sample uses have been given:

* print.ck - prints messages received from the Launchpad to stdout, to
    illustrate Launchpad input.

* echo.ck - bounces Midi messages back to the Launchpad, to illustrate Launchpad
    output.

* sin.ck - a simple polyphonic sinwave synthesizer, as an example use case that
    actually makes sound.  It's pretty ugly sounding, but it can provide as a
    jump-off spot for more sophisticated instrumentation.

* box_print.ck - prints message received from the Launchpad in only a select area

* box_echo.ck - bounced Midi message back to the Launchpad in only a select area

All of the sample scripts will ask you for the Midi channel to read Launchpad
input from.  This can also be specified at the commandline.  I typically launch
a script like this:

    chuck sin:0

which would launch the sin.ck script with "0" as the first parameter.
