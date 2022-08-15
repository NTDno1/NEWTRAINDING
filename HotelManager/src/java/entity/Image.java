/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 19/07/2022    1.0        HieuLBM          Comment
 */
package entity;

/**
 * @author This class represents the RoleName table in database
 */
public class Image {

    /* Image Id */
    private int RoomimageID;
    /* Image 1 */
    private String image1;
    /* Image 2 */
    private String image2;
    /* Image 3 */
    private String image3;
    /* Image 4 */
    private String image4;

    /**
     * Blank Constructor
     */
    public Image() {
    }

    /**
     * Complete Constructor
     *
     * @param RoomimageID
     * @param image1
     * @param image2
     * @param image3
     * @param image4
     */
    public Image(int RoomimageID, String image1, String image2, String image3, String image4) {
        this.RoomimageID = RoomimageID;
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
        this.image4 = image4;
    }

    /**
     * Complete Constructor
     *
     * @param image1
     * @param image2
     * @param image3
     * @param image4
     */
    public Image(String image1, String image2, String image3, String image4) {
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
        this.image4 = image4;
    }

    /**
     * @return RoomimageID
     */
    public int getRoomimgaeID() {
        return RoomimageID;
    }

    /**
     * Set RoomimageID
     *
     * @param RoomimageID
     */
    public void setRoomimgaeID(int RoomimgaeID) {
        this.RoomimageID = RoomimgaeID;
    }

    /**
     * @return image1
     */
    public String getImage1() {
        return image1;
    }

    /**
     * Set image1
     *
     * @param image1
     */
    public void setImage1(String image1) {
        this.image1 = image1;
    }

    /**
     * @return image2
     */
    public String getImage2() {
        return image2;
    }

    /**
     * Set image2
     *
     * @param image2
     */
    public void setImage2(String image2) {
        this.image2 = image2;
    }

    /**
     * @return image3
     */
    public String getImage3() {
        return image3;
    }

    /**
     * Set image3
     *
     * @param image3
     */
    public void setImage3(String image3) {
        this.image3 = image3;
    }

    /**
     * @return image4
     */
    public String getImage4() {
        return image4;
    }

    /**
     * Set image4
     *
     * @param image4
     */
    public void setImage4(String image4) {
        this.image4 = image4;
    }
}
