package com.equisettle.foundation.domain;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;


import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "client")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "case1s", "case1s1", "case1s2", "case1s3", "caseNegotiations", "caseNegotiations1", "countryId" })
@RooJson
public class Client {
	
	 @Column(name = "LAST_LOGGED_IN")
	    private Date lastLoggedIn;
	    
	    @Column(name = "AUDIT_CREATED_DT_TIME")
	    private Date auditCreatedDtTime;
	    
	    @Column(name = "MOBILE_NO")
	    private String mobileNo;
	    
	    @Column(name = "EMAIL_OTP")
	    private String emailOtp;
	    
	    
	
	public String getEmailOtp() {
			return emailOtp;
		}



		public void setEmailOtp(String emailOtp) {
			this.emailOtp = emailOtp;
		}



	public String getMobileNo() {
			return mobileNo;
		}



		public void setMobileNo(String mobileNo) {
			this.mobileNo = mobileNo;
		}



	public Date getLastLoggedIn() {
			return lastLoggedIn;
		}



		public void setLastLoggedIn(Date lastLoggedIn) {
			this.lastLoggedIn = lastLoggedIn;
		}



		public Date getAuditCreatedDtTime() {
			return auditCreatedDtTime;
		}



		public void setAuditCreatedDtTime(Date auditCreatedDtTime) {
			this.auditCreatedDtTime = auditCreatedDtTime;
		}



	public static Client  authenticateLogin(String userName,String password){
		List<Client> logins=entityManager().createQuery("SELECT sl FROM Client sl WHERE sl.email='"+userName+"' "
				+ "  AND sl.password='"+password+"' ").getResultList();
		if(logins.isEmpty()){
			return null;
		}else{
			return logins.get(0);
		}
	}
	
	public static Client  findUserByUserName(String userName){
		List<Client> logins=entityManager().createQuery("SELECT sl FROM Client sl WHERE sl.userName='"+userName+"' "
				+ "").getResultList();
		if(logins.isEmpty()){
			return null;
		}else{
			return logins.get(0);
		}
	}
	
	public static Client  findUserByEmail(String email){
		List<Client> logins=entityManager().createQuery("SELECT sl FROM Client sl WHERE sl.email='"+email+"' "
				+ "").getResultList();
		if(logins.isEmpty()){
			return null;
		}else{
			return logins.get(0);
		}
	}
	
	public static Client  findUserByEmailAndOtp(String email,String emailOtp){
		List<Client> logins=entityManager().createQuery("SELECT sl FROM Client sl WHERE sl.email='"+email+"' AND sl.emailOtp='"+emailOtp+"' "
				+ "").getResultList();
		if(logins.isEmpty()){
			return null;
		}else{
			return logins.get(0);
		}
	}
	
	
}
