/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Pathana
 */
@WebServlet(urlPatterns = { "/DashboardServlets" })
public class DashboardServlet extends HttpServlet {
    
   
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
        
        String command = request.getParameter("command");         

        String url = "";
        try{           
            if(command.equals("search"))
            {
                 String fromDate = request.getParameter("date");
                 String toDate = request.getParameter("date2");
                 url = "admin/index.jsp?fromdate=" + fromDate + "&todate=" + toDate;    
            }
	}
	catch(Exception ex){
            Logger.getLogger(ManagerNewsServlet.class.getName()).log(Level.SEVERE, null, ex);
            url = "/admin/index.jsp";
        }
       
        response.sendRedirect(url); 
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }
}
