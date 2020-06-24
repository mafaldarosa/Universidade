public class Arg_Acess
{
    private String str;
    private int i1, i2;

    public Arg_Acess(String str, int inteiro1, int inteiro2)
    {
        this.str = str;
        this.inteiro1 = inteiro1;
        this.inteiro2 = inteiro2;
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

    public int getI2()
    {
        return i2;
    }

    public void setI2(int i2)
    {
        this.i2 = i2;
    }

    @Override
    public String toString() {
        return "Arg_Acess{" + "name=" + str + ", i1=" + i1 + ", i2=" + i2 + '}';
    }
}
