public class Box
{
    Launchpad lp;
    int x;
    int y;
    int width;
    int height;

    fun void init(Launchpad @ _lp, int _x, int _y, int _width,
                  int _height)
    {
        if (_x < 0)
        {
            0 => _x;
            cherr <= "Warning: negative x seen in Box.init.  Forcing a safe "
                  <= "value of 0." <= IO.newline();
        }
        if (_y < 0)
        {
            0 => _y;
            cherr <= "Warning: negative y seen in Box.init.  Forcing a safe "
                  <= "value of 0." <= IO.newline();
        }
        if (_width < 0)
        {
            0 => _width;
            cherr <= "Warning: negative width seen in Box.init.  Forcing a "
                  <= "safe value of 0." <= IO.newline();
        }
        if (_height < 0)
        {
            0 => _height;
            cherr <= "Warning: negative height seen in Box.init.  Forcing a "
                  <= "safe value of 0." <= IO.newline();
        }
        if (_x + _width > 7)
        {
            7 - _x => _width;
            cherr <= "Warning: declared dimensions in Box.init are too wide. "
                  <= "Forcing a safe width value of " <= _width <= IO.newline();
        }
        if(_y + height > 7)
        {
            7 - _y => height;
            cherr <= "Warning: declared dimensions in Box.init are too tall. "
                  <= "Forcing a safe height value of " <= _height <= IO.newline();
        }


        _lp @=> lp;
        _x => x;
        _y => y;
        _width => width;
        _height => height;
        spork ~ listen();
    }

    fun void listen()
    {
        while(true)
        {
            lp.e => now;
            if(lp.e.column >= x && lp.e.column < x + width
               && lp.e.row >= y && lp.e.row < y + height)
            {
                handle(lp.e.column - x, lp.e.row - y, lp.e.velocity);
            }
        }
    }

    fun void handle(int column, int row, int velocity)
    {
        chout <= "Box handle " <= column <= " " <= row <= " " <= velocity
              <= IO.newline();
    }
}
