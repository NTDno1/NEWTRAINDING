/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 13/07/2022    1.0        HieuLBM          Comment
 */
package entity;

/**
 * This class represents the Service table in database
 */
public class Service {

    /* Service Id */
    private int ServiceID;
    /* Service Name */
    private String ServiceName;
    /* Service Image */
    private String ServiceImage;
    /* Service Description */
    private String ServiceDes;
    /* Service Note */
    private String ServiceNote;
    /* Service Price */
    private double ServicePrice;

    /**
     * Blank Constructor
     */
    public Service() {
    }

    /**
     * Complete Constructor
     *
     * @param ServiceID
     * @param ServiceName
     * @param ServiceImage
     * @param ServiceDes
     * @param ServiceNote
     * @param ServicePrice
     */
    public Service(int ServiceID, String ServiceName, String ServiceImage, String ServiceDes, String ServiceNote, double ServicePrice) {
        this.ServiceID = ServiceID;
        this.ServiceName = ServiceName;
        this.ServiceImage = ServiceImage;
        this.ServiceDes = ServiceDes;
        this.ServiceNote = ServiceNote;
        this.ServicePrice = ServicePrice;
    }
    /**
     * @return ServiceID
     */
    public int getServiceID() {
        return ServiceID;
    }
     /**
     * Set ServiceID
     * @param ServiceID
     */
    public void setServiceID(int ServiceID) {
        this.ServiceID = ServiceID;
    }
     /**
     * @return ServiceName
     */
    public String getServiceName() {
        return ServiceName;
    }
     /**
     * Set ServiceName
     * @param ServiceName
     */
    public void setServiceName(String ServiceName) {
        this.ServiceName = ServiceName;
    }
     /**
     * @return ServiceImage
     */
    public String getServiceImage() {
        return ServiceImage;
    }
     /**
     * Set ServiceImage
     * @param ServiceImage
     */
    public void setServiceImage(String ServiceImage) {
        this.ServiceImage = ServiceImage;
    }
     /**
     * @return ServiceDes
     */
    public String getServiceDes() {
        return ServiceDes;
    }
     /**
     * Set ServiceDes
     * @param ServiceDes
     */
    public void setServiceDes(String ServiceDes) {
        this.ServiceDes = ServiceDes;
    }
     /**
     * @return ServiceNote
     */
    public String getServiceNote() {
        return ServiceNote;
    }
     /**
     * Set ServiceNote
     * @param ServiceNote
     */
    public void setServiceNote(String ServiceNote) {
        this.ServiceNote = ServiceNote;
    }
     /**
     * @return ServicePrice
     */
    public double getServicePrice() {
        return ServicePrice;
    }
     /**
     * Set ServicePrice
     * @param ServicePrice
     */
    public void setServicePrice(double ServicePrice) {
        this.ServicePrice = ServicePrice;
    }
}
