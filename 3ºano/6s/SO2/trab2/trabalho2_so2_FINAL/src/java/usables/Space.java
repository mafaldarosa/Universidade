package usables;

public class Space {
    
    // ----- Usable vars -----
    private int spaceID;
    private String spaceOcup;

    // ----- Constructor -----
    public Space(String spaceOcup){
        this.spaceOcup = spaceOcup;
    }
    
    public Space(int spaceID, String spaceOcup){
        this.spaceID = spaceID;
        this.spaceOcup = spaceOcup;
    }
    
    // ----- Get Vars  -----
    public int getSpaceID(){
        return spaceID;
    }
    
    public String getSpaceOcup(){
        return spaceOcup;
    }
    
    // ----- Set Vars  -----
    public void setSpaceID(int spaceID){
        this.spaceID = spaceID;
    }
    
    public void setSpaceOcup(String spaceOcup){
        this.spaceOcup = spaceOcup;
    }
}
