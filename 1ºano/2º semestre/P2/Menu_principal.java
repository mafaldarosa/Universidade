import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * Created by Manuel on 11/06/2016.
 */
public class Menu_principal extends JFrame implements ActionListener{

        private int FRAME_WIDTH = 500;
        private int FRAME_HEIGHT = 350;
        private int FRAME_X_ORIGIN = 250;
        private int FRAME_Y_ORIGIN = 350;
        private int BUTTON_WIDTH = 100;
        private int BUTTON_HEIGHT = 30;
        private int size;

        private JButton exitButton;
        private JButton newgameButton;
        private JButton creditsButton;
        public Menu_principal() {

        Container contentPane = getContentPane();
        setTitle("Smoothy");
        setSize(FRAME_WIDTH, FRAME_HEIGHT);
        setResizable(false);
        setLocation(FRAME_X_ORIGIN, FRAME_Y_ORIGIN);
        contentPane.setLayout(null);
        contentPane.setBackground(new Color(255,140,0));
        //ImageIcon img = new ImageIcon("C:/Users/Manuel/Desktop/Icon.png");
        //Menu_Principal().setIconImage(img.getImage());
        newgameButton = new JButton("NEW GAME");
        newgameButton.setBounds(200, 87, BUTTON_WIDTH, BUTTON_HEIGHT);
        newgameButton.addActionListener(this);
        contentPane.add(newgameButton);
        creditsButton = new JButton("CREDITS");
        creditsButton.setBounds(200, 145, BUTTON_WIDTH, BUTTON_HEIGHT);
        creditsButton.addActionListener(this);
        contentPane.add(creditsButton);
        exitButton = new JButton("EXIT");
        exitButton.setBounds(200, 200, BUTTON_WIDTH, BUTTON_HEIGHT);
        exitButton.addActionListener(this);
        contentPane.add(exitButton);

        setDefaultCloseOperation(EXIT_ON_CLOSE);

    }

    public void actionPerformed(ActionEvent event) {
        if (event.getSource() instanceof JButton) {
            JButton clickedButton = (JButton) event.getSource();
            System.out.println(clickedButton.getText());
            if (clickedButton.getText().equals("NEW GAME")) {
                JFrame frame = new JFrame("set size");
                String code = JOptionPane.showInputDialog(
                        frame,
                        "Enter Game Size",
                        "Game Size",
                        JOptionPane.WARNING_MESSAGE);
                try{
                    int input = Integer.parseInt(code);
                    String value = String.valueOf(input);
                    int result = Integer.parseInt(value);
                    if(result>1 && result<=30){
                        Tabuleiro a = new Tabuleiro(result);
                    }else {
                        final JPanel panel2 = new JPanel();
                        JOptionPane.showMessageDialog(panel2, "Invalid Input", "Size Error", JOptionPane.ERROR_MESSAGE);
                        JOptionPane.showMessageDialog(null, "Set Size");
                        JFrame frame2 = new JFrame("set size");
                        String code2 = JOptionPane.showInputDialog(
                                frame2,
                                "Enter Game Size",
                                "Game Size",
                                JOptionPane.WARNING_MESSAGE);
                    }

                }catch (NumberFormatException ex) {
                    final JPanel panel = new JPanel();
                    JOptionPane.showMessageDialog(panel, "Invalid Input", "Size Error", JOptionPane.ERROR_MESSAGE);
                }


            }

            if (clickedButton.getText().equals("CREDITS")) {
                JOptionPane.showMessageDialog(null, "\nUniversidade de Évora\n"
                        + "Escola de Ciências e Tecnologias\n"
                        + "Licenciatura de Engenharia Informática\n"
                        + "Programação II\n"
                        + "\nBy:\n"
                        + "Manuel Lopes 35169\n"
                        + "Gonçalo Silva 35154");
            }

            if (clickedButton.getText().equals("EXIT")) {
                System.exit(0);

            }
        }
    }
}

