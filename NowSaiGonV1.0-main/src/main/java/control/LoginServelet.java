/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.AccountDAO;
import dao.CartDAO;
import dao.CustomerDAO;
import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import entity.Account;
import entity.Cart;
import entity.Customer;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC
 */
public class LoginServelet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        request.removeAttribute("loginFailMessage");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        AccountDAO adao = new AccountDAO();
        Account account = adao.loginAccount(phone, password);

        CustomerDAO cdao = new CustomerDAO();
        CartDAO cart = new CartDAO();

        ProductDAO pdao = new ProductDAO();
        // Not signed in
        if (account == null) {
            request.setAttribute("loginFailMessage", "Tài khoản không đúng. Vui lòng đăng nhập lại!!!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else { // Is signed in
            // account is admin
            if (account.getID() == 1) {
                HttpSession seesion = request.getSession();
                seesion.setAttribute("accountSeesion", account);
                
                // Get max product ID for adding product ID
                int maxProductID = pdao.getMaxProductID();
                seesion.setAttribute("maxProductID", maxProductID + 1);
                seesion.setMaxInactiveInterval(60*60*12);
                request.getRequestDispatcher("home").forward(request, response);
            } else { // account is user
                HttpSession seesion = request.getSession();
                seesion.setAttribute("accountSeesion", account);
   
//              int accountID = adao.getAccountIDByPhone(phone);
                String customerName = cdao.getCustomerNameByAccountID(account.getID());

                Customer c = cdao.getCustomerByAccountID(account.getID());

                CartDAO cartdao = new CartDAO();
                List<Cart> listCart = cartdao.getListCartByCustomerID(c.getID());

                seesion.setAttribute("customerName", customerName);
                seesion.setAttribute("listCartSize", listCart.size());
                seesion.setMaxInactiveInterval(60*60*12);
                request.getRequestDispatcher("home").forward(request, response);
            }
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
