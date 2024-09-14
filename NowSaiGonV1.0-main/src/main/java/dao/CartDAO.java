/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Cart;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC
 */
public class CartDAO {

    Connection con = null;          // connect to SQL server
    PreparedStatement ps = null;    // move query from Netbeen to SQl
    ResultSet rs = null;            // save result query
    List<Cart> list = new ArrayList<>();

    public void addNewCart(int quantity, String size, int pID, int customerID) {
        if (checkExitCart(size, pID, customerID)) {
            System.out.println("ne");
            updateCart(pID, customerID, quantity, size, getQuantity(pID, customerID, size));
        } else {
            String query = "INSERT INTO Cart VALUES(?, ?, null, ?,?);";
            try {
                con = new DBContext().getConnection();
                ps = con.prepareStatement(query);
                ps.setInt(1, pID);
                ps.setInt(2, customerID);
                ps.setString(3, size);
                ps.setInt(4, quantity);
                ps.executeUpdate();
            } catch (Exception e) {
            }
        }
    }

    public boolean checkExitCart(String size, int pID, int customerID) {
        boolean check = false;
        String query = "select size from Cart where product_id = ? AND customer_id = ?;";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, pID);
            ps.setInt(2, customerID);
            rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println("S4" + rs.getString(1));
                if (rs.getString(1).equals(size)) {
                    check = true;
                }
            }
        } catch (Exception e) {
            System.out.println("hi" + e);
        }
        return check;
    }

    public List<Cart> getListCart() {
        try {
            String query = "select C.*, p.product_tittle, P.product_price\n"
                    + "from Cart C\n"
                    + "join Product P on P.product_id = C.product_id\n"
                    + "left join Orders O on O.order_id = C.order_id"; // your query to excute in SQL
            con = new DBContext().getConnection();   // open connection to SQL
            ps = con.prepareStatement(query);        // move query from Netbeen to SQl
            rs = ps.executeQuery();                  // the same with click to "excute" btn;
            List<Cart> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Cart(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(5),
                        rs.getString(4),
                        rs.getString(6),
                        rs.getInt(7)));
            }
            return list;
        } catch (Exception e) {
            e.getMessage();
        }
        return null;
    }

    public List<Cart> getListCartByCustomerID(int cID) {
        List<Cart> list = new ArrayList<>();
        try {
            String query = "select C.*, p.product_tittle, P.product_price\n"
                    + "from Cart C\n"
                    + "join Product P on P.product_id = C.product_id\n"
                    + "left join Orders O on O.order_id = C.order_id\n"
                    + "where C.customer_id = ? and C.order_id is NULL;"; // your query to excute in SQL
            con = new DBContext().getConnection();   // open connection to SQL
            ps = con.prepareStatement(query);        // move query from Netbeen to SQl
            ps.setInt(1, cID);
            rs = ps.executeQuery();                  // the same with click to "excute" btn;
            while (rs.next()) {
                list.add(new Cart(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(5),
                        rs.getString(4),
                        rs.getString(6),
                        rs.getInt(7)));

            }
            return list;
        } catch (Exception e) {
            e.getMessage();
        }
        return list;
    }

    public void updateCart(int productID, int customerID, int quantity, String size, int temp) {
        String query = "update Cart\n"
                + "set quantity = ?\n"
                + "where product_id = ? AND customer_id = ? AND size = ?;";
        try {
            con = new DBContext().getConnection();   // open connection to SQL
            ps = con.prepareStatement(query);        // move query from Netbeen to SQl
            ps.setInt(1, quantity + temp);
            ps.setInt(2, productID);
            ps.setInt(3, customerID);
            ps.setString(4, size);
            rs = ps.executeQuery();                  // the same with click to "excute" btn;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteCart(int productID, int customerID, int quantity, String size) {
        updateCart(productID, customerID, quantity, size, -1);
        deleteCartNoQuantity(productID, customerID, size);
    }

    public int getQuantity(int productID, int customerID, String size) {
        int sum = 0;
        String query = "select C.quantity\n"
                + "from Cart C\n"
                + "join Product P on P.product_id = C.product_id\n"
                + "left join Orders O on O.order_id = C.order_id\n"
                + "where C.customer_id = ? AND C.product_id = ? AND C.size = ?";
        try {
            // your query to excute in SQL
            con = new DBContext().getConnection(); // open connection to SQL
            ps = con.prepareStatement(query);      // move query from Netbeen to SQl
            ps.setInt(1, customerID);
            ps.setInt(2, productID);
            ps.setString(3, size);
            rs = ps.executeQuery();
            while (rs.next()) {
                sum = rs.getInt(1);
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return sum;
    }

    public void deleteCartNoQuantity(int productID, int customerID, String size) {
        int sum = getQuantity(productID, customerID, size);
        if (sum == 0) {
            String query = "delete from Cart where customer_id = ? and product_id = ? and size = ?";
            try {
                // your query to excute in SQL
                con = new DBContext().getConnection(); // open connection to SQL
                ps = con.prepareStatement(query);      // move query from Netbeen to SQl
                ps.setInt(1, customerID);
                ps.setInt(2, productID);
                ps.setString(3, size);
                rs = ps.executeQuery();
            } catch (Exception e) {
                e.getMessage();
            }
        }
    }

    public int sumOfProductCart(int cID) {
        int sum = 0;
        CartDAO cdao = new CartDAO();
        List<Cart> list = cdao.getListCartByCustomerID(cID);
        for (Cart c : list) {
            sum += c.getQuantity() * c.getProductPrice();
        }
        return sum;
    }

    public int sliptProductIDByCartID(String isCheckedTxt) {
        int pID = 0;
        String carID[] = isCheckedTxt.split(",");
        for (int i = 0; i < carID.length; i++) {
            pID = Integer.parseInt(carID[0]);
        }
        return pID;
    }

    public int sliptCusIDByCartID(String isCheckedTxt) {
        int cID = 0;
        String carID[] = isCheckedTxt.split(",");
        for (int i = 0; i < carID.length; i++) {
            cID = Integer.parseInt(carID[1]);
        }
        return cID;
    }

    public String sliptSizeByCartID(String isCheckedTxt) {
        String size = "";
        String carID[] = isCheckedTxt.split(",");
        for (int i = 0; i < carID.length; i++) {
            size = carID[2];
        }
        return size;
    }

    public static void main(String[] args) {
        CartDAO c = new CartDAO();
//        c.addNewCart(5,"XL",17,3);
        List<Cart> cart = c.getListCartByCustomerID(3);
        for (Cart ca : cart) {
            System.out.println(
                    "pID : " + ca.getProductID()
                    + "CID : " + ca.getCusID()
                    + "oderID : " + ca.getOrdID()
                    + "size : " + ca.getSize()
                    + "quantity : " + ca.getQuantity()
            );
        }
    }
}
