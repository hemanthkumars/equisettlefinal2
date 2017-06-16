package com.equisettle.ui.client.controller;
import com.equisettle.foundation.client.EncryptAndDecrypt;
import com.equisettle.foundation.domain.Client;
import com.equisettle.ui.client.util.SessionManager;
import com.equisettle.ui.client.util.UserContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String userName=input.getString("userName");
		String password=input.getString("password");
		password=EncryptAndDecrypt.encrypt(password);
		Client cleint=Client.authenticateLogin(userName, password);
		JSONObject output= new JSONObject();
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
			output.put("clientName",cleint.getFirstName());
			
		}
		
		
		
		return output.toString();
	}
	
}
