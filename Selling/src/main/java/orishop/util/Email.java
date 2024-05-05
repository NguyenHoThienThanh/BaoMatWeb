package orishop.util;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import orishop.models.AccountModels;

public class Email {
	public String getRandom() {
		Random rnd = new Random();
		int number = rnd.nextInt(999999);
		return String.format("%06d", number);
	}
	
	public boolean sendEmail(AccountModels account) {
		boolean test = false;
		String toEmail = account.getMail();
		String fromEmail = "21110587@student.hcmute.edu.vn";
		String password = "ngahungA@96";
		
		try {
			Properties pr = configEmail(new Properties());
			Session session = Session.getInstance(pr, new Authenticator() {
				
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(fromEmail, password);
				}
			});
		Message mess = new MimeMessage(session);
		mess.setHeader("Content-Type", "text/plain; charset=UTF-8");
		mess.setFrom(new InternetAddress(fromEmail));
		mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			
		mess.setSubject("Confirm-Code");
		
		mess.setText("Your is code: "+ account.getCode());
		
		Transport.send(mess);
		
		test = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return test;
		
		
	}
	
	public boolean EmailSend(AccountModels user) {
		boolean test = false;
		String toEmail = user.getMail();
		String fromEmail = "21110587@student.hcmute.edu.vn";
		String password = "ngahungA@96";
		try {
			Properties pr = configEmail(new Properties());
			Session session = Session.getInstance(pr, new Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(fromEmail, password);
				}
			});
		Message mess = new MimeMessage(session);
		mess.setHeader("Content-Type", "text/plain; charset=UTF-8");
		mess.setFrom(new InternetAddress(fromEmail));
		mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			
		mess.setSubject("Yours Password");
		String passwordDecryption = PasswordEncryption.decrypt(user.getPassword(), Constant.SECRETKEY, Constant.SALT);
		mess.setText("Password: "+ passwordDecryption);
		
		Transport.send(mess);
		
		test = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return test;
		
		
	}
	
	public Properties configEmail(Properties pr) {
		pr.setProperty("mail.smtp.host","smtp.gmail.com");
		pr.setProperty("mail.smtp.port","587");
		pr.setProperty("mail.smtp.auth","true");
		pr.setProperty("mail.smtp.starttls.enable", "true");
		pr.put("mail.smtp.socketFactory.port", "587");
		pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		return pr;
	}
}
