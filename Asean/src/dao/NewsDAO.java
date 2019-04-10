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
import model.News;

/**
 *
 * @author Pathana
 */
public class NewsDAO {

    // get list news by category id
    public ArrayList<News> getListProductByCategory(long category_id) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM news WHERE category_id = '" + category_id + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<News> list = new ArrayList<>();
        while (rs.next()) {
            News news = new News();
            news.setNewsID(rs.getLong("news_id"));
            news.setNewsTitle(rs.getString("news_title"));
            news.setNewsImage(rs.getString("news_image"));
            
            news.setNewsContent(rs.getString("news_content"));
            list.add(news);
        }
        return list;
    }

    // display news details
    public News getProduct(long newsID) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM news WHERE news_id = '" + newsID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        News news = new News();
        while (rs.next()) {
        	news.setNewsID(rs.getLong("news_id"));
        	news.setCategoryID(rs.getLong("category_id"));
        	news.setNewsTitle(rs.getString("news_title"));
           
        	news.setNewsImage(rs.getString("news_image"));
            
        	news.setNewsContent(rs.getString("news_content"));
        }
        return news;
    }
    
    
    // get list news
    public ArrayList<News> getListProductByNav(long categoryID, int firstResult, int maxResult) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM news WHERE category_id = '" + categoryID + "' limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, firstResult-1);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<News> list = new ArrayList<>();
        while (rs.next()) {
            News news = new News();
            news.setNewsID(rs.getLong("news_id"));
            news.setNewsTitle(rs.getString("news_title"));
            news.setNewsImage(rs.getString("news_image"));
            news.setNewsContent(rs.getString("news_content"));
            list.add(news);
        }
        return list;
    }
    
    // total news
    public int countProductByCategory(long categoryID) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT count(news_id) FROM news WHERE category_id = '" + categoryID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;  
    }
    
    // get list news - amdin
    public ArrayList<News> getListProductPageList(String keyword, int firstResult, int maxResult) throws SQLException{
        Connection connection = DBConnect.getConnection();
       
        String sql = "";
        if(keyword.length() != 0)
        {
            sql = "SELECT news.*, category.category_name FROM news join category on news.category_id = category.category_id where news.news_title like '%"+keyword+"%' or news.news_content like '%"+keyword+"%' or category.category_name like '%"+keyword+"%' order by news_id desc limit ?,?";
        }
        else
        {
            sql = "SELECT news.*, category.category_name FROM news join category on news.category_id = category.category_id order by news_id desc limit ?,?";
        }
        
        PreparedStatement ps = connection.prepareCall(sql);

        int page = firstResult ;
        ps.setInt(1, page);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
         ArrayList<News> list = new ArrayList<>();
        while (rs.next()) {
            News news = new News();
            news.setNewsID(rs.getLong("news_id"));
            news.setNewsTitle(rs.getString("news_title"));
            news.setNewsImage(rs.getString("news_image"));
            news.setNewsContent(rs.getString("news_content"));
            news.setCategoryID(rs.getLong("category_id"));
            news.setCategoryName(rs.getString("category_name"));
            list.add(news);
        }
        return list;
    }

 
    
    // total news - không theo thể loại
    public int countProduct() throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT count(news_id) FROM news";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;  
    }
    
    // insert sản phẩm
    public void insert(News p) throws SQLException 
    {
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "INSERT INTO news VALUE(?,?,?,?,?)";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, p.getNewsID());
            ps.setLong(2, p.getCategoryID());
            ps.setString(3, p.getNewsTitle());
            ps.setString(4, p.getNewsImage());
            ps.setString(5, p.getNewsContent());
		         
            int temp = ps.executeUpdate();
            //return temp == 1;
        } catch (Exception e) {
        //return false;
	}
    }
    
    	// update news
	public boolean update(News pro) throws SQLException {
	    try {
	         Connection connection = DBConnect.getConnection();
                 int temp = 0;
                 if(pro.getNewsImage().length() == 0)
                 {
                    String sql = "UPDATE news SET news_title = ?,  news_content = ?,  category_id = ? WHERE news_id = ?";
                    PreparedStatement ps = connection.prepareCall(sql);
                    ps.setString(1, pro.getNewsTitle());
                    
                    ps.setString(2, pro.getNewsContent());
                    ps.setLong(3, pro.getCategoryID());
                    
                    ps.setLong(4, pro.getNewsID());
                    temp = ps.executeUpdate();
                    return temp == 1;
                 }
                 else
                 {
                    String sql = "UPDATE news SET news_title = ?, news_content = ?,  category_id = ?, news_image = ? WHERE news_id = ?";
                    PreparedStatement ps = connection.prepareCall(sql);
                    ps.setString(1, pro.getNewsTitle());
                    
                    ps.setString(2, pro.getNewsContent());
                    ps.setLong(3, pro.getCategoryID());
                    ps.setString(4, pro.getNewsImage());
                    
                    ps.setLong(5, pro.getNewsID());
                    temp = ps.executeUpdate();
                    return temp == 1;
                 }
	    } catch (Exception e) {
	         return false;
	    }
	}
       
        // delete news
        public boolean delete(long productid) throws SQLException {
            try {
                Connection connection = DBConnect.getConnection();
                String sql = "DELETE FROM news WHERE news_id = ?";
                PreparedStatement ps = connection.prepareCall(sql);
                ps.setLong(1, productid);
                int temp = ps.executeUpdate();
                    return temp == 1;
            } catch (Exception e) {
                return false;
            }
        }    
    
    public static void main(String[] args) throws SQLException {
        NewsDAO dao = new NewsDAO();
//        for (Product p : dao.getListProductByCategory(3)) {
//            System.out.println(p.getProductID() + " - " + p.getProductName());
//        }
        //System.out.println(dao.countProductByCategory(1));
        System.out.println(dao.countProduct());
       // productDAO.countProduct()
       // ArrayList<Product> list = dao.getListProductPageList(0, 8);
        //System.out.println(list.size());

        //dao.insert(new Product(dao.countProduct() + 1, 2, "Áo caro", "NULL", 120000, "ABC" ));
    }
    
}
