package usables;

import java.util.ArrayList;

public class User {

    // ----- Usable vars -----
    private int userID;
    private String username;
    private String password;
    private ArrayList<Space> spaces = new ArrayList();

    // ----- Constructor -----
    public User(String username, String password, ArrayList<Space> spaces){
        this.username = username;
        this.password = password;
        for(int i =0; i<spaces.size(); i++){
            spaces.add(spaces.get(i));
        }
    }
    
    public User(String username, String password){
        this.username = username;
        this.password = password;
    }

    // ----- Get Vars  -----
    public int getUserID(){
        return userID;
    }
    public String getUsername(){
        return username;
    }

    public String getPassword(){
        return password;
    }


    public ArrayList<Space> getSpaces(){
        return spaces;
    }

    // ----- Set Vars  -----
    public void setUserID(int userID){
        this.userID = userID;
    }

    public void setUsername(String username){
        this.username = username;
    }

    public void setPassword(String password){
        this.password = password;
    }


    public void setSpaces(ArrayList<Space> spaces){
        this.spaces.clear();
        for(int i =0; i<spaces.size(); i++){
            this.spaces.add(spaces.get(i));
        };
    }
}