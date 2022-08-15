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
 * @author This class represents the MessageRequest table in database
 */
public class Post {

    /* Post  Id */
    private int PostID;
    /* Post  AccountID */
    private int AccountID;
    /* Post  PostAuthor */
    private String PostAuthor;
    /* Post  PostDescription */
    private String PostDescription;
    /* Post  PostImage */
    private String PostImage;
    /* Post  PostDate */
    private String PostDate;
    /* Post  BlogTitle*/
    private String BlogTitle;

    /**
     * Blank Constructor
     */
    public Post() {
    }

    /**
     * Complete Constructor
     *
     * @param PostID
     * @param AccountID
     * @param PostAuthor
     * @param PostDescription
     * @param PostImage
     * @param PostDate
     * @param BlogTitle
     */
    public Post(int PostID, int AccountID, String PostAuthor, String PostDescription, String PostImage, String PostDate, String BlogTitle) {
        this.PostID = PostID;
        this.AccountID = AccountID;
        this.PostAuthor = PostAuthor;
        this.PostDescription = PostDescription;
        this.PostImage = PostImage;
        this.PostDate = PostDate;
        this.BlogTitle = BlogTitle;
    }

}
