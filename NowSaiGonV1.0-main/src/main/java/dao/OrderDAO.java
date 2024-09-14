/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Account;
import entity.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import entity.Order;
import java.util.List;

/**
 *
 * @author NghiaHHCE160343@fpt.edu.vn
 */
public class OrderDAO {

    Connection con = null;          // connect to SQL server
    PreparedStatement ps = null;    // move query from Netbeen to SQl
    ResultSet rs = null;            // save result query

    public void addNewOrder(String date, ArrayList<Order> order, String note) {
        String query = "insert into Orders values(?,'Processing',?,?)";
        try {
            // your query to excute in SQL
            con = new DBContext().getConnection(); // open connection to SQL
            ps = con.prepareStatement(query);      // move query from Netbeen to SQl
            ps.setString(1, date);
            ps.setString(2, order.get(0).getCustomer_id());
            ps.setString(3, note);
            rs = ps.executeQuery();
        } catch (Exception e) {
            e.getMessage();
        }

        for (Order o : order) {
            int order_id = getMaxOrderID();

            query = "update Cart\n"
                    + "set order_id = ?\n"
                    + "where product_id = ? AND customer_id = ? ";
            try {
                // your query to excute in SQL
                con = new DBContext().getConnection(); // open connection to SQL
                ps = con.prepareStatement(query);      // move query from Netbeen to SQl

                ps.setString(1, String.valueOf(order_id));
                ps.setString(2, o.getProduct_id());
                ps.setString(3, o.getCustomer_id());
                rs = ps.executeQuery();

            } catch (Exception e) {
                e.getMessage();
            }
            updateSizeProduct(o.getProduct_id(), o.getSize(), o.getQuantity());
        }
    }

    public void updateSizeProduct(String product_id, String size, int quantity) {
        int sizeAvailability = getSizeAvailability(product_id, size);
        String querySize = null;
        switch (size) {
            case "S":
                querySize = "update ProductSize\n"
                        + "set product_size_s = ?\n"
                        + "where product_id = ?";
                break;
            case "L":
                querySize = "update ProductSize\n"
                        + "set product_size_l = ?\n"
                        + "where product_id = ?";
                break;
            case "M":
                querySize = "update ProductSize\n"
                        + "set product_size_m = ?\n"
                        + "where product_id = ?";
                break;
            case "XL":
                querySize = "update ProductSize\n"
                        + "set product_size_xl = ?\n"
                        + "where product_id = ?";
                break;
        }
        try {
            // your query to excute in SQL
            con = new DBContext().getConnection(); // open connection to SQL
            ps = con.prepareStatement(querySize);      // move query from Netbeen to SQl
            ps.setInt(1, sizeAvailability - quantity);
            ps.setString(2, product_id);
            rs = ps.executeQuery();
        } catch (Exception e) {
            e.getMessage();
        }
    }

    public int getMaxOrderID() {
        int id = -1;
        String query = "select top 1 order_id from Orders order by order_id DESC;";
        try {
            // your query to excute in SQL
            con = new DBContext().getConnection(); // open connection to SQL
            ps = con.prepareStatement(query);      // move query from Netbeen to SQl
            rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return id;
    }

    public boolean checkOrderAvailability(ArrayList<Order> order) {
        boolean check = true;
        for (Order o : order) {
            if (!checkExitWhenOrder(o.getProduct_id(), o.getSize(), o.getQuantity())) {
                check = false;
                break;
            }
        }
        return check;
    }

    public int getSizeAvailability(String product_id, String size) {
        int num = -1;
        String query = null;
        System.out.println(product_id + " " + size);
        switch (size) {
            case "S":
                query = "select product_size_s from ProductSize where product_id = ?";
                break;
            case "L":
                query = "select product_size_l from ProductSize where product_id = ?";
                break;
            case "M":
                query = "select product_size_m from ProductSize where product_id = ?";
                break;
            case "XL":
                query = "select product_size_xl from ProductSize where product_id = ?";
                break;
        }
        try {
            // your query to excute in SQL
            con = new DBContext().getConnection(); // open connection to SQL
            ps = con.prepareStatement(query);      // move query from Netbeen to SQl
            ps.setInt(1, Integer.parseInt(product_id));
            rs = ps.executeQuery();
            while (rs.next()) {
                num = rs.getInt(1);
            }
        } catch (Exception e) {
            e.getMessage();
            System.out.println("Error" + e);
        }
        return num;
    }

    public boolean checkExitWhenOrder(String product_id, String size, int quantity) {
        int num = getSizeAvailability(product_id, size);
        System.out.println("Availabible: " + product_id + " : " + num + " : " + quantity);
        if (num < quantity) {
            return false;
        } else {
            return true;
        }
    }

    public static void main(String[] args) {
        OrderDAO odao = new OrderDAO();

        ArrayList<Order> order = new ArrayList<>();

        CartDAO cdao = new CartDAO();

        List<Cart> cart = cdao.getListCartByCustomerID(2);

        for (Cart c : cart) {
            order.add(new Order(String.valueOf(c.getCusID()), String.valueOf(c.getProductID()), c.getSize(), c.getQuantity()));
        }

        for (Order o : order) {
            System.out.println(o.getProduct_id() + o.getCustomer_id() + o.getSize() + o.getQuantity());
        }

        boolean check = odao.checkOrderAvailability(order);

        System.out.println(check);

        if (check) {
            odao.addNewOrder("2022/10/18", order, "");
        } else {
            System.out.println("Ko đủ");
        }

    }
}
