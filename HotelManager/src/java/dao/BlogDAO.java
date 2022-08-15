/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 15/07/2022    1.0        QuanNT            Comment
 */
package dao;

import entity.Blog;
import java.util.List;
import java.util.Vector;
import entity.Comment;

/**
 * Lớp này chứa các interface của BlogDAOImpl
 *
 * @author QuanNT
 */
public interface BlogDAO {

    /**
     * Get all Blog from database
     *
     * @return a list of <code>Blog</code> objects
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    public Blog getBlogList(int bID);

    /**
     * update Blog from the Blog table
     *
     * @param BlogID is an String
     * @param BlogAuthor is an String
     * @param BlogDescription is an String
     * @param BlogTitleString is an String
     * @throws java.lang.Exception
     */
    public void updateBlog(String BlogID, String BlogAuthor, String BlogDescription, String BlogTitleString) throws Exception;

    /**
     * delete Blog from the Blog table
     *
     * @param BlogID is an String
     * @throws java.lang.Exception
     */
    public void deleteBlog(int bID);

    /**
     * select Blog based on id from the Blog table
     *
     * @return Vector
     * @throws java.lang.Exception
     */
    public Vector<Blog> getBlog(String sql) throws Exception;

    /**
     * select page from the Blog table
     *
     * @return Integer
     * @throws java.lang.Exception
     */
    public int getPage() throws Exception;

    /**
     * select Blog base on page from the Blog table
     *
     * @param n is an int
     * @return Vector
     * @throws java.lang.Exception
     */
    public Vector<Blog> getBlogByPage(int n) throws Exception;

    /**
     * select Blog base on page and sort by date asc from the Blog table
     *
     * @param n is an int
     * @return Vector
     * @throws java.lang.Exception
     */
    public Vector<Blog> getBlogByPagesortnew(int n) throws Exception;

    /**
     * select Blog base on page and sort by date desc from the Blog table
     *
     * @param n is an int
     * @return Vector
     * @throws java.lang.Exception
     */
   public Vector<Blog> getBlogByPagesortold(int n) throws Exception;
    /**
     * select Blog base on page and author from the Blog table
     *
     * @param n is an int
     * @param author is an String
     * @return Vector
     * @throws java.lang.Exception
     */
    public Vector<Blog> getBlogByPagesearch(int n, String author) throws Exception;
 /**
     * Insert data blog and insert to database
     *
     * @param AccountID is an Account
     * @param BlogAuthor is an String
     * @param BlogDescription is an String
      * @param BlogImage is an String
       * @param BlogTitle is an String
     * @throws java.lang.Exception
     */
    public void inSertBlog(int AccountID, String BlogAuthor, String BlogDescription, String BlogImage, String BlogTitle) throws Exception;
 /**
     * Delete blog and update to database
     * @param BlogID is an String
     * @throws java.lang.Exception
     */
    public void deleteBlog(String BlogID) throws Exception;
 /**
     * Select comment from BlogDetail
     *
     * @param BlogID is an String
     * @return List
     * @throws java.lang.Exception
     */
    public List<Comment> DisplayComment(String BlogID) throws Exception;
 /**
     Insert data comment and insert to database
     * @param content is an String
     * @param username is an String
     * @param BlogID is an String
     * @param ParentID is an String
     * @throws java.lang.Exception
     */
    public void InsertComment(String content, String username, String BlogID,String ParentID) throws Exception;
 /**
     * Insert command sql
     * @throws java.lang.Exception
     */
    public void crudImage(String sql) throws Exception;
 /**
     * Select blog base on id from blogtable
     *
     * @param BlogID is an String
     * @return Vector
     * @throws java.lang.Exception
     */
    public Vector<Blog> selectBlog(String BlogID) throws Exception;
 /**
     Select blogid base on command from blogtable
     * @return String
     * @throws java.lang.Exception
     */
    public String getBlogID(String sql) throws Exception;
 /**
     * Select username customer from Customertable
     *
     * @param AccountID is an String
     * @return String
     * @throws java.lang.Exception
     */
    public String selectUsername(String AccountID) throws Exception;
 /**
     * Select reply comment from Blogdetail
     * @param CommentID is an String
     * @return List
     * @throws java.lang.Exception
     */
    public List<Comment> DisplayCommenttt(String CommentID) throws Exception;
 /**
     * Delete comment parent and update to database
     * @param CommentID is an String
     * @param ParentID is an String
     * @throws java.lang.Exception
     */
    public void deleteCommentParent(String CommentID,String ParentID) throws Exception;
 /**
     * Delete comment base on id and update to database
     * @param CommentID is an String
     * @throws java.lang.Exception
     */
    public void deleteComment(String CommentID) throws Exception;
 /**
     * Update content comment base on commentid from commentlist
     * @param CommentID is an String
     * @param Content is an String   
     * @throws java.lang.Exception
     */
    public void updateContent(String CommentID, String Content) throws Exception;
 /**
     * Select blog base on blogid from blog table
     * @param BlogID is an String
     * @return object Blog
     * @throws java.lang.Exception
     */
   public Blog selectBlog1(String sql) throws Exception;
 /**
     * Displaycomment base on blogid 
     * @param BlogID is an String
     * @return List
     * @throws java.lang.Exception
     */
    public List<Comment> DisplayCommentBlog(String BlogID) throws Exception;
 /**
     * Display all comment base on blogid
     * @param BlogID is an String
     * @return List
     * @throws java.lang.Exception
     */
    public List<Comment> DisplayAllComment(String BlogID) throws Exception ;
 /**
     * Select comment base on comment parent and comment children
     * @throws java.lang.Exception
     */
   public int getComment(String BlogID) throws Exception;
 /**
     * Select page base on count of comment
     * @param n is an int
     * @return List
     * @throws java.lang.Exception
     */
   public List<Comment> getCommentByPage(int n,String BlogID) throws Exception;
}
