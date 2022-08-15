/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 13/07/2022    1.0        HieuLBM          Comment
 * 18/07/2022    1.0        HieuHT           Comment
 */
package entity;

import java.sql.Date;

/**
 *
 * This class represents the User table in database
 */
public class Reservation {

    /* Reservation BillID */
    private int BillID;
    /* Reservation UserID */
    private int UserID;
    /* Reservation RoomID */
    private int RoomID;
    /* Reservation Roomname */
    private String Roomname;
    private String img;
    /*Reservation Roomprice */
    private double Roomprice;
    /*Reservation Name */
    private String Name;
    /* Reservation ServiceName */
    private String ServiceName;
    /* Reservation Email */
    private String Email;
    /* Reservation Address*/
    private String Address;
    /* Reservation Phone */
    private String Phone;
    /* Reservation NumberOfPerson */
    private int NumberOfPerson;
    /* Reservation Checkin*/
    private Date Checkin;
    /* Reservation Checkout */
    private Date Checkout;
    /* Reservation Total */
    private double Total;
    /* Reservation  Status */
    private int Status;
    /* Reservation Year*/
    private int Year;
    /* Reservation Month */
    private int Month;
    /* Reservation Date */
    private Date Date;

    /**
     * Blank Constructor
     */
    public Reservation() {
    }

    /**
     * Complete Constructor
     *
     * @param BillID
     * @param UserID
     * @param Name
     * @param Address
     * @param Email
     * @param Phone
     * @param Checkin
     * @param Checkout
     * @param Roomprice
     * @param Total
     * @param Status
     */
    public Reservation(int BillID, int UserID, String Name, String Roomname, String Address, String Email, String Phone, Date Checkin, Date Checkout, double Roomprice, double Total, int Status) {
        this.BillID = BillID;
        this.UserID = UserID;
        this.Name = Name;
        this.Roomname = Roomname;
        this.Address = Address;
        this.Email = Email;
        this.Phone = Phone;
        this.Checkin = Checkin;
        this.Checkout = Checkout;
        this.Roomprice = Roomprice;
        this.Total = Total;
        this.Status = Status;
    }

    /**
     * Complete Constructor
     *
     * @param UserID
     * @param RoomID
     * @param Name
     * @param Email
     * @param Address
     * @param Phone
     * @param NumberOfPerson
     * @param Checkin
     * @param Checkout
     * @param Total
     * @param Status
     * @param Date
     */
    public Reservation(int UserID, int RoomID, String Name, String Email, String Address, String Phone, int NumberOfPerson, Date Checkin, Date Checkout, double Total, int Status, Date Date) {
        this.UserID = UserID;
        this.RoomID = RoomID;
        this.Name = Name;
        this.Email = Email;
        this.Address = Address;
        this.Phone = Phone;
        this.NumberOfPerson = NumberOfPerson;
        this.Checkin = Checkin;
        this.Checkout = Checkout;
        this.Total = Total;
        this.Status = Status;
        this.Date = Date;
    }

    /**
     * Complete Constructor
     *
     * @param BillID
     * @param UserID
     * @param RoomID
     * @param Name
     * @param Email
     * @param Address
     * @param Phone
     * @param NumberOfPerson
     * @param Checkin
     * @param Checkout
     * @param Total
     * @param Status
     * @param Date
     */
    public Reservation(int BillID, int UserID, int RoomID, String Name, String Email, String Address, String Phone, int NumberOfPerson, Date Checkin, Date Checkout, double Total, int Status, Date Date) {
        this.BillID = BillID;
        this.UserID = UserID;
        this.RoomID = RoomID;
        this.Name = Name;
        this.Email = Email;
        this.Address = Address;
        this.Phone = Phone;
        this.NumberOfPerson = NumberOfPerson;
        this.Checkin = Checkin;
        this.Checkout = Checkout;
        this.Total = Total;
        this.Status = Status;
        this.Date = Date;
    }

    /**
     * Complete Constructor
     *
     * @param BillID
     * @param UserID
     * @param RoomID
     * @param Roomname
     * @param img
     * @param Name
     * @param Email
     * @param Address
     * @param Phone
     * @param NumberOfPerson
     * @param Checkin
     * @param Checkout
     * @param Total
     * @param Status
     * @param Date
     */
    public Reservation(int BillID, int UserID, int RoomID, String Roomname, String img, String Name, String Email, String Address, String Phone, int NumberOfPerson, Date Checkin, Date Checkout, double Total, int Status, Date Date) {
        this.BillID = BillID;
        this.UserID = UserID;
        this.RoomID = RoomID;
        this.Roomname = Roomname;
        this.img = img;
        this.Name = Name;
        this.Email = Email;
        this.Address = Address;
        this.Phone = Phone;
        this.NumberOfPerson = NumberOfPerson;
        this.Checkin = Checkin;
        this.Checkout = Checkout;
        this.Total = Total;
        this.Status = Status;
        this.Date = Date;
    }

    /**
     * Complete Constructor
     *
     * @param RoomID
     * @param Roomname
     * @param Total
     */
    public Reservation(int RoomID, String Roomname, double Total) {
        this.RoomID = RoomID;
        this.Roomname = Roomname;
        this.Total = Total;
    }

    /**
     * Complete Constructor
     *
     * @param Status
     * @param NumberOfPerson
     * @param Total
     */
    public Reservation(int Status, int NumberOfPerson, double Total) {
        this.Status = Status;
        this.NumberOfPerson = NumberOfPerson;
        this.Total = Total;
    }

    /**
     * Complete Constructor
     *
     * @param ServiceName
     * @param Total
     */
    public Reservation(String ServiceName, double Total) {
        this.ServiceName = ServiceName;
        this.Total = Total;
    }

    /**
     * Set Month
     *
     * @param Month
     */
    public void setMonth(int Month) {
        this.Month = Month;
    }

    /**
     * @return Month
     */
    public int getMonth() {
        return Month;
    }

    /**
     * @return ServiceName
     */
    public String getServiceName() {
        return ServiceName;
    }

    /**
     * Set ServiceName
     *
     * @param ServiceName
     */
    public void setServiceName(String ServiceName) {
        this.ServiceName = ServiceName;
    }

    /**
     * @return Year
     */
    public int getYear() {
        return Year;
    }

    /**
     * Set Year
     *
     * @param Year
     */
    public void setYear(int Year) {
        this.Year = Year;
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
     * @return Roomprice
     */
    public double getRoomprice() {
        return Roomprice;
    }

    /**
     * @return Roomimg
     */
    public String getImg() {
        return img;
    }

    /**
     * Set img
     *
     * @param img
     */
    public void setImg(String img) {
        this.img = img;
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
     * @return BillID
     */
    public int getBillID() {
        return BillID;
    }

    /**
     * Set BillID
     *
     * @param BillID
     */
    public void setBillID(int BillID) {
        this.BillID = BillID;
    }

    /**
     * @return UserID
     */
    public int getUserID() {
        return UserID;
    }

    /**
     * Set UserID
     *
     * @param UserID
     */
    public void setUserID(int UserID) {
        this.UserID = UserID;
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
     * @return Name
     */
    public String getName() {
        return Name;
    }

    /**
     * Set Name
     *
     * @param Name
     */
    public void setName(String Name) {
        this.Name = Name;
    }

    /**
     * @return Email
     */
    public String getEmail() {
        return Email;
    }

    /**
     * Set Email
     *
     * @param Email
     */
    public void setEmail(String Email) {
        this.Email = Email;
    }

    /**
     * @return Address
     */
    public String getAddress() {
        return Address;
    }

    /**
     * Set Address
     *
     * @param Address
     */
    public void setAddress(String Address) {
        this.Address = Address;
    }

    /**
     * @return Phone
     */
    public String getPhone() {
        return Phone;
    }

    /**
     * Set Phone
     *
     * @param Phone
     */
    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    /**
     * @return NumberOfPerson
     */
    public int getNumberOfPerson() {
        return NumberOfPerson;
    }

    /**
     * Set NumberOfPerson
     *
     * @param NumberOfPerson
     */
    public void setNumberOfPerson(int NumberOfPerson) {
        this.NumberOfPerson = NumberOfPerson;
    }

    /**
     * @return Checkin
     */
    public Date getCheckin() {
        return Checkin;
    }

    /**
     * Set Checkin
     *
     * @param Checkin
     */
    public void setCheckin(Date Checkin) {
        this.Checkin = Checkin;
    }

    /**
     * @return Checkout
     */
    public Date getCheckout() {
        return Checkout;
    }

    /**
     * Set Checkout
     *
     * @param Checkout
     */
    public void setCheckout(Date Checkout) {
        this.Checkout = Checkout;
    }

    /**
     * @return Total
     */
    public double getTotal() {
        return Total;
    }

    /**
     * Set Total
     *
     * @param Total
     */
    public void setTotal(double Total) {
        this.Total = Total;
    }

    /**
     * @return Status
     */
    public int getStatus() {
        return Status;
    }

    /**
     * Set Status
     *
     * @param Status
     */
    public void setStatus(int Status) {
        this.Status = Status;
    }

    /**
     * @return Date
     */
    public Date getDate() {
        return Date;
    }

    /**
     * Set Date
     *
     * @param Date
     */
    public void setDate(Date Date) {
        this.Date = Date;
    }
}
