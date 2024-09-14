/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
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
public class ProductDAO {

    Connection con = null;          // connect to SQL server
    PreparedStatement ps = null;    // move query from Netbeen to SQl
    ResultSet rs = null;            // save result query

    public List<Product> getListProduct() {
        try {
            String query = "select P.product_id as product_id, P.product_tittle as product_tittle, P.product_import_price as product_import_price, P.product_price as product_price, "
                    + "P.product_sale_percent as product_sale_percent, P.product_disciption as product_disciption, PS.product_size_s as product_size_s, "
                    + "PS.product_size_m as product_size_m, PS.product_size_l as product_size_l, PS.product_size_xl as product_size_xl, P.catelogy_id as "
                    + "catelogy_id from Product P  join ProductSize PS on P.product_id = PS.product_id join Category C on P.catelogy_id = C.category_id ORDER BY product_id DESC;";
            con = new DBContext().getConnection(); // open connection to SQL
            ps = con.prepareStatement(query); // move query from Netbeen to SQl
            rs = ps.executeQuery(); // the same with click to "excute" btn;
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7) + rs.getInt(8) + rs.getInt(9) + rs.getInt(10),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getInt(11)
                ));
            }
            return list;
        } catch (Exception e) {
            e.getMessage();
        }
        return null;
    }

    public List<Product> getListProductIsSaled() {
        try {
            String query = "select P.product_id as product_id, P.product_tittle as product_tittle, P.product_import_price as product_import_price, P.product_price as product_price, P.product_sale_percent as product_sale_percent,\n"
                    + "P.product_disciption as product_disciption, PS.product_size_s as product_size_s, PS.product_size_m as product_size_m,\n"
                    + "PS.product_size_l as product_size_l, PS.product_size_xl as product_size_xl, P.catelogy_id as catelogy_id\n"
                    + "from Product P \n"
                    + "join ProductSize PS on P.product_id = PS.product_id\n"
                    + "join Category C on P.catelogy_id = C.category_id\n"
                    + "where product_sale_percent <> 0 ORDER BY product_sale_percent DESC;";
            con = new DBContext().getConnection(); // open connection to SQL
            ps = con.prepareStatement(query); // move query from Netbeen to SQl
            rs = ps.executeQuery(); // the same with click to "excute" btn;
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7) + rs.getInt(8) + rs.getInt(9) + rs.getInt(10),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getInt(11)
                ));
            }
            return list;
        } catch (Exception e) {
            e.getMessage();
        }
        return null;
    }

    public List<Product> getListProductByCategoryID(String categoryID) {
        List<Product> list = new ArrayList<>();
        try {
            String query = "select P.product_id, P.product_tittle, P.product_import_price, P.product_price, P.product_sale_percent,\n"
                    + "P.product_disciption, PS.product_size_s, PS.product_size_m,\n"
                    + "PS.product_size_l, PS.product_size_xl, P.catelogy_id\n"
                    + "from Product P \n"
                    + "join ProductSize PS on P.product_id = PS.product_id\n"
                    + "join Category C on P.catelogy_id = C.category_id\n"
                    + "where P.catelogy_id = ?";                // your query to excute in SQL
            con = new DBContext().getConnection();   // open connection to SQL
            ps = con.prepareStatement(query);        // move query from Netbeen to SQl
            ps.setString(1, categoryID);             // set categoryID get from servelet to ?
            rs = ps.executeQuery();                  // the same with click to "excute" btn;

            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7) + rs.getInt(8) + rs.getInt(9) + rs.getInt(10),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getInt(11)
                ));
            }
            return list;
        } catch (Exception e) {
            e.getMessage();
        }
        return list;
    }

    public Product getProductIByID(String productID) {
        try {
            String query = "select P.product_id, P.product_tittle, P.product_import_price, P.product_price, P.product_sale_percent,\n"
                    + "P.product_disciption, PS.product_size_s, PS.product_size_m,\n"
                    + "PS.product_size_l, PS.product_size_xl, P.catelogy_id\n"
                    + "from Product P \n"
                    + "join ProductSize PS on P.product_id = PS.product_id\n"
                    + "join Category C on P.catelogy_id = C.category_id\n"
                    + "where P.product_id = ?";                // your query to excute in SQL
            con = new DBContext().getConnection();   // open connection to SQL
            ps = con.prepareStatement(query);        // move query from Netbeen to SQl
            ps.setString(1, productID);             // set categoryID get from servelet to ?
            rs = ps.executeQuery();                  // the same with click to "excute" btn;

            while (rs.next()) {
                return new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7) + rs.getInt(8) + rs.getInt(9) + rs.getInt(10),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getInt(11)
                );

            }
        } catch (Exception e) {
            e.getMessage();
        }
        return null;
    }

    public List<Product> searchProductByTitle(String txtSearch) {
        List<Product> list = new ArrayList<>();
        try {
            String query = "select P.product_id as product_id, P.product_tittle as product_tittle, P.product_import_price as product_import_price, P.product_price as product_price, P.product_sale_percent as product_sale_percent,\n"
                    + "P.product_disciption as product_disciption, PS.product_size_s as product_size_s, PS.product_size_m as product_size_m,\n"
                    + "PS.product_size_l as product_size_l, PS.product_size_xl as product_size_xl, P.catelogy_id as catelogy_id\n"
                    + "from Product P \n"
                    + "join ProductSize PS on P.product_id = PS.product_id\n"
                    + "join Category C on P.catelogy_id = C.category_id\n"
                    + "where P.product_tittle like ?";      // your query to excute in SQL
            con = new DBContext().getConnection();   // open connection to SQL
            ps = con.prepareStatement(query);        // move query from Netbeen to SQl
            ps.setString(1, "%" + txtSearch + "%");  // set categoryID get from servelet to ?
            rs = ps.executeQuery();                  // the same with click to "excute" btn;

            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7) + rs.getInt(8) + rs.getInt(9) + rs.getInt(10),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getInt(11)
                ));
            }
            return list;
        } catch (Exception e) {
            e.getMessage();
        }
        return list;
    }

    public List<Product> sortListProductByImportPriceAsc() {
        try {
            String query = "select P.product_id as product_id, P.product_tittle as product_tittle, P.product_import_price as product_import_price, P.product_price as product_price\n"
                    + ",P.product_sale_percent as product_sale_percent, P.product_disciption as product_disciption, PS.product_size_s as product_size_s\n"
                    + ",PS.product_size_m as product_size_m, PS.product_size_l as product_size_l, PS.product_size_xl as product_size_xl, P.catelogy_id as catelogy_id \n"
                    + "from Product P  join ProductSize PS on P.product_id = PS.product_id join Category C on P.catelogy_id = C.category_id \n"
                    + "ORDER BY p.product_import_price ASC;";
            con = new DBContext().getConnection(); // open connection to SQL
            ps = con.prepareStatement(query); // move query from Netbeen to SQl
            rs = ps.executeQuery(); // the same with click to "excute" btn;
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7) + rs.getInt(8) + rs.getInt(9) + rs.getInt(10),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getInt(11)
                ));
            }
            return list;
        } catch (Exception e) {
            e.getMessage();
        }
        return null;
    }

    public List<Product> sortListProductByImportPriceDesc() {
        try {
            String query = "select P.product_id as product_id, P.product_tittle as product_tittle, P.product_import_price as product_import_price, P.product_price as product_price\n"
                    + ",P.product_sale_percent as product_sale_percent, P.product_disciption as product_disciption, PS.product_size_s as product_size_s\n"
                    + ",PS.product_size_m as product_size_m, PS.product_size_l as product_size_l, PS.product_size_xl as product_size_xl, P.catelogy_id as catelogy_id \n"
                    + "from Product P  join ProductSize PS on P.product_id = PS.product_id join Category C on P.catelogy_id = C.category_id \n"
                    + "ORDER BY p.product_import_price DESC;";
            con = new DBContext().getConnection(); // open connection to SQL
            ps = con.prepareStatement(query); // move query from Netbeen to SQl
            rs = ps.executeQuery(); // the same with click to "excute" btn;
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7) + rs.getInt(8) + rs.getInt(9) + rs.getInt(10),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getInt(11)
                ));
            }
            return list;
        } catch (Exception e) {
            e.getMessage();
        }
        return null;
    }

    public List<Product> sortListProductByPriceAsc() {
        try {
            String query = "select P.product_id as product_id, P.product_tittle as product_tittle, P.product_import_price as product_import_price, P.product_price as product_price\n"
                    + ",P.product_sale_percent as product_sale_percent, P.product_disciption as product_disciption, PS.product_size_s as product_size_s\n"
                    + ",PS.product_size_m as product_size_m, PS.product_size_l as product_size_l, PS.product_size_xl as product_size_xl, P.catelogy_id as catelogy_id \n"
                    + "from Product P  join ProductSize PS on P.product_id = PS.product_id join Category C on P.catelogy_id = C.category_id \n"
                    + "ORDER BY p.product_price ASC;";
            con = new DBContext().getConnection(); // open connection to SQL
            ps = con.prepareStatement(query); // move query from Netbeen to SQl
            rs = ps.executeQuery(); // the same with click to "excute" btn;
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7) + rs.getInt(8) + rs.getInt(9) + rs.getInt(10),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getInt(11)
                ));
            }
            return list;
        } catch (Exception e) {
            e.getMessage();
        }
        return null;
    }

    public List<Product> sortListProductByPriceDesc() {
        try {
            String query = "select P.product_id as product_id, P.product_tittle as product_tittle, P.product_import_price as product_import_price, P.product_price as product_price\n"
                    + ",P.product_sale_percent as product_sale_percent, P.product_disciption as product_disciption, PS.product_size_s as product_size_s\n"
                    + ",PS.product_size_m as product_size_m, PS.product_size_l as product_size_l, PS.product_size_xl as product_size_xl, P.catelogy_id as catelogy_id \n"
                    + "from Product P  join ProductSize PS on P.product_id = PS.product_id join Category C on P.catelogy_id = C.category_id \n"
                    + "ORDER BY p.product_price DESC;";
            con = new DBContext().getConnection(); // open connection to SQL
            ps = con.prepareStatement(query); // move query from Netbeen to SQl
            rs = ps.executeQuery(); // the same with click to "excute" btn;
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7) + rs.getInt(8) + rs.getInt(9) + rs.getInt(10),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getInt(11)
                ));
            }
            return list;
        } catch (Exception e) {
            e.getMessage();
        }
        return null;
    }
    
    public int totalImportPrice(List<Product> list) {
        int sum = 0;
        for (Product p : list) {
            sum += (p.getImportPrice() * p.getQuantity());
        }
        return sum;
    }

    public int totalPrice(List<Product> list) {
        int sum = 0;
        for (Product p : list) {
            sum += (p.getPrice() * p.getQuantity());
        }
        return sum;
    }

    public long getExpenses(Product p) {
        return p.getImportPrice() * p.getQuantity();
    }

    public long getRevenue(Product p) {
        return p.getPrice() * p.getQuantity();
    }

    public long getProfit(long expenses, long revenue) {
        return revenue - expenses;
    }

    public void deleteProduct(String productID) {
        String query = "delete from Cart where product_id = ?;\n"
                + "delete from ProductSize where product_id = ?;\n"
                + "delete from Product where product_id = ?;";
        try {
            con = new DBContext().getConnection();   // open connection to SQL
            ps = con.prepareStatement(query);        // move query from Netbeen to SQl
            ps.setString(1, productID);              // set categoryID get from servelet to ?
            ps.setString(2, productID);              // set categoryID get from servelet to ?
            ps.setString(3, productID);              // set categoryID get from servelet to ?
            rs = ps.executeQuery();                  // the same with click to "excute" btn;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getNewIDProduct() {
        String query_get = "select top 1 product_id from Product order by product_id desc";
        int maxProductID = -1;
        try {
            con = new DBContext().getConnection();   // open connection to SQL
            ps = con.prepareStatement(query_get);        // move query from Netbeen to SQl
            rs = ps.executeQuery();                  // the same with click to "excute" btn;
            maxProductID = rs.getInt(1) + 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return maxProductID;
    }

    public void insertProduct(String title, int importPrice, int price,
            int salePercent, String decript, int sizeS, int sizeM, int sizeL, int sizeXL, int cID) {
        int maxProductID = getMaxProductID() + 1;
        String query = "INSERT INTO Product VALUES(?, ?, ?, ?, ?, ?);\n"
                + "INSERT INTO ProductSize VALUES(?, ? , ?, ?, ?);";
        try {
            con = new DBContext().getConnection();   // open connection to SQL
            ps = con.prepareStatement(query);        // move query from Netbeen to SQl
            ps.setString(1, title);
            ps.setInt(2, importPrice);
            ps.setInt(3, price);
            ps.setInt(4, salePercent);
            ps.setString(5, decript);
            ps.setInt(6, cID);
            ps.setInt(7, sizeS);
            ps.setInt(8, sizeM);
            ps.setInt(9, sizeL);
            ps.setInt(10, sizeXL);
            ps.setInt(11, maxProductID);
            rs = ps.executeQuery();                  // the same with click to "excute" btn;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateProduct(String id, String title, int importPrice, int price,
            int salePercent, String decript, int sizeS, int sizeM, int sizeL, int sizeXL, int cID) {
        String query = "update Product\n"
                + "set product_tittle = ?,\n"
                + "product_import_price = ?,\n"
                + "product_price = ?,\n"
                + "product_sale_percent = ?,\n"
                + "product_disciption = ?,\n"
                + "catelogy_id = ?\n"
                + "where product_id = ?;\n"
                + "update ProductSize\n"
                + "set product_size_s = ?,\n"
                + "product_size_m = ?,\n"
                + "product_size_l = ?,\n"
                + "product_size_xl = ?\n"
                + "where product_id = ?;";
        try {
            con = new DBContext().getConnection();   // open connection to SQL
            ps = con.prepareStatement(query);        // move query from Netbeen to SQl
            ps.setString(1, title);
            ps.setInt(2, importPrice);
            ps.setInt(3, price);
            ps.setInt(4, salePercent);
            ps.setString(5, decript);
            ps.setInt(6, cID);
            ps.setInt(7, Integer.parseInt(id));
            ps.setInt(8, sizeS);
            ps.setInt(9, sizeM);
            ps.setInt(10, sizeL);
            ps.setInt(11, sizeXL);
            ps.setInt(12, Integer.parseInt(id));
            rs = ps.executeQuery();                  // the same with click to "excute" btn;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
   
    public boolean checkProductExistByTitle(String insertTitle) {
        ProductDAO bdao = new ProductDAO();
        List<Product> list = bdao.getListProduct();
        for (Product p : list) {
            if (p.getTitle().equalsIgnoreCase(insertTitle)) {
                return true;
            }
        }
        return false;
    }

    public List<Product> paggingProduct(int currentPage) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT p.product_id, p.product_tittle, p.product_import_price, \n"
                + "p.product_price, p.product_sale_percent, p.product_disciption, \n"
                + "ps.product_size_s, ps.product_size_m, ps.product_size_l, \n"
                + "ps.product_size_xl, p.catelogy_id \n"
                + "From Product p, ProductSize ps\n"
                + "WHERE P.product_id = ps.product_id\n"
                + "ORDER BY p.product_id DESC\n"
                + "OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY;";
        try {
            con = new DBContext().getConnection();   // open connection to SQL
            ps = con.prepareStatement(query);        // move query from Netbeen to SQl
            ps.setInt(1, ((currentPage - 1) * 20));
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7) + rs.getInt(8) + rs.getInt(9) + rs.getInt(10),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getInt(11)
                ));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getMaxProductID() {
        String query = "select max(product_id) from Product;";
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

    public int getTotalProduct() {
        String query = "select COUNT(*) from Product;";
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

    public static void main(String[] args) {
        ProductDAO bdao = new ProductDAO();
        List<Product> list = new ArrayList<>();
        System.out.println("/*=======Database NowsiGon/Product=========*/");

        list = bdao.sortListProductByImportPriceDesc();
        for (Product p : list) {
            System.out.println(
                    p.getID() + " -- "
                    + p.getTitle() + " -- "
                    + p.getImportPrice() + " -- Import Price "
                    + p.getPrice() + " -- "
                    + p.getSalePercent() + " -- "
                    + p.getQuantity() + " -- "
                    + p.getCategoryID() + " -- "
                    + p.getDecript() + " -- "
                    + p.getQuantity() + " -- "
                    + p.getCategoryID() + " -- "
            );
        }

//        System.out.println(bdao.());
    }

}
