/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 * 16/07/2022    1.0        HieuLBM          First Deploy
 * 16/07/2022    1.0        HieuLBM          Comment
 */
package entity;

import java.sql.Date;

/**
 *
 * @author HieuLBM
 */
public class View {

    /* View date */
    private Date date;
    /* View view */
    private int view;

    /**
     * Blank Constructor
     */
    public View() {
    }

    /**
     * Complete Constructor
     *
     * @param date
     * @param view
     */
    public View(Date date, int view) {
        this.date = date;
        this.view = view;
    }

    /**
     * @return date
     */
    public Date getDate() {
        return date;
    }

    /**
     * Set date
     *
     * @param date
     */
    public void setDate(Date date) {
        this.date = date;
    }

    /**
     * @return view
     */
    public int getView() {
        return view;
    }

    /**
     * Set view
     *
     * @param view
     */
    public void setView(int view) {
        this.view = view;
    }

}
