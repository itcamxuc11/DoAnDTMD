/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.NewsDAO;
import dao.UsersDAO;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.News;
import model.Users;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Pathana
 */
@WebServlet(urlPatterns = { "/ManagerUsersServlet" })

@MultipartConfig
public class ManagerUsersServlet extends HttpServlet {

	UsersDAO usersDAO = new UsersDAO();
    
    
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String command = request.getParameter("command");
        String userid = request.getParameter("userid");

        String url = "";
        try {
            switch (command) {

                case "delete":
                    usersDAO.deleteUser(Long.parseLong(userid));
                    url = "/admin/manager_users.jsp";
                    break;
                case "search":
                    String keyword = request.getParameter("keyword");
                    url = "/admin/manager_users.jsp?pages=1&keyword=" + keyword;
                    break;
                
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
       

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 request.setCharacterEncoding("UTF-8");
    		response.setCharacterEncoding("UTF-8");
    	        
    	        String command = request.getParameter("command");         

    	        String url = "";
    	        
    	        Users users = new Users();
    	        try{       
    	            if(command.equals("update"))
    	            {    
    	            	users.setUserID(Long.parseLong(request.getParameter("userid")));
    	            	users.setUserEmail(request.getParameter("useremail"));
    	                users.setUserName(request.getParameter("username"));
    	                usersDAO.updateUser(users);
    	                url = "admin/manager_users.jsp";       
    	            }
    	            
    		}
    		catch(Exception ex){
    	            Logger.getLogger(ManagerUsersServlet.class.getName()).log(Level.SEVERE, null, ex);
    		}
    	       
    	        response.sendRedirect(url); 
       
    }
}
