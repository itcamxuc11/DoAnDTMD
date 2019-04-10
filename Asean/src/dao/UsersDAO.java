/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Category;
import model.News;
import model.Users;

/**
 *
 * @author Pathana
 */
public class UsersDAO {

    // kiểm tra email tồn tại chưa
    public boolean checkEmail(String email) {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM users WHERE user_email = '" + email + "'";
        PreparedStatement ps;
        try {
            ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                connection.close();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // phương thức thêm tài khoản
    public boolean insertUser(Users u) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO users VALUES(?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, u.getUserID());
            ps.setString(2, u.getUserEmail());
            ps.setString(3, u.getUserPass());
            ps.setString(4, u.getUserName());
            ps.setBoolean(5, u.isUserRole());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // kiểm tra đăng nhập
    public Users login(String email, String password) {
        Connection con = DBConnect.getConnection();
        String sql = "select * from users where user_email='" + email + "' and user_pass='" + password + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Users u = new Users();
                u.setUserID(rs.getLong("user_id"));
                u.setUserEmail(rs.getString("user_email"));
                u.setUserPass(rs.getString("user_pass"));
                u.setUserName(rs.getString("user_name"));
                u.setUserRole(rs.getBoolean("user_role"));
                con.close();
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public Users getUser(long userID) {
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM users WHERE user_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, userID);
            ResultSet rs = ps.executeQuery();
            Users u = new Users();
            while (rs.next()) {
                u.setUserEmail(rs.getString("user_email"));
                u.setUserPass(rs.getString("user_pass"));
                u.setUserName(rs.getString("user_name"));
               
            }
            return u;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    // get list users - amdin
    public ArrayList<Users> getListUsersPageList(String keyword, int firstResult, int maxResult) throws SQLException{
        Connection connection = DBConnect.getConnection();
       
        String sql = "";
        if(keyword.length() != 0)
        {
            sql = "SELECT users.*, users.user_name FROM users where users.user_name like '%"+keyword+"%' or users.user_email like '%"+keyword+"%' order by user_id desc limit ?,?";
        }
        else
        {
            sql = "SELECT users.*, users.user_name FROM users order by user_id desc limit ?,?";
        }
        
        PreparedStatement ps = connection.prepareCall(sql);

        int page = firstResult ;
        ps.setInt(1, page);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
         ArrayList<Users> list = new ArrayList<>();
        while (rs.next()) {
            Users user = new Users();
            user.setUserID(rs.getLong("user_id"));
            user.setUserEmail(rs.getString("user_email"));
            user.setUserPass(rs.getString("user_pass"));
            user.setUserName(rs.getString("user_name"));
            user.setUserRole(rs.getBoolean("user_role"));
            
            list.add(user);
        }
        return list;
    }
    
 // total users
    public int countUsers() throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT count(user_id) FROM users";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;  
    }
    
    public boolean updateUser(Users c) {
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE users SET user_email = ?, user_name=? WHERE user_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getUserEmail());
            ps.setString(2, c.getUserName());
            ps.setLong(3, c.getUserID());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
    public boolean deleteUser(long userid) throws SQLException {
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "DELETE FROM users WHERE user_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, userid);
            int temp = ps.executeUpdate();
                return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }   

}
