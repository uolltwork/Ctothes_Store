/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import dao.AccountDAO;
import jakarta.xml.bind.DatatypeConverter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author NghiaHH and TrongNDP
 */
public class Cryptography {

    // Random Alphabet used to encrypt data
    private String alphabet0 = "BdhciEy0aăP1Yr2DưG3pvk4FNâ5mT6en7sAj8WquS9UXêơKCtZIlHLMoôxfVzwQbJROg";
    private String alphabet1 = "VPnoi1uRJ2eEr3lăưAZj4cBIW5âhvH6MDKC7FYaf8dLXêơm9GOzwk0SUôsgtybNpTQqx";
    private String alphabet2 = "YCGu1cfză2lpw3KTưgq4tvFD5mâBZ6NeJW7SiOP8QXd9xêơAV0jsrbMyôknhLoaRUEIH";
    private String alphabet3 = "TpQG1RVC2Ovyă3Xkưz4YNaS5jâhKd6ILqJ7EZAD8FlfB9êơt0srxWUneiôHomgcMPuwb";
    private String alphabet4 = "ZvUcqmgTCăBNFhwXưuHiSQoJ1kâD2VMz3eYrK4pan5OWbêơ6Ps7fA8RLIô9E0lGtxdyj";
    private String alphabet5 = "zNYyMjHFOClătaWcưAEfU1TQ2eqâx3XS4vr5uKD6wim7IVơkê8pJ9R0ZoôsLbdgGhBnP";
    private String alphabet6 = "aVFEgIicăpMYeLfzưyoGBTURDHQâXWdKxs1Jb23lP4Nqu5ơêASn6Zhj7môk8rv9Ct0Ow";
    private String alphabet7 = "BXiEpAYZ0Glăa9sjưx8KhFT7kcyâ6beL5mf4ot3nU2NJ1uơrêOIDzwdCMvôRgVWqHSPQ";
    private String alphabet8 = "IjVb1lzk2ZvăRw3LưQF4GEyuY5mâWDx6ecqo7XigM8trB9ơJPêK0AahdNHSôTpsUnfCO";
    private String alphabet9 = "sxefdMEUIngW1ăZoưrT2vVHw3zcuâC4thON5DjFLA6BiYXơb7pêGlS8ayJ9môq0KPkRQ";

    /**
     * This function crypto string follow 6-digits in password. 
     * Number 1 will set alphabet, there are 10 alphabet tables from 0 to 9.
     * Number from 2 to 6 used to encrypt string follow the words in consecutive order and then repeat until the data runs out.
     * Encrypt way is use digit from 2 to 6 to create 5 alphabet has been disturbed. 
     * Then used index of word in alphabet to get word follow index in alphabet has been disturbed.
     * @param input Which String need to encrypt
     * @param password which number 6-digits used to set key
     * @return String encrypted
     */
    public String encrypt(String input, int password) {
        StringBuilder encrypted = new StringBuilder(input);

        int setA1 = password / 100000;
        int keyEncrypt1 = (int) Math.pow((password / 10000) % 10, 10) % 68;
        int keyEncrypt2 = (int) Math.pow((password / 1000) % 10, 10) % 68;
        int keyEncrypt3 = (int) Math.pow((password / 100) % 10, 10) % 68;
        int keyEncrypt4 = (int) Math.pow((password / 10) % 10, 10) % 68;
        int keyEncrypt5 = (int) Math.pow(password % 10, 10) % 68;

        String alphabet = getAlphabet(setA1);
        String shiftAlphabet1 = alphabet.substring(keyEncrypt1) + alphabet.substring(0, keyEncrypt1);
        String shiftAlphabet2 = alphabet.substring(keyEncrypt2) + alphabet.substring(0, keyEncrypt2);
        String shiftAlphabet3 = alphabet.substring(keyEncrypt3) + alphabet.substring(0, keyEncrypt3);
        String shiftAlphabet4 = alphabet.substring(keyEncrypt4) + alphabet.substring(0, keyEncrypt4);
        String shiftAlphabet5 = alphabet.substring(keyEncrypt5) + alphabet.substring(0, keyEncrypt5);

        int count = 0;
        for (int i = 0; i < encrypted.length(); i++) {
            
            switch (count) {
                case 0:
                    {
                        char currChar = encrypted.charAt(i);
                        int index = alphabet.indexOf(String.valueOf(currChar));
                        if (index != -1) {
                            char newChar = shiftAlphabet5.charAt(index);
                            encrypted.setCharAt(i, newChar);
                        }       break;
                    }
                case 4:
                    {
                        char currChar = encrypted.charAt(i);
                        int index = alphabet.indexOf(String.valueOf(currChar));
                        if (index != -1) {
                            char newChar = shiftAlphabet4.charAt(index);
                            encrypted.setCharAt(i, newChar);
                        }       break;
                    }
                case 3:
                    {
                        char currChar = encrypted.charAt(i);
                        int index = alphabet.indexOf(String.valueOf(currChar));
                        if (index != -1) {
                            char newChar = shiftAlphabet3.charAt(index);
                            encrypted.setCharAt(i, newChar);
                        }       break;
                    }
                case 2:
                    {
                        char currChar = encrypted.charAt(i);
                        int index = alphabet.indexOf(String.valueOf(currChar));
                        if (index != -1) {
                            char newChar = shiftAlphabet2.charAt(index);
                            encrypted.setCharAt(i, newChar);
                        }       break;
                    }
                default:
                    {
                        char currChar = encrypted.charAt(i);
                        int index = alphabet.indexOf(String.valueOf(currChar));
                        if (index != -1) {
                            char newChar = shiftAlphabet1.charAt(index);
                            encrypted.setCharAt(i, newChar);
                        }       break;
                    }
            }
            count++;
            if (count == 5) {
                count = 0;
            }
        }
        return encrypted.toString();
    }

    /**
     * This function used password to reverse-encode. 
     * The data in the encrypted way divide string to 5 substring and reverse-encode follow digit from 2 to 6 of password.
     * @param encrypted Which String encrypted and need to decrypt it
     * @param password which number 6-digits used to set key
     * @return String decrypted
     */
    public String decrypt(String encrypted, int password) {

        int setA1 = password / 100000;
        int keyEncrypt1 = (int) Math.pow((password / 10000) % 10, 10) % 68; 
        int keyEncrypt2 = (int) Math.pow((password / 1000) % 10, 10) % 68;
        int keyEncrypt3 = (int) Math.pow((password / 100) % 10, 10) % 68;
        int keyEncrypt4 = (int) Math.pow((password / 10) % 10, 10) % 68;
        int keyEncrypt5 = (int) Math.pow(password % 10, 10) % 68;

        String message1 = halfOfString(encrypted, 0);
        String message2 = halfOfString(encrypted, 1);
        String message3 = halfOfString(encrypted, 2);
        String message4 = halfOfString(encrypted, 3);
        String message5 = halfOfString(encrypted, 4);
        
        String alphabet = getAlphabet(setA1);
        String shiftAlphabet1 = alphabet.substring(keyEncrypt1) + alphabet.substring(0, keyEncrypt1);
        String shiftAlphabet2 = alphabet.substring(keyEncrypt2) + alphabet.substring(0, keyEncrypt2);
        String shiftAlphabet3 = alphabet.substring(keyEncrypt3) + alphabet.substring(0, keyEncrypt3);
        String shiftAlphabet4 = alphabet.substring(keyEncrypt4) + alphabet.substring(0, keyEncrypt4);
        String shiftAlphabet5 = alphabet.substring(keyEncrypt5) + alphabet.substring(0, keyEncrypt5);

        StringBuilder decrypt_two = new StringBuilder(encrypted);

        String encrypt_message1 = encryptDecrypt(alphabet , message1, shiftAlphabet5);
        String encrypt_message2 = encryptDecrypt(alphabet , message2, shiftAlphabet1);
        String encrypt_message3 = encryptDecrypt(alphabet , message3, shiftAlphabet2);
        String encrypt_message4 = encryptDecrypt(alphabet , message4, shiftAlphabet3);
        String encrypt_message5 = encryptDecrypt(alphabet , message5, shiftAlphabet4);

        //build up the final answer
        for (int k = 0; k < (message1.length()); k++) {
            decrypt_two.setCharAt((5 * k), encrypt_message1.charAt(k));
        }

        for (int k = 0; k < (message2.length()); k++) {
            decrypt_two.setCharAt((5 * k) + 1, encrypt_message2.charAt(k));
        }

        for (int k = 0; k < (message3.length()); k++) {
            decrypt_two.setCharAt((5 * k) + 2, encrypt_message3.charAt(k));
        }

        for (int k = 0; k < (message4.length()); k++) {
            decrypt_two.setCharAt((5 * k) + 3, encrypt_message4.charAt(k));
        }

        for (int k = 0; k < (message5.length()); k++) {
            decrypt_two.setCharAt((5 * k) + 4, encrypt_message5.charAt(k));
        }

        return decrypt_two.toString();
    }

    /**
     * This function used to divide string to 5 substring
     * @param message String need to divide it to 5 substring.
     * @param start Number oder which start.
     * @return substring of String
     */
    public String halfOfString(String message, int start) {
        String result = new String();
        for (int i = start; i < message.length(); i = i + 5) {
            result = result + message.charAt(i);
        }
        return result;
    }

    /**
     * This function to reverse-encode
     * @param alphabet which original alphabet
     * @param input String need to reverse-encode
     * @param shiftAlphabet which String alphabet has been disturbed
     * @return string has been reverse-encode
     */
    public String encryptDecrypt(String alphabet, String input, String shiftAlphabet) {
        StringBuilder encrypted = new StringBuilder(input);

        for (int i = 0; i < encrypted.length(); i++) {

            char currChar = encrypted.charAt(i);
            int index = shiftAlphabet.indexOf(String.valueOf(currChar));
            if (index != -1) {
                char newChar = alphabet.charAt(index);
                encrypted.setCharAt(i, newChar);
            }
        }
        return encrypted.toString();
    }

    private String getAlphabet(int key) {
        switch (key) {
            case 0:
                return alphabet0;
            case 1:
                return alphabet1;
            case 2:
                return alphabet2;
            case 3:
                return alphabet3;
            case 4:
                return alphabet4;
            case 5:
                return alphabet5;
            case 6:
                return alphabet6;
            case 7:
                return alphabet7;
            case 8:
                return alphabet8;
            default:
                return alphabet9;
        }
    }
    
    /**
     * encrypt pass by MD5
     *
     * @param pass pass need encrypt
     * @return pass encrypted
     */
    public String encrytMD5(String pass) {
        MessageDigest md;
        String myHash = "";
        try {
            md = MessageDigest.getInstance("MD5"); // this is available in java.security for encryption
            // MessageDigest will hash the original byte array to a new byte array
            // thanks to printHexBinary the encoded byte array will be converted to 16
            md.update(pass.getBytes());
            byte[] digest = md.digest(); // must convert to bytes first
            myHash = DatatypeConverter.printHexBinary(digest).toUpperCase();
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return myHash;
    }
}
