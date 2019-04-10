/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Pathana
 */
public class News {
    private long newsID;
    private long categoryID;
    private String newsTitle;
    private String newsImage;
    private String newsContent;
    

    public News(long newsID, long categoryID, String newsTitle, String newsImage,  String newsContent,String categoryName) {
        this.newsID = newsID;
        this.categoryID = categoryID;
        this.newsTitle = newsTitle;
        this.newsImage = newsImage;
        
        this.newsContent = newsContent;
        this.categoryName=categoryName;
        
    }
  
    private String categoryName;
    
    public News() {
    }

	public long getNewsID() {
		return newsID;
	}

	public void setNewsID(long newsID) {
		this.newsID = newsID;
	}

	public long getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(long categoryID) {
		this.categoryID = categoryID;
	}

	public String getNewsTitle() {
		return newsTitle;
	}

	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}

	public String getNewsImage() {
		return newsImage;
	}

	public void setNewsImage(String newsImage) {
		this.newsImage = newsImage;
	}

	public String getNewsContent() {
		return newsContent;
	}

	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
    
    

    
}
