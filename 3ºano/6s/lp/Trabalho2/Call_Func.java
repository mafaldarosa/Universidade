public class Call_Func
{
    private String str, etiqueta;
    private int i1, i2;

    public Call_Func(String str , int i1)
    {
        this.str = str;
        this.i1 = i1;
    }

    public Call_Func(String str, int i1, String etiqueta)
    {
        this.str= str;
        this.etiqueta = etiqueta;
        this.i1 = i1;
    }

    public Call_Func(String str, int i1, int i2 )
    {
        this.str = str;
        this.i1 = i1;
        this.i2 = i2;
    }

    public Call_Func(String str)
    {
        this.str = str;
    }

    public String geStr()
    {
        return str;
    }

    public void setStr(String str)
    {
        this.str = str;
    }

    public String getEtiqueta()
    {
        return etiqueta;
    }

    public void setEtiqueta(String etiqueta)
    {
        this.etiqueta = etiqueta;
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
        if(str.equals("Set_arg"))
            return "Call_Func{" + "name=" + str + '}';
        if(str.equals("Call"))
            return "Call_Func{" + "name=" + str + ", etiqueta=" + etiqueta + ", i1=" + i1 + '}';
        if(str.equals("Locals"))
            return "Call_Func{" + "name=" + str + ", i1=" + i1 + '}';

        return "Call_Func{" + "name=" + str + ", i1=" + i1 + ", i2=" + i2 + '}';
    }


}