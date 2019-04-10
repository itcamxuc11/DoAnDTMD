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


import controller.Contact;

/**
 *
 * @author Pathana
 */
public class ContactDAO {



    // insert contact
    public boolean insertContact(Contact u) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO contact VALUES(?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, u.getContactID());
            ps.setString(2, u.getContactName());
            ps.setString(3, u.getContactEmail());
            ps.setString(4, u.getContactPhone());
            
            ps.setString(5, u.getContactQuestion());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ContactDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    
    
    public Contact getContact(long contactID) {
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM contact WHERE contact_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, contactID);
            ResultSet rs = ps.executeQuery();
            Contact u = new Contact();
            while (rs.next()) {
                u.setContactName(rs.getString("contact_name"));
                u.setContactEmail(rs.getString("contact_email"));
                u.setContactPhone(rs.getString("contact_phone"));
                u.setContactQuestion(rs.getString("contact_question"));
               
            }
            return u;
        } catch (SQLException ex) {
            Logger.getLogger(ContactDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList<Contact> getListContactPageList(String keyword, int firstResult, int maxResult) throws SQLException{
        Connection connection = DBConnect.getConnection();
       
        String sql = "";
        if(keyword.length() != 0)
        {
            sql = "SELECT contact.*, contact.contact_name FROM contact where contact.contact_name like '%"+keyword+"%' or contact.contact_email like '%"+keyword+"%' order by contact_id desc limit ?,?";
        }
        else
        {
            sql = "SELECT contact.*, contact.contact_name FROM contact order by contact_id desc limit ?,?";
        }
        
        PreparedStatement ps = connection.prepareCall(sql);

        int page = firstResult ;
        ps.setInt(1, page);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
         ArrayList<Contact> list = new ArrayList<>();
        while (rs.next()) {
            Contact contact = new Contact();
            contact.setContactID(rs.getLong("contact_id"));
            contact.setContactName(rs.getString("contact_name"));
            contact.setContactEmail(rs.getString("contact_email"));
            contact.setContactPhone(rs.getString("contact_phone"));
            contact.setContactQuestion(rs.getString("contact_question"));
            
            list.add(contact);
        }
        return list;
    }
    
 // total contact
    public int countContact() throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT count(contact_id) FROM contact";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;  
    }
    
   
    
    public boolean deleteContact(long contactid) throws SQLException {
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "DELETE FROM contact WHERE contact_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, contactid);
            int temp = ps.executeUpdate();
                return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }   

}
