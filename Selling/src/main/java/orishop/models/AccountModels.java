package orishop.models;
import java.io.Serializable;

public class AccountModels implements Serializable {
private static final long serialVersionUID = 1L;
	
	private int accountID;
	private String username;
	private String password;
	private String mail;
	private int roleID;
	private int status;
	private String code;
	
	
	public AccountModels() {
		super();
		}
	
	public AccountModels(String username, String mail, String code) {
		super();
		this.username = username;
		this.mail = mail;
		this.code = code;
	}

	public AccountModels(String username, String password, String mail, int roleID, int status,
			String code) {
		super();
		this.username = username;
		this.password = password;
		this.mail = mail;
		this.roleID = roleID;
		this.status = status;
		this.code = code;
	}

	public AccountModels(int accountID, String username, String password, String mail, int roleID,
			int status, String code) {
		super();
		this.accountID = accountID;
		this.username = username;
		this.password = password;
		this.mail = mail;
		this.roleID = roleID;
		this.status = status;
		this.code = code;
	}


	public int getAccountID() {
		return accountID;
	}


	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}



	public String getMail() {
		return mail;
	}


	public void setMail(String mail) {
		this.mail = mail;
	}


	public int getRoleID() {
		return roleID;
	}


	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}
}
