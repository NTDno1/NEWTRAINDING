/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 19/07/2022    1.0        HieuLBM       Comment
 */
package entity;

import java.sql.Date;
/**
 * @author 
 * This class represents the User table in database
 */
public class RoomByDate {
    /* RoomByDate RoomID */
    int RoomID;
    /* RoomByDate Roomname */
    String Roomname;
    /* RoomByDate Roomdesc */
    String Roomdesc;
    /* RoomByDate RoomcateID */
    int RoomcateID;
    /* RoomByDate image */
    String image;
    /* RoomByDate Roomprice */
    double Roomprice;
    /* RoomByDate NumberPerson */
    int NumberPerson;
    /* RoomByDate Square */
    float Square;
    /* RoomByDate Comment */
    String Comment;
    /* RoomByDate Rate */
    int Rate;
    /* RoomByDate Note */
    String Note;
    /* RoomByDate cateroom */
    String cateroom;
    /* RoomByDate DatetIn */
    Date DatetIn;
    /* RoomByDate DatetOut */
    Date DatetOut;

    /**
     * Blank Constructor
     */
    public RoomByDate() {
    }
   /**
     * Complete Constructor
     *
     * @param RoomID
     * @param Roomname
     * @param  Roomdesc
     * @param RoomcateID
     * @param image
     * @param Roomprice
     * @param NumberPerson
     * @param Square
     * @param Comment
     * @param Rate
     * @param Note
     * @param cateroom
     * @param DatetIn
     * @param DatetOut
     */
    public RoomByDate(int RoomID, String Roomname, String Roomdesc, int RoomcateID, String image, double Roomprice, int NumberPerson, float Square, String Comment, int Rate, String Note, String cateroom, Date DatetIn, Date DatetOut) {
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
        this.DatetIn = DatetIn;
        this.DatetOut = DatetOut;
    }
/**
     * @return RoomID
     */
    public int getRoomID() {
        return RoomID;
    }
   /**
     * Set RoomID
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
     * @param cateroom
     */
    public void setCateroom(String cateroom) {
        this.cateroom = cateroom;
    }
/**
     * @return DatetIn
     */
    public Date getDatetIn() {
        return DatetIn;
    }
   /**
     * Set DatetIn
     * @param DatetIn
     */
    public void setDatetIn(Date DatetIn) {
        this.DatetIn = DatetIn;
    }
/**
     * @return DatetOut
     */
    public Date getDatetOut() {
        return DatetOut;
    }
   /**
     * Set DatetOut
     * @param DatetOut
     */
    public void setDatetOut(Date DatetOut) {
        this.DatetOut = DatetOut;
    }
    
}
