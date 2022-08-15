/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 13/07/2022    1.0        QuanNT          Comment
 */
package entity;

/**
 * @author This class represents the Blog table in database
 */
public class Blog {

    /* Blog BlogID */
    private int BlogID;
    /* Blog AccountID */
    private int AccountID;
    /* Blog BlogAuthor */
    private String BlogAuthor;
    /* Blog BlogDescription */
    private String BlogDescription;
    /* Blog BlogImage */
    private String BlogImage;
    /* Blog BlogDate */
    private String BlogDate;
    /* Blog BlogTitleString */
    private String BlogTitleString;

    /**
     * Blank Constructor
     */
    public Blog() {
    }

    /**
     * Complete Constructor
     *
     * @param AccountID
     * @param BlogAuthor
     * @param BlogDescription
     * @param BlogImage
     * @param BlogDate
     * @param BlogTitleString
     */
    public Blog(int BlogID, int AccountID, String BlogAuthor, String BlogDescription, String BlogImage, String BlogDate, String BlogTitleString) {
        this.BlogID = BlogID;
        this.AccountID = AccountID;
        this.BlogAuthor = BlogAuthor;
        this.BlogDescription = BlogDescription;
        this.BlogImage = BlogImage;
        this.BlogDate = BlogDate;
        this.BlogTitleString = BlogTitleString;
    }

    /**
     * @return BlogID
     */
    public int getBlogID() {
        return BlogID;
    }

    /**
     * Set AccountID
     *
     * @param BlogID
     */
    public void setBlogID(int BlogID) {
        this.BlogID = BlogID;
    }

    /**
     * @return AccountID
     */
    public int getAccountID() {
        return AccountID;
    }

    /**
     * Set AccountID
     *
     * @param AccountID
     */
    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    /**
     * @return BlogAuthor
     */
    public String getBlogAuthor() {
        return BlogAuthor;
    }

    /**
     * Set AccountID
     *
     * @param BlogAuthor
     */
    public void setBlogAuthor(String BlogAuthor) {
        this.BlogAuthor = BlogAuthor;
    }

    /**
     * @return BlogDescription
     */
    public String getBlogDescription() {
        return BlogDescription;
    }

    /**
     * Set AccountID
     *
     * @param BlogDescription
     */
    public void setBlogDescription(String BlogDescription) {
        this.BlogDescription = BlogDescription;
    }

    /**
     * @return BlogImage
     */
    public String getBlogImage() {
        return BlogImage;
    }

    /**
     * Set AccountID
     *
     * @param BlogImage
     */
    public void setBlogImage(String BlogImage) {
        this.BlogImage = BlogImage;
    }

    /**
     * @return BlogDate
     */
    public String getBlogDate() {
        return BlogDate;
    }

    /**
     * Set AccountID
     *
     * @param BlogDate
     */
    public void setBlogDate(String BlogDate) {
        this.BlogDate = BlogDate;
    }

    /**
     * @return BlogTitleString
     */
    public String getBlogTitleString() {
        return BlogTitleString;
    }

    /**
     * Set AccountID
     *
     * @param BlogTitleString
     */
    public void setBlogTitleString(String BlogTitleString) {
        this.BlogTitleString = BlogTitleString;
    }

    @Override
    public String toString() {
        return "Blog{" + "BlogID=" + BlogID + ", AccountID=" + AccountID + ", BlogAuthor=" + BlogAuthor + ", BlogDescription=" + BlogDescription + ", BlogImage=" + BlogImage + ", BlogDate=" + BlogDate + ", BlogTitleString=" + BlogTitleString + '}';
    }

}
