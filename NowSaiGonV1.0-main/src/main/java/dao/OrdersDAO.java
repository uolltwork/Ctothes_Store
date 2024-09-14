/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Cart;
import entity.Orders;
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
public class OrdersDAO {

    Connection con = null;          // connect to SQL server
    PreparedStatement ps = null;    // move query from Netbeen to SQl
    ResultSet rs = null;            // save result query
    public ArrayList<Orders> tempOrders; // temp of orders list for order handler.

    public List<Orders> getListOrders() {
        try {
            String query = "select o.order_id, o.customer_id, c.product_id, c.size, c.quantity, o.order_status, o.order_date, o.note \n"
                    + "from Orders o, Cart c \n"
                    + "where o.order_id = c.order_id and o.order_id <> 1 \n"
                    + "order by o.order_id desc;";
            con = new DBContext().getConnection(); // open connection to SQL
            ps = con.prepareStatement(query); // move query from Netbeen to SQl
            rs = ps.executeQuery(); // the same with click to "excute" btn;
            List<Orders> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Orders(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                ));
            }
            return list;
        } catch (Exception e) {
            e.getMessage();
        }
        return null;
    }

    public List<Orders> getListOrdersByID(String oID) {
        try {
            String query = "select o.order_id, o.customer_id, c.product_id, c.size, c.quantity, o.order_status, o.order_date, o.note \n"
                    + "from Orders o, Cart c\n"
                    + "where o.order_id = c.order_id and o.order_id = ?;";
            con = new DBContext().getConnection(); // open connection to SQL
            ps = con.prepareStatement(query); // move query from Netbeen to SQl
            ps.setString(1, oID);
            rs = ps.executeQuery(); // the same with click to "excute" btn;
            List<Orders> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Orders(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                ));
            }
            return list;
        } catch (Exception e) {
            e.getMessage();
        }
        return null;
    }

    public List<Orders> filtterOrdersByDate(String beginDate, String endDate) {
        try {
            String query = "select o.order_id, o.customer_id, c.product_id, c.size, c.quantity, o.order_status, o.order_date, o.note \n"
                    + "from Orders o, Cart c\n"
                    + "where o.order_id = c.order_id and o.order_id <> 1 and o.order_date between ? and ? \n"
                    + "Order by o.order_date desc;";
            con = new DBContext().getConnection(); // open connection to SQL
            ps = con.prepareStatement(query); // move query from Netbeen to SQl
            ps.setString(1, beginDate);
            ps.setString(2, endDate);
            rs = ps.executeQuery(); // the same with click to "excute" btn;
            List<Orders> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Orders(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                ));
            }
            return list;
        } catch (Exception e) {
            e.getMessage();
        }
        return null;
    }

    public List<Orders> getListOrdersOfCustomer(String cusID) {
        System.out.println("===========" + cusID + "==========");
        try {
            String query = "select o.order_id, o.customer_id, c.product_id, c.size, c.quantity, o.order_status, o.order_date, o.note\n"
                    + "from Orders o, Cart c \n"
                    + "where o.order_id = c.order_id and o.order_id <> 1 and o.customer_id = ?\n"
                    + "order by o.order_id desc;";
            con = new DBContext().getConnection(); // open connection to SQL
            ps = con.prepareStatement(query); // move query from Netbeen to SQl
            ps.setString(1, cusID);
            rs = ps.executeQuery(); // the same with click to "excute" btn;
            List<Orders> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Orders(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                ));
            }
            return list;
        } catch (Exception e) {
            e.getMessage();
        }
        return null;
    }

    public void addNewOrder(String date, List<Orders> order, String note) {
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

        for (Orders o : order) {
            int order_id = getMaxOrderID();

            query = "update Cart\n"
                    + "set order_id = ?\n"
                    + "where product_id = ? AND customer_id = ? AND size = ? AND quantity = ?";
            try {
                // your query to excute in SQL
                con = new DBContext().getConnection(); // open connection to SQL
                ps = con.prepareStatement(query);      // move query from Netbeen to SQl

                ps.setString(1, String.valueOf(order_id));
                ps.setString(2, o.getProduct_id());
                ps.setString(3, o.getCustomer_id());
                ps.setString(4, o.getSize());
                ps.setInt(5, o.getQuantity());
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

    public boolean checkOrderAvailability(ArrayList<Orders> order) {
        boolean check = true;
        for (Orders o : order) {
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

    public String getTodayDate() {
        return String.valueOf(java.time.LocalDate.now());
    }

    public int getOrderQuantity(List<Orders> list) {
        int listLength = list.size();
        int orderQuantity;
        if (listLength == 0) {
            orderQuantity = 0;
        } else {
            orderQuantity = 1;
        }
        for (int i = 0; i < listLength - 1; i++) {
            if (list.get(i).getId().equals(list.get(i + 1).getId())) {
                continue;
            } else {
                orderQuantity++;
            }
        }
        return orderQuantity;
    }

    public void deleteOrders(String oID) {
        String query = "delete from Orders where order_id = ?;"
                + "update Cart set order_id = null where order_id = ?";
        try {
            con = new DBContext().getConnection();   // open connection to SQL
            ps = con.prepareStatement(query);        // move query from Netbeen to SQl
            ps.setString(1, oID);              // set categoryID get from servelet to ?
            ps.setString(2, oID);              // set categoryID get from servelet to ?
            rs = ps.executeQuery();                  // the same with click to "excute" btn;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        OrdersDAO odao = new OrdersDAO();
        List<Orders> order = odao.filtterOrdersByDate("2022-10-24", "2022-10-25");

        for (Orders o : order) {
            System.out.println("ID: " + o.getId()
                    + "  - CID: " + o.getCustomer_id()
                    + "  - PID: " + o.getProduct_id()
                    + "  - size: " + o.getSize()
                    + "  - quantity: " + o.getQuantity()
                    + "  - status: " + o.getStatus()
                    + "  - total-pricce: " + o.getPrice()
                    + "  - date: " + o.getDate()
                    + "  - note: " + o.getNote()
            );
        }

    }
}
