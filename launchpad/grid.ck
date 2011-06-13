public class Grid
{
    Launchpad lp;
    int x;
    int y;
    int width;
    int height;

    fun static Grid Grid(Launchpad @ _lp, int _x, int _y, int _width,
                         int _height)
    {
        Grid grid;
        _lp @=> grid.lp;
        _x => grid.x;
        _y => grid.y;
        _width => grid.width;
        _height => grid.height;
        spork ~ grid.listen();
        return grid;
    }

    fun void listen()
    {
        while(true)
        {
            lp.e => now;
            if(lp.e.column >= x && lp.e.column < x + width
               && lp.e.row >= y && lp.e.row < y + height)
            {
                handle(lp.e.column - x, lp.e.row - y);
            }
        }
    }

    fun void handle(int column, int row)
    {
        chout <= "Grid handle " <= column <= " " <= row <= IO.newline();
    }
}
