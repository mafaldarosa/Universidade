public class Etiqueta
{
    private String str;
    private int size;

    public Etiqueta(String str, int size)
    {
        this.str = str;
        this.size = size;
    }

    public String getStr()
    {
        return str;
    }

    public void setStr(String str)
    {
        this.str = str;
    }

    public int getSize()
    {
        return size;
    }

    public void setSize(int size)
    {
        this.size = size;
    }

    @Override
    public String toString() {
        return "Etiqueta{" + "name=" + str + ", size=" + size + '}';
    }


}