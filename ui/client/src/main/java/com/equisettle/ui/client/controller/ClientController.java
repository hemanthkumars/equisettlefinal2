package com.equisettle.ui.client.controller;
import com.equisettle.foundation.client.EncryptAndDecrypt;
import com.equisettle.foundation.domain.Case;
import com.equisettle.foundation.domain.Client;
import com.equisettle.foundation.domain.Country;
import com.equisettle.ui.client.util.SessionManager;
import com.equisettle.ui.client.util.UserContext;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.apache.bcel.generic.InstructionConstants.Clinit;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/client")
@Controller
public class ClientController {
	@RequestMapping(value = "/authenticateLogin", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String login(HttpServletRequest request,HttpServletResponse reresponse)  {
		JSONObject input= new JSONObject(request.getParameter("input"));
		JSONObject output= new JSONObject();
		try {
			String userName=input.getString("userName");
			String password=input.getString("password");
			password=EncryptAndDecrypt.encrypt(password);
			Client cleint=Client.authenticateLogin(userName, password);
		
			if(cleint==null){
				output.put("error", "true");
				output.put("message", "Invalid Username or Password");
			}else{
				output.put("error", "false");
				output.put("message", "Login Successfull");
				UserContext userContext= new UserContext();
				userContext.setClient(cleint);
				SessionManager.putUserContext(request, userContext);
				output.put("JSESSIONID", request.getSession().getId());
				output.put("clientName",cleint.getFirstName().toUpperCase());
				
			}
			
			
			
			return output.toString();
		} catch (Exception e) {
			output.put("error", "true");
			output.put("message", "Some error  ");
			return output.toString();
		}
	}
	
	@RequestMapping(value = "/invalidateSession", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String invalidateSession(HttpServletRequest request,HttpServletResponse reresponse)  {
		JSONObject input= new JSONObject(request.getParameter("input"));
		JSONObject output= new JSONObject();
		request.getSession().invalidate();
		
		try {
			output.put("error", "false");
			output.put("message", "Some error  ");
			return output.toString();
		} catch (Exception e) {
			output.put("error", "true");
			output.put("message", "Some error  ");
			return output.toString();
		}
	}
	
	
	 /*var input={"fullname":$("#fullname").val(),
	    		"email":$("#email").val(),
	    		"address":$("#address").val(),
	    		"city":$("#city").val(),
	    		"countryCode":$("#countryCode").val(),
	    		"usernameForCreating":$("#usernameForCreating").val(),
	    		"pwdForCreating":$("#pwdForCreating").val(),
	    		"rpwdForCreating":$("#rpwdForCreating").val()};*/
	
	@RequestMapping(value = "/createAccount", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String createAccount(HttpServletRequest request,HttpServletResponse reresponse)  {
		JSONObject input= new JSONObject(request.getParameter("input"));
		JSONObject output= new JSONObject();
		try {
			String fullname=input.getString("fullname");
			String address=input.getString("address");
			String city=input.getString("city");
			String countryCode=input.getString("countryCode");
			String usernameForCreating=input.getString("usernameForCreating");
			String pwdForCreating=input.getString("pwdForCreating");
			String email=input.getString("email");
			
			
			Client cleint=Client.findUserByUserName(usernameForCreating);
			
			
			
			if(cleint!=null){
				output.put("error", "true");
				output.put("message", "Username : "+ usernameForCreating+" "+" is already taken !! please try some other username");
				return output.toString();
			}else{
				Client client=new Client();
				client.setAddress(address);
				client.setAuditCreatedDtTime(new Date(System.currentTimeMillis()));
				client.setCity(city);
				Country country= Country.findCountryByCode(countryCode);
				if(country==null){
					output.put("error", "true");
					output.put("message", "Invalid Country" );
					return output.toString();
				
				}
				client.setCountryId(country);	
				client.setEmail(email);
				client.setFirstName(fullname);
				client.setPassword(EncryptAndDecrypt.encrypt(pwdForCreating));
				client.setUserName(usernameForCreating);
				client.persist();
				output.put("error", "false");
				output.put("message", "User successfully created . Please login now" );
				return output.toString();
			
				
			}
		} catch (Exception e) {
			output.put("error", "true");
			output.put("message", "Input error" );
			return output.toString();
		}
		
	}
	
	
	/*var input={"caseTypeId":caseTypeId,
			 "caseTitle":caseTitle,
			 "caseDescription":caseDescription,
			 "address":address,
			 "otherPartyName":otherPartyName,
			 "otherPartyMobile":otherPartyMobile,
			 "otherPartyEmail":otherPartyEmail
	    		};*/
	
	@RequestMapping(value = "/createNewCase", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String createNewCase(HttpServletRequest request,HttpServletResponse reresponse)  {
		JSONObject input= new JSONObject(request.getParameter("input"));
		JSONObject output= new JSONObject();
		try {
			Integer caseTypeId=input.getInt("caseTypeId");
			String caseTitle=input.getString("caseTitle");
			String caseDescription=input.getString("caseDescription");
			String address=input.getString("address");
			String otherPartyName=input.getString("otherPartyName");
			String otherPartyMobile=input.getString("otherPartyMobile");
			String otherPartyEmail=input.getString("otherPartyEmail");
			
			UserContext userContext=SessionManager.getUserContext(request);
			Case case1= new Case();
			case1.setAuditCreatedDtTime(new Date(System.currentTimeMillis()));
			case1.setCaseAddress(address);
			case1.setCaseDescription(caseDescription);
			case1.setCaseInitiatedClientId(userContext.getClient());
			Client client= new Client();
			
			
			//case1.setCaseOnClientId();
			
			
			
				output.put("error", "false");
				output.put("message", "User successfully created . Please login now" );
				return output.toString();
			
				
		} catch (Exception e) {
			output.put("error", "true");
			output.put("message", "Input error" );
			return output.toString();
		}
		
	}
	
}
