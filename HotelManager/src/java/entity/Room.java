/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy

 * 18/07/2022    1.0        HieuHT            Comment
 * 19/07/2022    1.0        HieuLBM          Comment

 */
package entity;

/**

 * @author This class represents the Events table in database
 */
public class Room {

    /* Room Id */
    private int RoomID;
    /* Room name */
    private String Roomname;
    /* Room desc */
    private String Roomdesc;
    /* Room cateId */
    private int RoomcateID;
    /* image */
    private String image;
    /* Room price */
    private double Roomprice;
    /* Room NumberPerson */
    private int NumberPerson;
    /* Room Square */
    private float Square;
    /* Room Comment */
    private String Comment;
    /* Room Rate */
    private int Rate;
    /* Room Note */
    private String Note;
    /* Room cateroom */
    private String cateroom;
    /* Room status */
    private int status;
    /* Room Sumstatus */
    private int Sumstatus;

    /**
     * Blank Constructor
     */
    public Room() {
    }

    /**

     * Complete Constructor
     *
     * @param RoomID
     * @param Roomname
     * @param Roomdesc
     * @param RoomcateID
     * @param image
     * @param Roomprice
     * @param NumberPerson
     * @param Square
     * @param Comment
     * @param Rate
     * @param Note
     * @param cateroom
     */
    public Room(int RoomID, String Roomname, String Roomdesc, int RoomcateID, String image, double Roomprice, int NumberPerson, float Square, String Comment, int Rate, String Note, String cateroom) {
        this.RoomID = RoomID;
        this.Roomname = Roomname;
        this.Roomdesc = Roomdesc;
        this.RoomcateID = RoomcateID;
        this.image = image;
        this.Roomprice = Roomprice;
        this.NumberPerson = NumberPerson;
        this.Square = Square;
        this.Comment = Comment;
        this.Rate = Rate;
        this.Note = Note;
        this.cateroom = cateroom;
    }

    /**
     * Complete Constructor
     *
     * @param RoomID
     * @param Roomname
     * @param Roomdesc
     * @param RoomcateID
     * @param image
     * @param Roomprice
     * @param NumberPerson
     * @param Square
     * @param Comment
     * @param Rate
     * @param Note
     * @param status
     */
    public Room(int RoomID, String Roomname, String Roomdesc, int RoomcateID, String image, double Roomprice, int NumberPerson, float Square, String Comment, int Rate, String Note, int status) {
        this.RoomID = RoomID;
        this.Roomname = Roomname;
        this.Roomdesc = Roomdesc;
        this.RoomcateID = RoomcateID;
        this.image = image;
        this.Roomprice = Roomprice;
        this.NumberPerson = NumberPerson;
        this.Square = Square;
        this.Comment = Comment;
        this.Rate = Rate;
        this.Note = Note;
        this.status = status;
    }

    /**
     * Complete Constructor
     *
     * @param RoomID
     * @param Roomname
     * @param Roomdesc
     * @param RoomcateID
     * @param image
     * @param Roomprice
     * @param NumberPerson
     * @param Square
     * @param Comment
     * @param Rate
     * @param Note
     * @param cateroom
     * @param status
     */
    public Room(int RoomID, String Roomname, String Roomdesc, int RoomcateID, String image, double Roomprice, int NumberPerson, float Square, String Comment, int Rate, String Note, String cateroom, int status) {
        this.RoomID = RoomID;
        this.Roomname = Roomname;
        this.Roomdesc = Roomdesc;
        this.RoomcateID = RoomcateID;
        this.image = image;
        this.Roomprice = Roomprice;
        this.NumberPerson = NumberPerson;
        this.Square = Square;
        this.Comment = Comment;
        this.Rate = Rate;
        this.Note = Note;
        this.cateroom = cateroom;
        this.status = status;
    }

    /**
     * Complete Constructor
     *
     * @param RoomID
     * @param Roomname
     * @param Roomdesc
     * @param RoomcateID
     * @param Roomprice
     * @param NumberPerson
     * @param Square
     * @param Comment
     * @param Rate
     * @param Note
     * @param status
     */
    public Room(int RoomID, String Roomname, String Roomdesc, int RoomcateID, double Roomprice, int NumberPerson, float Square, String Comment, int Rate, String Note, int status) {
        this.RoomID = RoomID;
        this.Roomname = Roomname;
        this.Roomdesc = Roomdesc;
        this.RoomcateID = RoomcateID;
        this.Roomprice = Roomprice;
        this.NumberPerson = NumberPerson;
        this.Square = Square;
        this.Comment = Comment;
        this.Rate = Rate;
        this.Note = Note;
        this.status = status;
    }

    /**
     * Complete Constructor
     *
     * @param status
     * @param Sumstatus
     */
    public Room(int status, int Sumstatus) {
        this.status = status;
        this.Sumstatus = Sumstatus;
    }

    /**
     * @return Sumstatus
     */
    public int getSumstatus() {
        return Sumstatus;
    }

    /**
     * Set Sumstatus
     *
     * @param Sumstatus
     */
    public void setSumstatus(int Sumstatus) {
        this.Sumstatus = Sumstatus;
    }
    /**
     * @return status
     */
    public int getStatus() {
        return status;
    }

    /**
     * Set status
     *
     * @param status
     */
    public void setStatus(int status) {
        this.status = status;
    }

    /**
     * @return RoomID
     */
    public int getRoomID() {
        return RoomID;
    }

    /**
     * Set RoomID
     *
     * @param RoomID
     */
    public void setRoomID(int RoomID) {
        this.RoomID = RoomID;
    }

    /**
     * @return Roomname
     */
    public String getRoomname() {
        return Roomname;
    }

    /**
     * Set Roomname
     *
     * @param Roomname
     */
    public void setRoomname(String Roomname) {
        this.Roomname = Roomname;
    }

    /**
     * @return Roomdesc
     */
    public String getRoomdesc() {
        return Roomdesc;
    }

    /**
     * Set Roomdesc
     *
     * @param Roomdesc
     */
    public void setRoomdesc(String Roomdesc) {
        this.Roomdesc = Roomdesc;
    }

    /**
     * @return RoomcateID
     */
    public int getRoomcateID() {
        return RoomcateID;
    }

    /**
     * Set RoomcateID
     *
     * @param RoomcateID
     */
    public void setRoomcateID(int RoomcateID) {
        this.RoomcateID = RoomcateID;
    }

    /**
     * @return image
     */
    public String getImage() {
        return image;
    }

    /**
     * Set image
     *
     * @param image
     */
    public void setImage(String image) {
        this.image = image;
    }

    /**
     * @return Roomprice
     */
    public double getRoomprice() {
        return Roomprice;
    }

    /**
     * Set Roomprice
     *
     * @param Roomprice
     */
    public void setRoomprice(double Roomprice) {
        this.Roomprice = Roomprice;
    }

    /**
     * @return NumberPerson
     */
    public int getNumberPerson() {
        return NumberPerson;
    }

    /**
     * Set NumberPerson
     *
     * @param NumberPerson
     */
    public void setNumberPerson(int NumberPerson) {
        this.NumberPerson = NumberPerson;
    }

    /**
     * @return Square
     */
    public float getSquare() {
        return Square;
    }

    /**
     * Set Square
     *
     * @param Square
     */
    public void setSquare(float Square) {
        this.Square = Square;
    }

    /**
     * @return Comment
     */
    public String getComment() {
        return Comment;
    }

    /**
     * Set Comment
     *
     * @param Comment
     */
    public void setComment(String Comment) {
        this.Comment = Comment;
    }

    /**
     * @return Rate
     */
    public int getRate() {
        return Rate;
    }

    /**
     * Set Rate
     *
     * @param Rate
     */
    public void setRate(int Rate) {
        this.Rate = Rate;
    }

    /**
     * @return Note
     */
    public String getNote() {
        return Note;
    }

    /**
     * Set Note
     *
     * @param Note
     */
    public void setNote(String Note) {
        this.Note = Note;
    }

    /**
     * @return cateroom
     */
    public String getCateroom() {
        return cateroom;
    }

    /**
     * Set cateroom
     *
     * @param cateroom
     */
    public void setCateroom(String cateroom) {
        this.cateroom = cateroom;
    }


    @Override
    public String toString() {
        return "Room{" + "RoomID=" + RoomID + ", Roomname=" + Roomname + ", Roomdesc=" + Roomdesc + ", RoomcateID=" + RoomcateID + ", image=" + image + ", Roomprice=" + Roomprice + ", NumberPerson=" + NumberPerson + ", Square=" + Square + ", Comment=" + Comment + ", Rate=" + Rate + ", Note=" + Note + "Cateroom=" + cateroom + "status=" + status + '}';//To change body of generated methods, choose Tools | Templates.
    }

    public String toString1() {
        return RoomcateID + cateroom + "status=" + status + '}';//To change body of generated methods, choose Tools | Templates.
    }

}
