import java.util.ArrayList;

public class TISC {
    private ArrayList<Object> mem;
    private ArrayList<Object> a;
    private ArrayList<Object> exe;

    public TISC()
    {
        mem = new ArrayList<Object>();
        a = new ArrayList<Object>();
        exe = new ArrayList<Object>();
    }

    public void add_Inst(Object obj)
    {
        mem.add(obj);
    }

    public void add_Etiqueta(Etiqueta etiqueta)
    {
      mem.add(etiqueta);
    }

    public ArrayList<Object> getMemoria()
    {
      return mem;
    }

    public void print()
    {
      for(Object t : mem)
      {
        System.out.println(t.toString());
      }
    }

    public void executa()
    {

    }
}