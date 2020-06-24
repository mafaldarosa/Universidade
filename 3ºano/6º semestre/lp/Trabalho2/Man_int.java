public class Man_int
{
    private String str;
    private int i1;

    public Man_int(String str, int i1)
    {
        this.str = str;
        this.i1 = i1;
    }

    public String getStr()
    {
        return str;
    }

    public void setStr(String str)
    {
        this.str = str;
    }

    public int getI1()
    {
        return i1;
    }

    public void setI1(int i1)
    {
        this.i1 = i1;
    }

    @Override
    public String toString() {
        return "Man_int{" + "name=" + str + ", i1=" + i1 + '}';
    }


}