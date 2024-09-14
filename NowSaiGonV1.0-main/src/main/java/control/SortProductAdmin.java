/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.CategoryDAO;
import dao.ProductDAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC
 */
@WebServlet(name = "SortProductAdmin", urlPatterns = {"/sortProductAdmin"})
public class SortProductAdmin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String typeSort = request.getParameter("typeSort");
        ProductDAO pdao = new ProductDAO();
        List<Product> listProduct = new ArrayList<>();
        if(typeSort.equals("1")) {
            listProduct = pdao.sortListProductByImportPriceAsc();
        }else if(typeSort.equals("2")) {
            listProduct = pdao.sortListProductByImportPriceDesc();
        }else if(typeSort.equals("3")) {
            listProduct = pdao.sortListProductByPriceAsc();
        }else if(typeSort.equals("4")){
            listProduct = pdao.sortListProductByPriceDesc();
        }
        
        CategoryDAO cdao = new CategoryDAO();
        List<Category> listCategory = cdao.getListCategory();

        // Step 2: Set data to jsp
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listProductSize", listProduct.size());
        request.setAttribute("totalImportPrice", pdao.totalImportPrice(listProduct));
        request.setAttribute("totalPrice", pdao.totalPrice(listProduct));
        request.getRequestDispatcher("ManageProduct.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
