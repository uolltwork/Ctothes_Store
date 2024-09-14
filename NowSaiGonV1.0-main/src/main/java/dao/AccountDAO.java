/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import entity.Account;
import entity.Cryptography;
import java.util.Scanner;
import java.util.regex.Pattern;

/**
 *
 * @author PC
 */
public class AccountDAO {

    Connection con = null;          // connect to SQL server
    PreparedStatement ps = null;    // move query from Netbeen to SQl
    ResultSet rs = null;            // save result query
    Cryptography cry = new Cryptography();

    public Account loginAccount(String phone, String password) {
        String query = "select * from Account where account_phone = ? and account_password = ?;";
        try {
            // your query to excute in SQL
            con = new DBContext().getConnection(); // open connection to SQL
            ps = con.prepareStatement(query);      // move query from Netbeen to SQl
            ps.setString(1, cry.encrypt(phone, 123456)); // set phone to the first ?
            ps.setString(2, cry.encrytMD5(password));  // set phone to the second ?

            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        cry.decrypt(rs.getString(2), 123456),
                        rs.getString(3),
                        rs.getInt(4));
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return null;
    }

    public Account checkAccountExist(String phone) {
        String query = "select * from Account where account_phone = ?;";
        try {
            con = new DBContext().getConnection(); // open connection to SQL
            ps = con.prepareStatement(query);      // move query from Netbeen to SQl
            ps.setString(1, cry.encrypt(phone, 123456)); // set phone to the first ?
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4));
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return null;
    }

    public int getMaxIDOfAccount() {
        String query = "select top 1 account_id from Account order by account_id DESC;";
        try {
            con = new DBContext().getConnection(); // open connection to SQL
            ps = con.prepareStatement(query);      // move query from Netbeen to SQl
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return -1;
    }

    public int getAccountIDByCustomerID(int customerID) {
        String query = "select top 1 account_id from Customer where customer_id = ?";
        try {
            con = new DBContext().getConnection(); // open connection to SQL
            ps = con.prepareStatement(query);      // move query from Netbeen to SQl
            ps.setInt(1, customerID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return -1;
    }

    public void registerAccount(String phone, String password) {
        String query = "insert into Account values(?, ? , 3); ";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, cry.encrypt(phone, 123456));
            ps.setString(2, cry.encrytMD5(password));

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void registerCustomer(String fullname, String email, String address, int maxAccountID) {
        String query = "insert into Customer values(?, ? , ?, ?);";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, cry.encrypt(fullname, 123456));
            ps.setString(2, cry.encrypt(email, 123456));
            ps.setString(3, cry.encrypt(address, 123456));
            ps.setInt(4, maxAccountID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean checkPhoneNumnber(String phone) {
        try {
            String phoneRegex = "^(\\(0[0-9]{2}\\)|0[0-9]{2})[.-]{0,1}[0-9]{7,8}$";
            Pattern p = Pattern.compile(phoneRegex);
            if (p.matcher(phone).find()) {        // valid phone
                return true;
            } else {                                    // contains one or more than characters
                return false;
            }
        } catch (Exception e) { // has any exception
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkPassword(String password) {
        try {
            String passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,20}$";
            Pattern p = Pattern.compile(passwordRegex);
            if (p.matcher(password).find()) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) { // has any exception
            e.printStackTrace();
        }
        return false;
    }

    public List<Account> getListOfAccount() {
        List<Account> list = new ArrayList<>();
        try {
            String query = "select * from Account order by account_id DESC;";       // your query to excute in SQL
            con = new DBContext().getConnection();          // open connection to SQL
            ps = con.prepareStatement(query);               // move query from Netbeen to SQl
            rs = ps.executeQuery();                         // the same with click to "excute" btn;

            while (rs.next()) {
                list.add(new Account(rs.getInt(1), cry.decrypt(rs.getString(2), 123456), rs.getString(3), rs.getInt(4)));
            }
            return list;
        } catch (Exception e) {
            e.getMessage();
        }
        return list;
    }

    public void deleteAccount(String aID) {
        String query = "delete from Account where account_id = ?;";
        try {
            con = new DBContext().getConnection();   // open connection to SQL
            ps = con.prepareStatement(query);        // move query from Netbeen to SQl
            ps.setString(1, aID);              // set categoryID get from servelet to ?
            rs = ps.executeQuery();                  // the same with click to "excute" btn;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getAccountIDByPhone(String phone) {
        AccountDAO adao = new AccountDAO();
        List<Account> list = adao.getListOfAccount();
        for (Account a : list) {
            if (a.getPhone().equals(phone)) {
                return a.getID();
            }
        }
        return -1;
    }

    public Account getAccountByAccountID(String id) {
        String query = "select * from Account where account_id = ?;";
        try {
            con = new DBContext().getConnection(); // open connection to SQL
            ps = con.prepareStatement(query);      // move query from Netbeen to SQl
            ps.setString(1, id); // set phone to the first ?
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        cry.decrypt(rs.getString(2),123456),
                        rs.getString(3),
                        rs.getInt(4));
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return null;
    }

    public boolean checkPhoneExist(String phone, int accID) {
        AccountDAO adao = new AccountDAO();
        List<Account> list = adao.getListOfAccount();
        for (Account acc : list) {
            if (acc.getID() == accID) {
                continue;
            } else {
                if (acc.getPhone().equals(phone)) {
                    return true;
                }
            }
        }
        return false;
    }

    public static void main(String[] args) {
        AccountDAO adao = new AccountDAO();
        List<Account> list = adao.getListOfAccount();
        Scanner sc = new Scanner(System.in);
        String s;
        while(true) {
            s = sc.nextLine();
            System.out.println(adao.cry.encrypt(s, 123456));
        }
    }
}
