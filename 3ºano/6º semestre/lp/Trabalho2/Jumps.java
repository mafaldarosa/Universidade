public class Jumps
{
    private String str;
    private String etiqueta;

    public Jumps(String str, String etiqueta)
    {
        this.str=str;
        this.etiqueta=etiqueta;
    }

    public String getStr()
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

    @Override
    public String toString() {
        return "Jumps{" + "name=" + str + ", etiqueta=" + etiqueta + '}';
    }


}

