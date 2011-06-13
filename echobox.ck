public class EchoBox extends Box
{
    fun void handle(int column, int row, int velocity)
    {
        lp.setGridLight(x + column, y + row, velocity);
    }
}
