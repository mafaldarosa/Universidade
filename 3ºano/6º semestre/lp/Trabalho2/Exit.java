public class Exit
{
    private String str1, str2;

    public Exit(String str1)
    {
        this.str1 = str1;
    }

    public Exit(String str1, String str2)
    {
        this.str1 = str1;
        this.str2 = str2;
    }

    public String getstr1()
    {
        return str1;
    }

    public void setstr1(String str1)
    {
        this.str1 = str1;
    }

    public String getstr2()
    {
        return str2;
    }

    public void setstr2(String str2)
    {
        this.str2 = str2;
    }

    @Override
    public String toString() {
        if(str1.equals("Write"))
            return "Exit{" + "name=" + str1 + ", str2=" + str2 + '}';

        return "Exit{" + "name=" + str1 + '}';
    }


}