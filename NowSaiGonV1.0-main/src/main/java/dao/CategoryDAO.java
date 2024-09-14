/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC
 */
public class CategoryDAO {
    Connection con = null;          // connect to SQL server
    PreparedStatement ps = null;    // move query from Netbeen to SQl
    ResultSet rs = null;            // save result query
    
     public List<Category> getListCategory() {
        List<Category> list = new ArrayList<>();
        try {
            String query = "select * from Category;";       // your query to excute in SQL
            con = new DBContext().getConnection();          // open connection to SQL
            ps = con.prepareStatement(query);               // move query from Netbeen to SQl
            rs = ps.executeQuery();                         // the same with click to "excute" btn;
            
            while (rs.next()) {
                list.add(new Category(rs.getInt(1) , rs.getString(2)));
            }
            return list;
        } catch (Exception e) {
            e.getMessage();
        }
        return list;
    }
     
//    public static void main(String[] args) {
//        CategoryDAO bdao = new CategoryDAO();
//        List<Category> list = new ArrayList<>();
//        list = bdao.getListCategory();
//        System.out.println("/*======= Database NowsiGon/Category=========*/");
//        for (Category category : list) {
//            System.out.println("ID: " + category.getID() + "Name:" + category.getName());
//        }
//    }
}
