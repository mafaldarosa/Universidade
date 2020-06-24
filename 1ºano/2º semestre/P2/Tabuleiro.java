/**
 * Created by Manuel & Gonçalo on 27/04/2016.
 */

import java.util.*;
import java.awt.FlowLayout;
import javax.swing.*;
import java.awt.GridLayout;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;


public class Tabuleiro {

    private int remaining = 0;
    private int size, cor;
    private String corStr;
    private int[][] matriz;
    int scr = 0;

    public Tabuleiro(int size) {

        int matrix[][] = new int[size][size];
        this.matriz = matrix;
        Jogada jogada = new Jogada(size);

        Random r = new Random();
        JFrame frame = new JFrame("Smoothy");
        frame.setSize(765, 790);
        frame.setLayout(null);
        JPanel panel = new JPanel(new GridLayout(size, size));
        ImageIcon img = new ImageIcon("C:/Users/Manuel/Desktop/Icon.png");
        frame.setIconImage(img.getImage());
        frame.setLocationRelativeTo(null);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        JButton[][] button = new JButton[size][size];

        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {

                cor = r.nextInt(5) + 1;

                if (i >= 0 && j >= 0 && i <= size + 1 && j <= size + 1) {
                    matriz[i][j] = cor;
                }

                if (i < size && j < size) {
                    button[i][j] = new JButton("");
                }

                if (cor == 1 && i < size && j < size) {
                    button[i][j].setBackground(new Color(124, 252, 0));
                }
                if (cor == 2 && i < size && j < size) {
                    button[i][j].setBackground(new Color(30, 144, 255));
                }
                if (cor == 3 && i < size && j < size) {
                    button[i][j].setBackground(Color.RED);
                }
                if (cor == 4 && i < size && j < size) {
                    button[i][j].setBackground(new Color(255, 140, 0));
                }
                if (cor == 5 && i < size && j < size) {
                    button[i][j].setBackground(Color.YELLOW);
                }


                if (i < size && j < size) {

                    panel.add(button[i][j]);

                    button[i][j].addActionListener(new ActionListener() {

                        public void actionPerformed(ActionEvent e) {
                            JButton clicked = (JButton) e.getSource();
                            Container parent = clicked.getParent();
                            clicked.setBackground(Color.WHITE);
                            int x = 0;
                            int y = 0;

                            for (int i = 0; i < size; i++) {
                                for (int j = 0; j < size; j++) {
                                    if (clicked == button[i][j]) {
                                        x = i + 1;
                                        y = j + 1;
                                        matriz[i][j]=0;
                                        System.out.print(matriz[i][j]);
                                        System.out.print(matriz);

                                    }
                                }System.out.println();
                            }

                            verifica_vizinhos();


                        }
                    });
                }
            }
        }


        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                System.out.print(matriz[i][j]);
            }
            System.out.println();
        }
        frame.add(panel);
        panel.setSize(750, 750);
        frame.setVisible(true);
    }


    public void verifica_vizinhos() {
        int verVizinho = 0;

        for (int x = 0; x < matriz.length; x++) {
            for (int y = 0; y < matriz[0].length; y++) {
                if (matriz[x][y] == matriz[0][0]) {//caso 1
                    if (matriz[x][y] == matriz[1][0]) {
                        verVizinho = 1;
                    }
                    if (matriz[x][y] == matriz[0][1]) {
                        verVizinho = 1;
                    }
                } else if (matriz[x][y] == matriz[x][0] && x > 0 && x < matriz.length - 1) {//caso 2
                    if (matriz[x][y] == matriz[x + 1][y]) {//direita
                        verVizinho = 1;
                    }
                    if (matriz[x][y] == matriz[x - 1][0]) {//esquerda
                        verVizinho = 1;
                    }

                    if (matriz[x][y] == matriz[x][1]) {//baixo
                        verVizinho = 1;
                    }
                } else if (matriz[x][y] == matriz[matriz.length - 1][0]) {//caso 3

                    if (matriz[x][y] == matriz[matriz.length - 1][0]) {//esquerda
                        verVizinho = 1;
                    }

                    if (matriz[x][y] == matriz[matriz.length - 1][1]) {//baixo
                        verVizinho = 1;
                    }
                } else if (matriz[x][y] == matriz[0][y] && y > 0 && y < matriz.length - 1) {//caso 4

                    if (matriz[x][y] == matriz[1][y]) {//direita
                        verVizinho = 1;
                    }
                    if (matriz[x][y] == matriz[0][y + 1]) {//baixo
                        verVizinho = 1;
                    }
                    if (matriz[x][y] == matriz[0][y - 1]) {//cima
                        verVizinho = 1;
                    }
                } else if (matriz[x][y] == matriz[matriz.length - 1][y] && y > 0 && y < matriz.length - 1) {//caso 5

                    if (matriz[x][y] == matriz[matriz.length - 1][y]) {//esquerda
                        verVizinho = 1;
                    }
                    if (matriz[x][y] == matriz[matriz.length - 1][y + 1]) {//baixo
                        verVizinho = 1;
                    }
                    if (matriz[x][y] == matriz[matriz.length - 1][y - 1]) {//cima
                        verVizinho = 1;
                    }
                } else if (matriz[x][y] == matriz[0][matriz.length - 1]) {//caso 6

                    if (matriz[x][y] == matriz[1][matriz.length - 1]) {//direita
                        verVizinho = 1;
                    }

                    if (matriz[x][y] == matriz[0][matriz.length - 2]) {//cima
                        verVizinho = 1;
                    }
                } else if (matriz[x][y] == matriz[x][matriz.length - 1] && x > 0 && x < matriz.length - 1) {//caso 7

                    if (matriz[x][y] == matriz[x - 1][matriz.length - 1]) {//esquerda
                        verVizinho = 1;
                    }
                    if (matriz[x][y] == matriz[x + 1][matriz.length - 1]) {//direita
                        verVizinho = 1;
                    }
                    if (matriz[x][y] == matriz[x][matriz.length - 2]) {//cima
                        verVizinho = 1;
                    }
                } else if (matriz[x][y] == matriz[matriz.length - 1][matriz.length - 1]) {//caso 8

                    if (matriz[x][y] == matriz[matriz.length - 2][matriz.length - 1]) {//esquerda
                        verVizinho = 1;
                    }
                    if (matriz[x][y] == matriz[matriz.length - 1][matriz.length - 2]) {//cima
                        verVizinho = 1;
                    }
                } else {
                    if (matriz[x][y] == matriz[x + 1][y]) {
                        verVizinho = 1;
                    }
                    if (matriz[x][y] == matriz[x - 1][y]) {
                        verVizinho = 1;
                    }
                    if (matriz[x][y] == matriz[x][y + 1]) {
                        verVizinho = 1;
                    }
                    if (matriz[x][y] == matriz[x][y - 1]) {
                        verVizinho = 1;
                    }

                }
            }
        }


    }
    public void score() {
        scr=size*size-remaining;
        JFrame frame = new JFrame("Score");
        JOptionPane.showMessageDialog(null, "Score:" + " " + scr);
    }

}
