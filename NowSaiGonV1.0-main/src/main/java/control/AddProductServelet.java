/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
public class AddProductServelet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        String title = request.getParameter("title");
        int importPrice = Integer.parseInt(request.getParameter("import-price"));
        int price = Integer.parseInt(request.getParameter("price"));
        int salePercent = Integer.parseInt(request.getParameter("sale-percent"));
        String decript = request.getParameter("product-descript");
//        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int catelogyID = Integer.parseInt(request.getParameter("categoryID"));
        int sizeS = Integer.parseInt(request.getParameter("size-s"));
        int sizeM = Integer.parseInt(request.getParameter("size-m"));
        int sizeL = Integer.parseInt(request.getParameter("size-l"));
        int sizeXL = Integer.parseInt(request.getParameter("size-xl"));

        ProductDAO pdao = new ProductDAO();
        if (pdao.checkProductExistByTitle(title)) {
            request.setAttribute("productExistMessage", "The product has been aldready exist!!!");
            request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
        } else {
            pdao.insertProduct(title, importPrice, price, salePercent, decript, sizeS, sizeM, sizeL, sizeXL, catelogyID);
            
            response.sendRedirect("manageProduct");
        }
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
