package usables;

public class Entry {
    
    // ----- Usable vars -----
    private int EntryID;
    private java.sql.Timestamp entrydate;
    private int spaceID;
    private int userID;
    private String spaceOcup;
    private String uniqueCode;
    
    // ----- Constructor -----
    
    public Entry(String spaceOcup,java.sql.Timestamp entrydate, int spaceID, int userID){
        this.spaceOcup = spaceOcup
        this.entrydate = entrydate;
        this.spaceID = spaceID;
        this.userID = userID;
    }
    
    public Entry(String spaceOcup,int EntryID, java.sql.Timestamp entrydate, int spaceID){
        this.EntryID = EntryID;
        this.spaceOcup = spaceOcup
        this.entrydate = entrydate;
        this.spaceID = spaceID;
    }
    
    public Entry(String spaceOcup,int EntryID, java.sql.Timestamp entrydate, int spaceID, int userID){
        this.EntryID = EntryID;
        this.spaceOcup = spaceOcup;
        this.entrydate = entrydate;
        this.spaceID = spaceID;
        this.userID = userID;
    }
    
    // ----- Get Vars  -----
    public int getEntryID(){
        return EntryID;
    }
    
    public java.sql.Timestamp getEntrydate(){
        return entrydate;
    }
    
    public String getSpaceOcup(){
        return spaceOcup;
    }

    public int getSpaceID(){
        return spaceID;
    }
    
    public int getUserID(){
        return userID;
    }
    
    public String getUniqueCode(){
        return uniqueCode;
    }
    
    // ----- Set Vars  -----
    public void setEntryID(int EntryID){
        this.EntryID = EntryID;
    }
    
    public void setEntrydate(java.sql.Timestamp entrydate){
        this.entrydate = entrydate;
    }

    public String setSpaceOcup(String spaceOcup){
        this.spaceOcup = spaceOcup;
    }
    
    public void setSpaceID(int spaceID){
        this.spaceID = spaceID;
    }
    
    public void setUserID(int userID){
        this.userID = userID;
    }
    
    public void setUniqueCode(String uniqueCode){
        this.uniqueCode = uniqueCode;
    }
}
