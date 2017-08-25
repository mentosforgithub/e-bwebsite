/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dbConnection.dbConnectionHandler;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hment
 */
@WebServlet(name = "manageCart", urlPatterns = {"/manageCart"})
public class manageCart extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet manageCart</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet manageCart at " + request.getContextPath() + "</h1>");
            HttpSession session = request.getSession(true);
            Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
            String[] quantities = request.getParameterValues("quan");
            //traversal of the cart hash map, change quantities
            int count = 0;
            for(Integer value : cart.values()){
                int q = Integer.parseInt(quantities[count]);
                value = q;
                count++;
            }
            //traversal of the cart hash map, calculate total
            double total = 0;
            String sql = "SELECT price FROM Products where pid=?";
            Connection con = dbConnectionHandler.getConnection();
            try{
                for(Map.Entry<Integer, Integer> entry : cart.entrySet()){
                    PreparedStatement ps = con.prepareStatement(sql);
                    ps.setInt(1, entry.getKey());
                    ResultSet rs = ps.executeQuery();
                    double price = 0;
                    while(rs.next()){
                        price = rs.getDouble("price");
                    }
                    out.println("connected to DB, pid is" + entry.getKey() + "price is" + price);
                    //int num = entry.getKey();
                    total += price * entry.getValue();
                }
                out.println("total is" + total);
            }
            catch(SQLException e){
                out.println("<p>Error:" + e.getMessage() + "</p>");
                session.removeAttribute("total");
                request.getRequestDispatcher("/myCart.jsp").forward(request, response);
            }
            //add total price to session
            session.setAttribute("total", total);
            request.getRequestDispatcher("/checkOut.jsp").forward(request, response);
            out.println("</body>");
            out.println("</html>");
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
