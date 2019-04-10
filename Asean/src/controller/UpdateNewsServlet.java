/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.NewsDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.News;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Pathana
 */
@WebServlet(name = "UpdateNewsServlet", urlPatterns = {"/UpdateNewsServlet"})
@MultipartConfig
public class UpdateNewsServlet extends HttpServlet {
    
    NewsDAO productDAO  = new NewsDAO();
    
    // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "upload";

    // upload settings
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
   
        String url = "";
        
        // checks if the request actually contains upload file
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (!isMultipart) {
            return ;
        }
        
        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // sets memory threshold - beyond which files are stored in disk 
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // sets temporary location to store files
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);

        // sets maximum size of upload file
        upload.setFileSizeMax(MAX_FILE_SIZE);

        // sets maximum size of request (include file + form data)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // constructs the directory path to store upload file
        // this path is relative to application's directory
        String uploadPath = getServletContext().getRealPath("")
                + File.separator + UPLOAD_DIRECTORY;

        // creates the directory if it does not exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        
        try {
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
            
            /*String command = request.getParameter("command");  
            String product_name = request.getParameter("productname");
            long category_id = Long.parseLong(request.getParameter("categoryid"));
            long price = Long.parseLong(request.getParameter("price"));
            String description = request.getParameter("description");*/
            
            String product_name = "";
            long id = 0;
            long category_id = 0;
        
            String description = "";
            String fileName = "";
            String filePath = "";
            
            if (formItems != null && formItems.size() > 0) {
                // iterates over form's fields
                int i = 0;
                for (FileItem item : formItems) {
                    i = i + 1;
                    if(i == 1){     
                         id = Long.parseLong(item.getString());
                       
                    }
                     else if(i == 2){
                        product_name = new String(item.getString().getBytes("iso-8859-1"), "UTF-8");
                    }
                    else if(i == 3){
                        category_id = Long.parseLong(item.getString());
                    }
                    
                    
                    else if (!item.isFormField()) 
                    {
                        fileName = new File(item.getName()).getName();
                        
                        if(fileName.length() != 0)
                        {
                             filePath = uploadPath + File.separator + fileName;
                            File storeFile = new File(filePath);

                            // saves the file on disk
                            item.write(storeFile);
                        }                     
                    }               
                    else if(i == 5){
                        description = new String(item.getString().getBytes("iso-8859-1"), "UTF-8");
                        
                        try{
                            if(fileName.length() == 0) // không cập nhật avatar
                            {
                                 String img = "upload/" + fileName;        
                                 String cateName = "";
                                 productDAO.update(new News(id, category_id, product_name, fileName,  description,cateName));
                                 url = "admin/manager_news.jsp?pages=1";                        
                            }
                            else
                            {
                                 String img = "upload/" + fileName;                
                                 String cateName = "";
                                 productDAO.update(new News(id, category_id, product_name, img,  description,cateName));
                                 url = "admin/manager_news.jsp?pages=1"; 
                            } 
                        }
                        catch(SQLException ex){
                            Logger.getLogger(ManagerNewsServlet.class.getName()).log(Level.SEVERE, null, ex);
                            url = "/admin/insert_news.jsp";	
                        } 
                    }
                }
            }   
        } catch (Exception ex) {
            //request.setAttribute("message", "There was an error: " + ex.getMessage());
            url = "/admin/insert_news.jsp";
        }
        
        response.sendRedirect(url);
        
    }

}
