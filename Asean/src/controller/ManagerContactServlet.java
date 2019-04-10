/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ContactDAO;
import dao.NewsDAO;
import dao.UsersDAO;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpSession;

import model.News;
import model.Users;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Pathana
 */
@WebServlet(urlPatterns = { "/ManagerContactServlet" })

@MultipartConfig
public class ManagerContactServlet extends HttpServlet {

	ContactDAO contactDAO = new ContactDAO();
    
    
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String command = request.getParameter("command");
        String contactid = request.getParameter("contactid");

        String url = "";
        try {
            switch (command) {

                case "delete":
                    contactDAO.deleteContact(Long.parseLong(contactid));
                    url = "/admin/manager_contact.jsp";
                    break;
                case "search":
                    String keyword = request.getParameter("keyword");
                    url = "/admin/manager_contact.jsp?pages=1&keyword=" + keyword;
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
    		HttpSession session = request.getSession();
    	        String command = request.getParameter("command");         
    	        String url = "";
    	        
    	        Contact contact = new Contact();
    	        try{       
    	            if(command.equals("insert"))
    	            {    
    	            	contact.setContactID(new java.util.Date().getTime());
    	            	contact.setContactName(request.getParameter("name"));
    	            	contact.setContactEmail(request.getParameter("email"));
    	            	contact.setContactPhone(request.getParameter("phone"));
    	            	contact.setContactQuestion(request.getParameter("question"));
    	            	
    	            	contactDAO.insertContact(contact);
    	            	String rep ="Thanks for contating Us. You shoud receive an email response shortly!";
    	            	session.setAttribute("rep", rep);
    	                url = "/Asean/contact.jsp";        
    	            }
    	            
    		}
    		catch(Exception ex){
    	            Logger.getLogger(ManagerContactServlet.class.getName()).log(Level.SEVERE, null, ex);
    		}
    	       
    	        response.sendRedirect(url); 
       
    }
}
