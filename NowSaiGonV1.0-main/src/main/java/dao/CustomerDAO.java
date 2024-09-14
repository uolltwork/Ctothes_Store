/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Cryptography;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import entity.Customer;

/**
 *
 * @author PC
 */
public class CustomerDAO {

    Connection con = null;          // connect to SQL server
    PreparedStatement ps = null;    // move query from Netbeen to SQl
    ResultSet rs = null;            // save result query
    Cryptography cry = new Cryptography();

    public List<Customer> getListCustomer() {
        List<Customer> list = new ArrayList<>();
        try {
            String query = "select * from Customer order by customer_id DESC;";       // your query to excute in SQL
            con = new DBContext().getConnection();          // open connection to SQL
            ps = con.prepareStatement(query);               // move query from Netbeen to SQl
            rs = ps.executeQuery();                         // the same with click to "excute" btn;

            while (rs.next()) {
                list.add(new Customer(rs.getInt(1),
                        cry.decrypt(rs.getString(2), 123456),
                        cry.decrypt(rs.getString(3), 123456),
                        cry.decrypt(rs.getString(4), 123456),
                        rs.getInt(5)));
            }
            return list;
        } catch (Exception e) {
            e.getMessage();
        }
        return list;
    }
    
        public List<Customer> SearchCustomerByName(String name) {
        List<Customer> listCus = this.getListCustomer();
        List<Customer> listResult = new ArrayList<>();
            for (Customer c : listCus) {
                if(c.getName().toLowerCase().contains(name.toLowerCase())) {
                    listResult.add(new Customer(c.getID(), c.getName(), c.getEmail(), c.getAddress(), c.getAccountID()));
                }
            }
        return listResult;
    }

    public void deleteCustomerByID(String cID) {
        AccountDAO adao = new AccountDAO();
        int aID = adao.getAccountIDByCustomerID(Integer.parseInt(cID));
        String query = "delete from Cart where customer_id = ?\n"
                + "delete from Orders where customer_id = ?\n"
                + "delete from Customer where customer_id = ?\n"
                + "delete from Account where account_id = ?";
        try {
            con = new DBContext().getConnection();   // open connection to SQL
            ps = con.prepareStatement(query);        // move query from Netbeen to SQl
            ps.setInt(1, Integer.parseInt(cID));                    // set categoryID get from servelet to ?
            ps.setInt(2, Integer.parseInt(cID));
            ps.setInt(3, Integer.parseInt(cID));
            ps.setInt(4, aID);
            rs = ps.executeQuery();                  // the same with click to "excute" btn;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getCustomerNameByAccountID(int aID) {
        CustomerDAO cdao = new CustomerDAO();
        List<Customer> list = cdao.getListCustomer();
        for (Customer c : list) {
            if (c.getAccountID() == aID) {
                return c.getName();
            }
        }
        return null;
    }

    public Customer getCustomerByAccountID(int aID) {
        CustomerDAO cdao = new CustomerDAO();
        List<Customer> list = cdao.getListCustomer();
        for (Customer c : list) {
            if (c.getAccountID() == aID) {
                return c;
            }
        }
        return null;
    }

    public Customer getCustomerByID(int cID) {
        CustomerDAO cdao = new CustomerDAO();
        List<Customer> list = cdao.getListCustomer();
        for (Customer c : list) {
            if (c.getID() == cID) {
                return c;
            }
        }
        return null;
    }

    public void updateCustomerInfo(String name, String email, String phone, String pass, String address, String accID) {
        Customer c = this.getCustomerByAccountID(Integer.parseInt(accID));
        String cusID = String.valueOf(c.getID());
        System.out.println(cusID);
        String query = "update Customer\n"
                + "set customer_fullName = ?,\n"
                + "customer_email = ?,\n"
                + "customer_address = ?\n"
                + "where customer_id = ?;\n"
                + "\n"
                + "update Account\n"
                + "set account_phone = ?,\n"
                + "account_password = ?\n"
                + "where account_id = ?;";
        try {
            con = new DBContext().getConnection();   // open connection to SQL
            ps = con.prepareStatement(query);        // move query from Netbeen to SQl
            ps.setString(1, cry.encrypt(name, 123456));
            ps.setString(2, cry.encrypt(email, 123456));
            ps.setString(3, cry.encrypt(address, 123456));
            ps.setString(4, cusID);
            ps.setString(5, cry.encrypt(phone, 123456));
            ps.setString(6, cry.encrytMD5(pass));
            ps.setString(7, accID);
            ps.executeUpdate();                 // the same with click to "excute" btn;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        CustomerDAO cdao = new CustomerDAO();
        List<Customer> list = cdao.SearchCustomerByName("khoa   ");

        for (Customer c : list) {
            System.out.println(
                    " ID: " + c.getID()
                    + " Name: " + c.getName()
                    + " Email: " + c.getEmail()
                    + " Phone: " + c.getPhone()
                    + " Address: " + c.getAddress()
                    + " Account ID: " + c.getAccountID()
            );
        }

//        System.out.println(cdao.getCustomerByAccountID(37).getName());
    }
}
