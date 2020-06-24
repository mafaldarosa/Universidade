import java.util.*;


public class Menu {
    int tamanho;
    Scanner sc = new Scanner(System.in);
    Random r = new Random();
    Tabuleiro tab;

    //Opcoes menu
    public void options () {
        int option =0;
        System.out.println("Escolha a opcao pretendida:");
        System.out.println("1 - Jogo ");
        System.out.println("2 - Creditos");
        System.out.println("3 - Sair do jogo");
        while (option < 1 || option > 3) {
            try{
                option = sc.nextInt();

                if (option==1){
                    int lista[] = new int [2];
                    lista=tabInputs();
                    this.tab = new Tabuleiro(lista[0], lista[1]);
                    this.jogo();
                }

                if (option==2){
                    this.creditos();
                    this.options();
                }
                if(option==3){
                    return;
                }
            }catch(InputMismatchException exception){
                System.out.println("\nPor favor insira um numero\n");
                sc.next();
            }
        }
    }

    void creditos(){
        System.out.println("\nTrabalho realizado por:");
        System.out.println("Maria Correia 39836");
        System.out.println("Mafalda Rosa 40021 \n");

    }

    int [] tabInputs(){
        int tamanho =0;
        int cores =0;
        int [] lista = new int [2];
        while (true){
            try{

                System.out.println("Insira o tamanho do tabuleiro:");
                tamanho = sc.nextInt();
                System.out.println("Insira o numero de cores do tabuleiro:");
                cores = sc.nextInt();

            }catch(InputMismatchException exception){
                sc.next();
                System.out.println("\nPor favor insira numeros\n");
            }
            if (tamanho >= 5 && tamanho <= 15 && cores <=9 && cores >=2 && cores<=tamanho-1){
                break;
            }else{
                System.out.println("Insira valores validos\n");
            }
        }
        this.tamanho=tamanho;
        lista[0]=tamanho;
        lista[1]=cores;

        return lista ;
    }

    int [] coordenadas(){
        int x = 0;
        int y = 0;
        int [] coordenadas = new int [2];
        boolean var = true;
        while (var){
            try{
                System.out.println("Insira a posicao x:");
                x = sc.nextInt();

                System.out.println("Insira a posicao y:");
                y = sc.nextInt();

            }catch(InputMismatchException e){
                System.out.println("Por favor insira numeros");
                sc.next();
            }
            if (y>-1 && y<tamanho && x>-1 && x<tamanho){
                var=false;
            }else{
                System.out.println("Insira coordenadas dentro do tabuleiro");
            }
        }
        coordenadas[0]=x;
        coordenadas[1]=y;
        return coordenadas;
    }

    void jogo(){

        tab.printTabuleiro();

        while (!tab.fim_de_jogo()){
            int [] xy = new int [2];
            int coords[][]=new int [tamanho*tamanho][2];
            for (int i=0; i<coords.length; i++){
                coords[i][0]=33;
                coords[i][1]=33;
            }
            xy= this.coordenadas();
            int x= xy[0];
            int y= xy[1];

            coords = tab.verifica_vizinhos(x, y, coords);
            if (tab.verifica_pos(x,y,coords)){
                tab.jogadas(coords);
                tab.printTabuleiro();
            }else{
                System.out.println("A posicao e invalida");
            }
        }
        System.out.println("O jogo terminou");
        System.out.println("A sua pontuacao foi:" + tab.pontos());

    }




    public static void main(String[] args) {
        Menu menu = new Menu();
        menu.options();

    }

}


