package orishop.models;

import java.io.Serializable;
import java.sql.Date;

public class EmployeeModels implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int employeeId;
	private String employeeName;
    private Date birthdate;
    private String gender;
    private String address;
    private String phone;
    private String mail;
    private String job;
    private int accountId;
    private String activityArea;
    private String imageURL;
    
	public EmployeeModels() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EmployeeModels(int employeeId, String employeeName, Date birthdate, String gender, String address,
			String phone, String mail, String job, int accountId, String activityArea, String imageURL) {
		super();
		this.employeeId = employeeId;
		this.employeeName = employeeName;
		this.birthdate = birthdate;
		this.gender = gender;
		this.address = address;
		this.phone = phone;
		this.mail = mail;
		this.job = job;
		this.accountId = accountId;
		this.activityArea = activityArea;
		this.imageURL = imageURL;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getActivityArea() {
		return activityArea;
	}

	public void setActivityArea(String activityArea) {
		this.activityArea = activityArea;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
}
