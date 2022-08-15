/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0        HieuLBM          First Deploy
 * 14/07/2022    1.0        HieuLBM          Comment
 */
package util;

import java.util.Random;

/**
 *
 * @author HieuLBM
 */
public class randomPassword {

    /* characters a-z */
    private static final String alpha = "abcdefghijklmnopqrstuvwxyz";
    /* characters A-Z */
    private static final String alphaUpperCase = alpha.toUpperCase();
    /* characters 0-9 */
    private static final String digits = "0123456789";
    /* characters all */
    private static final String ALPHA_NUMERIC = alpha + alphaUpperCase + digits;
    private static Random generator = new Random();

    /**
     * get a random string
     *
     * @param numberOfCharactor is an int
     * @return String
     */
    public String randomAlphaNumeric(int numberOfCharactor) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < numberOfCharactor; i++) {
            int number = randomNumber(ALPHA_NUMERIC.length());
            char ch = ALPHA_NUMERIC.charAt(number);
            sb.append(ch);
        }
        return sb.toString();
    }

    /**
     * @param number is an int
     * @return int
     */
    public static int randomNumber(int number) {
        return generator.nextInt(number);
    }
}
