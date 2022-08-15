/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 
 */
package entity;


public class Device {
        private int DeviceID;
        private int RoomID;
	private String DeviceName;
	private int DeviceCate;
	private double Price;
	private int Status;
        private int Quantity ;
        private String Note;
        String Imagedevice;

    public Device(int DeviceID, int RoomID, String DeviceName, int DeviceCate, double Price, int Status, int Quantity, String Note, String Imagedevice) {
        this.DeviceID = DeviceID;
        this.RoomID = RoomID;
        this.DeviceName = DeviceName;
        this.DeviceCate = DeviceCate;
        this.Price = Price;
        this.Status = Status;
        this.Quantity = Quantity;
        this.Note = Note;
        this.Imagedevice = Imagedevice;
    }

    public Device(String DeviceName, int Quantity) {
        this.DeviceName = DeviceName;
        this.Quantity = Quantity;
    }

    public Device() {
    }

    public int getDeviceID() {
        return DeviceID;
    }

    public void setDeviceID(int DeviceID) {
        this.DeviceID = DeviceID;
    }

    public int getRoomID() {
        return RoomID;
    }

    public void setRoomID(int RoomID) {
        this.RoomID = RoomID;
    }

    public String getDeviceName() {
        return DeviceName;
    }

    public void setDeviceName(String DeviceName) {
        this.DeviceName = DeviceName;
    }

    public int getDeviceCate() {
        return DeviceCate;
    }

    public void setDeviceCate(int DeviceCate) {
        this.DeviceCate = DeviceCate;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public String getNote() {
        return Note;
    }

    public void setNote(String Note) {
        this.Note = Note;
    }

    public String getImagedevice() {
        return Imagedevice;
    }

    public void setImagedevice(String Imagedevice) {
        this.Imagedevice = Imagedevice;
    }

    @Override
    public String toString() {
        return "Device{" + "DeviceID=" + DeviceID + ", RoomID=" + RoomID + ", DeviceName=" + DeviceName + ", DeviceCate=" + DeviceCate + ", Price=" + Price + ", Status=" + Status + ", Quantity=" + Quantity + ", Note=" + Note + ", Imagedevice=" + Imagedevice + '}';
    }

}
