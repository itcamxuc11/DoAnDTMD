/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UsersDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;
import tools.MD5;

/**
 *
 * @author Pathana
 */
@WebServlet(urlPatterns = { "/UsersServlet" })
public class UsersServlet extends HttpServlet {

    UsersDAO usersDAO = new UsersDAO();
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {       
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("index.jsp");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String command = request.getParameter("command");
        String url = "";
        Users users = new Users();
        HttpSession session = request.getSession();
        
        switch(command){
            case "insert": 
                users.setUserID(new java.util.Date().getTime());
                users.setUserEmail(request.getParameter("Email"));
                users.setUserName(request.getParameter("Name"));
                users.setUserPass(MD5.encryption(request.getParameter("Password")));
                users.setUserRole(false);
                usersDAO.insertUser(users);
                url = "/login.jsp";
                break;
            case "admininsert": 
                users.setUserID(new java.util.Date().getTime());
                users.setUserEmail(request.getParameter("Email"));
                users.setUserName(request.getParameter("Name"));
                users.setUserPass(MD5.encryption(request.getParameter("Password")));
                users.setUserRole(false);
                usersDAO.insertUser(users);
                session.setAttribute("user", users);
                url = "/admin/manager_users.jsp";
                break;
            case "login":
                users = usersDAO.login(request.getParameter("Email"), MD5.encryption(request.getParameter("Password")));
                if (users != null){
                    session.setAttribute("user", users);
                    url = "/index.jsp";
                }else{
                    request.setAttribute("error", "Wrong email or password!");
                    url = "/login.jsp";
                }
                break;
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
}
