public class Instrucao_Art
{
    private String str;

    public Instrucao_Art (String str)
    {
        this.str = str;
    }

    public String getStr()
    {
        return str;
    }

    public void setStr(String str)
    {
        this.str = str;
    }

    @Override
    public String toString() {
        return "Instrucao_Art{" + "name=" + str + '}';
    }


}