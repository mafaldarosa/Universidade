package usables;

import java.util.ArrayList;

public class User_spaces {
        
    // ----- Usable vars -----
    private int userID;
    private ArrayList<Integer> spaceIDs;

    // ----- Constructor -----
    public User_space(int userID, ArrayList spaceIDs){
        this.userID = userID;
        this.spaceIDs = (ArrayList<Integer>) spaceIDs.clone();
    }
    
    // ----- Get Vars  -----
    public int getUserID(){
        return userID;
    }
    
    public ArrayList<Integer> getSpaceIDs(){
        return spaceIDs;
    }
    
    // ----- Set Vars  -----
    public void setUserID(int userID){
        this.userID = userID;
    }
    
    public void setSpaceIDs( ArrayList<Integer> spaceIDs){
        this.spaceIDs = (ArrayList<Integer>) spaceIDs.clone();
    }
}
