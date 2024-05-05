package orishop.models;

import java.io.Serializable;
public class JobModels implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String jobID;
	private String jobTitle;
	public JobModels() {
		super();
		// TODO Auto-generated constructor stub
	}
	public JobModels(String jobID, String jobTitle) {
		super();
		this.jobID = jobID;
		this.jobTitle = jobTitle;
	}
	public String getJobID() {
		return jobID;
	}
	public void setJobID(String jobID) {
		this.jobID = jobID;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	
	
}
