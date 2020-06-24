/*
    TRABALHO REALIZADO POR:
        Mafalda Rosa 40021
        Miguel Carvalho 41136
 */
import java.util.Scanner;

public class Sort {

    //HEAPSORT

    public static void heapsort(Comparable[] A){
        build_heap(A);
        for (int i=A.length-1;i>0;i--){
            troca(A,0,i);
            heapify(A,0,i-1);
        }
    }

    private static void build_heap(Comparable[] A){
        for (int i= A.length /2 ; i>=0; i--){
            heapify(A,i,A.length-1);
        }
    }

    private static void heapify(Comparable[] h, int i, int size){
        int j=2*i+1;

        if ((j< size) && (h[j].compareTo(h[j+1])<0)){
            j++;
        }

        if ((j<=size) && h[i].compareTo(h[j])<0){
            troca (h,i,j);
            heapify(h,j,size);
        }
    }

    private static void troca(Comparable[] a ,int i,int j){
        Comparable tmp=a[i];
        a[i]=a[j];
        a[j]=tmp;
    }

    //MERGESORT

    public void merge(Comparable[] a, Comparable[] tmp,int n1,int n2,int fim) {
        int fim1 = n2 - 1;
        int p = n1;
        int n = fim - n1 + 1;
        while (n1 <= fim1 && n2 <= fim)
            if (a[n1].compareTo(a[n2]) < 0)
                tmp[p++] = a[n1++];
            else
                tmp[p++] = a[n2++];
        for (int i = n1; i <= fim1; i++)
            tmp[p++] = a[i];
        for (int i = n2; i <= fim; i++)
            tmp[p++] = a[i];
        for (int i = 0; i < n; i++, fim--) {
            a[fim] = tmp[fim];
        }

    }

    public  void mergesort(Comparable[] a){
        Comparable[] tmp= new Comparable[a.length];
        ordenacao(a, tmp, 0, a.length-1);
    }

    private void ordenacao(Comparable[] a, Comparable[] t,int esq,int dir){
        if (esq < dir){
            int meio= (esq + dir)/2;
            ordenacao(a,t, esq, meio);
            ordenacao(a,t,meio+1,dir);
            merge(a,t,esq,meio+1,dir);
        }
    }

    public static Comparable[] le_array(){
        Scanner scanner = new Scanner(System.in);
        System.out.println("Números a ordenar: ");
        String separar = scanner.next();
        String[]ajuda = separar.split(",");
        Comparable[] j = new Comparable[ajuda.length];
        for (int k = 0; k < ajuda.length; k++ ){
            String inteiro = ajuda[k];
            int array = Integer.parseInt(inteiro);
            j[k] = array;
        }
        return j;
    }

    public static void printArray(Object array[]) {
        int n = array.length;
        for (int i=0; i<n; ++i) {
            System.out.print(array[i] + " ");
        }
        System.out.println();
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Sort ordenado = new Sort();
        Comparable [] ordena = ordenado.le_array();
        boolean sort = false;
        System.out.println("MergeSort ou HeapSort? ");
        String escolha = scanner.next();
        do {
            switch (escolha){
                case "HeapSort":
                    ordenado.heapsort(ordena);
                    System.out.println("O Array ordenado por HeapSort é: ");
                    printArray(ordena);
                    break;

                case "MergeSort":
                    ordenado.mergesort(ordena);
                    System.out.println("O Array ordenado por MergeSort é: ");
                    printArray(ordena);
                    break;

                default:
                    System.out.println("A opção escolhida não é válida! ");
                    System.out.println("MergeSort ou HeapSort? ");
                    escolha = scanner.next();
                    break;
            }
            for ( int h = 0; h<ordena.length - 2; h++){
                if (ordena[h].compareTo(ordena[h+2])>0){
                    sort = false;
                    break;
                }
                else
                    sort = true;
            }
        }while (!sort);



    }
}