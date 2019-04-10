package controller;

public class Contact {
	private long contactID;
    private String contactName;
    private String contactEmail;
    private String contactPhone;

    private String contactQuestion;
    
    public Contact() {
    }
    
    public Contact(long contactID, String contactName, String contactEmail, String contactPhone,String contactQuestion) {
        this.contactID = contactID;
        this.contactName = contactName;
        this.contactEmail = contactEmail;
        this.contactPhone = contactPhone;
      
        this.contactQuestion = contactQuestion;
    }

	public long getContactID() {
		return contactID;
	}

	public void setContactID(long contactID) {
		this.contactID = contactID;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getContactEmail() {
		return contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public String getContactPhone() {
		return contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	
	
	public String getContactQuestion() {
		return contactQuestion;
	}

	public void setContactQuestion(String contactQuestion) {
		this.contactQuestion = contactQuestion;
	}

	public void insertContac(long time, String contact_name, String contact_email, String contact_phone, String img,
			String contact_question) {
		// TODO Auto-generated method stub
		
	}

	
    


}
