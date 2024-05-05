package orishop.models;
import java.io.Serializable;
import java.sql.Date;
public class CustomerModels implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int customerId;
    private String customerName;
    private Date birthday;
    private String gender;
    private String address;
    private long phone;
    private String mail;
    private String rank;
    private int reputation;
    private int rewardPoints;
    private int accountId;
    
	public CustomerModels() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CustomerModels(int customerId, String customerName, Date birthday, String gender, String address, long phone,
			String mail, String rank, int reputation, int rewardPoints, int accountId) {
		super();
		this.customerId = customerId;
		this.customerName = customerName;
		this.birthday = birthday;
		this.gender = gender;
		this.address = address;
		this.phone = phone;
		this.mail = mail;
		this.rank = rank;
		this.reputation = reputation;
		this.rewardPoints = rewardPoints;
		this.accountId = accountId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
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

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public int getReputation() {
		return reputation;
	}

	public void setReputation(int reputation) {
		this.reputation = reputation;
	}

	public int getRewardPoints() {
		return rewardPoints;
	}

	public void setRewardPoints(int rewardPoints) {
		this.rewardPoints = rewardPoints;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
}
