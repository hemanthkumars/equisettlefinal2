package com.equisettle.ui.client.controller;
import com.equisettle.foundation.client.EncryptAndDecrypt;
import com.equisettle.foundation.domain.Case;
import com.equisettle.foundation.domain.CaseNegotiation;
import com.equisettle.foundation.domain.CaseStatus;
import com.equisettle.foundation.domain.CaseType;
import com.equisettle.foundation.domain.Client;
import com.equisettle.foundation.domain.Country;
import com.equisettle.ui.client.util.GeneralConstansts;
import com.equisettle.ui.client.util.SendMail;
import com.equisettle.ui.client.util.SessionManager;
import com.equisettle.ui.client.util.UserContext;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.apache.bcel.generic.InstructionConstants.Clinit;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/client")
@Controller
public class ClientController implements GeneralConstansts {
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
				output.put("email",cleint.getEmail());
				
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
			//String usernameForCreating=input.getString("usernameForCreating");
			String pwdForCreating=input.getString("pwdForCreating");
			String email=input.getString("email");
			String mobileNo=input.getString("mobileNo");
			
			//Client cleint=Client.findUserByUserName(usernameForCreating);
			
			Client cleintByEmail=Client.findUserByEmail(email);
			
			if(cleintByEmail!=null){
				output.put("error", "true");
				output.put("message", "Email : "+ email+" "+" is already registered !! please try with some other email");
				return output.toString();
			}
		/*	if(cleint!=null){
				output.put("error", "true");
				output.put("message", "Username : "+ usernameForCreating+" "+" is already taken !! please try some other username");
				return output.toString();
			}else*/{
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
				client.setUserName("");
				client.setMobileNo(mobileNo);
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
			Integer settlementTypeId=input.getInt("settlementTypeId");
			UserContext userContext=SessionManager.getUserContext(request);
			Case case1= new Case();
			case1.setAuditCreatedDtTime(new Date(System.currentTimeMillis()));
			case1.setCaseAddress(address);
			case1.setCaseDescription(caseDescription);
			case1.setCaseInitiatedClientId(userContext.getClient());
			CaseType caseType= new CaseType();
			caseType.setCaseTypeId(caseTypeId);
			case1.setCaseTypeId(caseType);
			Client clientByEmail= Client.findUserByEmail(otherPartyEmail);
			if(clientByEmail==null){
				clientByEmail= new Client();
				clientByEmail.setAddress(address);
				clientByEmail.setAuditCreatedDtTime(new Date(System.currentTimeMillis()));
				clientByEmail.setCity(userContext.getClient().getCity());
				clientByEmail.setCountryId(userContext.getClient().getCountryId());
				clientByEmail.setEmail(otherPartyEmail);
				clientByEmail.setFirstName(otherPartyName);
				clientByEmail.setLastName("");
				clientByEmail.setMobileNo(otherPartyMobile);
				Random random=new Random();
				String pwd=String.valueOf(random.nextInt());
				clientByEmail.setPassword(EncryptAndDecrypt.encrypt(pwd));
				clientByEmail.setUserName(otherPartyEmail);
				List<String> recepients=new ArrayList<String>();
				recepients.add(otherPartyEmail);
				String subject="";
				subject+=userContext.getClient().getFirstName()+" have sent an invitation to settle your both dispute on platform called Equisettle <br/>";
				subject+="Following is login username and randomly generated paswword <br/>";
				subject+="URL : http://equisettle.com/equiapp";
				subject+="Username : "+otherPartyEmail+"<br/>";
				subject+="Password : "+pwd+"<br/>";
				subject+=" * Note  after login you change your password";
				SendMail.sendMail(recepients, subject, userContext.getClient().getFirstName()+" have sent an invitation to settle your both dispute on platform called Equisettle.com");
			}else{
				List<String> recepients=new ArrayList<String>();
				recepients.add(otherPartyEmail);
				String subject="";
				subject+=userContext.getClient().getFirstName()+" have claimed a case on you on Equisettle.com platform<br/>";
				subject+="Case Title : "+caseTitle+" <br/>";
				subject+="Case Description : "+caseDescription+"<br/>";
				subject+=" * Please login http://equisettle.com/equiapp for more details ";
				SendMail.sendMail(recepients, subject, userContext.getClient().getFirstName()+" have sent an invitation to settle your both dispute on platform called Equisettle.com");
			}
			
			
			case1.setCaseOnClientId(clientByEmail);
			CaseStatus caseStatusId= new CaseStatus();
			caseStatusId.setCaseStatusId(CASE_STATUS_CASE_INITIATED);
			case1.setCaseStatusId(caseStatusId);
			case1.setCaseTitle(caseTitle);
			if(settlementTypeId==1){
				case1.setClientIdWhoClaimsMoney(userContext.getClient());
				case1.setClientIdWhoVowsMoney(clientByEmail);
			}else{
				case1.setClientIdWhoClaimsMoney(clientByEmail);
				case1.setClientIdWhoVowsMoney(userContext.getClient());
			}
			case1.persist();
				output.put("error", "false");
				output.put("message", case1.getCaseTitle()+" Case is successfully created");
				return output.toString();
			
				
		} catch (Exception e) {
			output.put("error", "true");
			output.put("message", "Input error" );
			return output.toString();
		}
		
	}
	
	
	@RequestMapping(value = "/findCaseByMe", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String findCaseByMe(HttpServletRequest request,HttpServletResponse reresponse)  {
		JSONObject input= new JSONObject(request.getParameter("input"));
		JSONObject output= new JSONObject();
		try {
			Client client=SessionManager.getUserContext(request).getClient();
			List<Case> cases=Case.findCaseByInitiatedClient(client.getClientId());
			JSONArray jsonArray= new JSONArray();
			for (Case case1 : cases) {
               JSONObject jsonObject= new JSONObject();
               jsonObject.put("caseTitle", case1.getCaseTitle() );
               jsonObject.put("caseId", case1.getCaseId() );
               SimpleDateFormat dateFormat=new SimpleDateFormat("dd-MMM-yyyy");
               jsonObject.put("caseCreatedDate", dateFormat.format(case1.getAuditCreatedDtTime()));
               jsonObject.put("otherpartyName", case1.getCaseOnClientId().getFirstName() );
               jsonArray.put(jsonObject);
			}
			output.put("error", "false");
			output.put("result", jsonArray );
			return output.toString();
			
		}catch (Exception e) {
			output.put("error", "true");
			output.put("message", "Input error" );
			return output.toString();
		}
	}
	
	@RequestMapping(value = "/findCaseOnMe", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String findCaseOnMe(HttpServletRequest request,HttpServletResponse reresponse)  {
		JSONObject input= new JSONObject(request.getParameter("input"));
		JSONObject output= new JSONObject();
		try {
			Client client=SessionManager.getUserContext(request).getClient();
			List<Case> cases=Case.findCaseByOnClient(client.getClientId());
			JSONArray jsonArray= new JSONArray();
			for (Case case1 : cases) {
              JSONObject jsonObject= new JSONObject();
              jsonObject.put("caseTitle", case1.getCaseTitle() );
              jsonObject.put("caseId", case1.getCaseId() );
              SimpleDateFormat dateFormat=new SimpleDateFormat("dd-MMM-yyyy");
              jsonObject.put("caseCreatedDate", dateFormat.format(case1.getAuditCreatedDtTime()));
              jsonObject.put("otherpartyName", case1.getCaseOnClientId().getFirstName() );
              jsonArray.put(jsonObject);
			}
			output.put("error", "false");
			output.put("result", jsonArray );
			return output.toString();
			
		}catch (Exception e) {
			output.put("error", "true");
			output.put("message", "Input error" );
			return output.toString();
		}
	}
	
	@RequestMapping(value = "/findCaseFullDetails", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String findCaseFullDetails(HttpServletRequest request,HttpServletResponse reresponse)  {
		JSONObject input= new JSONObject(request.getParameter("input"));
		JSONObject output= new JSONObject();
		try {
			Integer caseId=input.getInt("currentCaseId");
			Case case1=Case.findCase(caseId);
			JSONObject caseData=new JSONObject();
			caseData.put("caseTitle", case1.getCaseTitle());
			caseData.put("caseId", case1.getCaseId());
			SimpleDateFormat dateFormat=new SimpleDateFormat("dd-MMM-yyyy");
			caseData.put("caseInitDate", dateFormat.format(case1.getAuditCreatedDtTime()));
			caseData.put("caseBy", case1.getCaseInitiatedClientId().getFirstName());
			caseData.put("caseOn", case1.getCaseOnClientId().getFirstName());
			caseData.put("mediator", "Not Assigned");
			caseData.put("caseStatus", "In Progress");
			
			
			List<CaseNegotiation> caseNegotiations=CaseNegotiation.findCaseNegoDetails(caseId);
			if(caseNegotiations==null){
				caseData.put("containsCaseNego", "false");
			}else{
				caseData.put("containsCaseNego", "true");
				/*sentDate2
				sentBy2
				offerAmt2
				offerMsg2
				
				replyDate2
				replyBy2
				counterOfferAmt2
				counterOfferMsg2*/
				Integer negoCount=0;
				caseData.put("content1", "false");
				caseData.put("content2", "false");
				caseData.put("content3", "false");
				SimpleDateFormat dateFormat2= new SimpleDateFormat("dd-MMM-yyyy hh:mm a");
				for (CaseNegotiation caseNegotiation : caseNegotiations) {
					negoCount+=1;
					caseData.put("content"+negoCount, "true");
					if(caseNegotiation.getCaseNegotiationSentDate()!=null){
						caseData.put("sentDate"+negoCount, dateFormat2.format(caseNegotiation.getCaseNegotiationSentDate()));
					}else{
						caseData.put("sentDate"+negoCount, "");
					}
					
					if(caseNegotiation.getCaseAttemptedById()!=null){
						caseData.put("sentBy"+negoCount, caseNegotiation.getCaseAttemptedById().getFirstName());
					}else{
						caseData.put("sentBy"+negoCount, "");
					}
					
					if(caseNegotiation.getCaseAttemptedNegotiationAmount()!=null){
						caseData.put("offerAmt"+negoCount, caseNegotiation.getCaseAttemptedNegotiationAmount());
					}else{
						caseData.put("offerAmt"+negoCount, "");
					}
					
					if(caseNegotiation.getNegotiationMessage()!=null){
						caseData.put("offerMsg"+negoCount, caseNegotiation.getNegotiationMessage());
					}else{
						caseData.put("offerMsg"+negoCount, "");
					}
					
					
					if(caseNegotiation.getRespondedDtTime()!=null){
						caseData.put("replyDate"+negoCount, dateFormat2.format(caseNegotiation.getRespondedDtTime()));
					}else{
						caseData.put("replyDate"+negoCount, "");
					}
					
					if(caseNegotiation.getCaseResponseById()!=null){
						caseData.put("replyBy"+negoCount, caseNegotiation.getCaseResponseById().getFirstName());
					}else{
						caseData.put("replyBy"+negoCount, "");
					}
					
					if(caseNegotiation.getCaseResponseNegotiationAmount()!=null){
						caseData.put("counterOfferAmt"+negoCount, caseNegotiation.getCaseResponseNegotiationAmount());
					}else{
						caseData.put("counterOfferAmt"+negoCount, "");
					}
					
					if(caseNegotiation.getCounterNegotiationMessage()!=null){
						caseData.put("counterOfferMsg"+negoCount, caseNegotiation.getCounterNegotiationMessage());
					}else{
						caseData.put("counterOfferMsg"+negoCount, "");
					}
					
					
				}
				
				
			}
			output.put("caseData", caseData);
			output.put("error", "false");
			return output.toString();
			
		}catch (Exception e) {
			output.put("error", "true");
			output.put("message", "Input error" );
			return output.toString();
		}
	}
	
	
	@RequestMapping(value = "/submitOffer", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String makeFirstOffer(HttpServletRequest request,HttpServletResponse reresponse)  {
		JSONObject input= new JSONObject(request.getParameter("input"));
		JSONObject output= new JSONObject();
		try {
			Client loggedClient=SessionManager.getUserContext(request).getClient();
			Integer offerAmount=input.getInt("offerAmount");
			String negoMessage=input.getString("negoMessage");
			Integer caseId=input.getInt("currentCaseId");
			
			Case case1=Case.findCase(caseId);
			Client caseIntiatedBy=case1.getCaseInitiatedClientId();
			Client caseOn=case1.getCaseOnClientId();
			String offerOrCounterOffer="";
			if(loggedClient.getClientId()==caseIntiatedBy.getClientId()){
				offerOrCounterOffer="offer";
			}else{
				offerOrCounterOffer="counterOffer";
			}
			
			if(offerOrCounterOffer.equalsIgnoreCase("offer")){
				List<CaseNegotiation> caseNegotiations=CaseNegotiation.findCaseNegoDetails(caseId);
				if(caseNegotiations.size()==3){
					if(caseNegotiations.get(2).getCaseResponseById()==null){
						output.put("error", "true");
						output.put("message", "Please wait till "+caseOn.getFirstName()+" responds !");
						return output.toString();
					}else{
						output.put("error", "true");
						output.put("message", "You cannot submit more than 3 Offer . Alternatively you can go for Final Arbitration !");
						return output.toString();
					}
				}
				for (CaseNegotiation caseNegotiation : caseNegotiations) {
					if(caseNegotiation.getCaseResponseById()==null){
						output.put("error", "true");
						output.put("message", caseOn.getFirstName()+"  , has not yet responded for your prevoius $"+caseNegotiation.getCaseAttemptedNegotiationAmount()+" offer . Hence you cannot submit another offer");
						return output.toString();
					}
				}
				CaseNegotiation caseNegotiation= new CaseNegotiation();
				caseNegotiation.setAuditCreatedDtTime(new Date(System.currentTimeMillis()));
				caseNegotiation.setCaseAttemptedById(caseIntiatedBy);
				caseNegotiation.setCaseAttemptedNegotiationAmount(offerAmount);
				caseNegotiation.setCaseId(case1);
				caseNegotiation.setCaseNegotiationSentDate(new Date(System.currentTimeMillis()));
				caseNegotiation.setNegotiationCount(caseNegotiations.size()+1);
				caseNegotiation.setNegotiationMessage(negoMessage);
				caseNegotiation.setNegotiationStatusId(NEGOTIATION_STATUS_ID_INITIATED);
				caseNegotiation.persist();

				output.put("error", "false");
				output.put("message", "Offer successfully submitted !");
				return output.toString();
			}else{
				List<CaseNegotiation> caseNegotiations=CaseNegotiation.findCaseNegoDetails(caseId);
				if(caseNegotiations.isEmpty()){
					output.put("error", "true");
					output.put("message", caseIntiatedBy.getFirstName()+" has not yet proposed an offer . Please wait till he/she  gives an offer" );
					return output.toString();
				}
				CaseNegotiation caseNegotiation=caseNegotiations.get(caseNegotiations.size()-1);
				if(caseNegotiation.getCaseResponseById()!=null){
					output.put("error", "true");
					output.put("message", "You have already submitted and counter offer of $"+caseNegotiation.getCaseResponseNegotiationAmount()+" Please wait till "+caseIntiatedBy.getFirstName()+" responds !"  );
					return output.toString();
				}
				caseNegotiation.setCaseResponseById(loggedClient);
				caseNegotiation.setCaseResponseNegotiationAmount(offerAmount);
				caseNegotiation.setCounterNegotiationMessage(negoMessage);
				caseNegotiation.setRespondedDtTime(new Date(System.currentTimeMillis()));
				caseNegotiation.merge();
				output.put("error", "false");
				output.put("message", "Counter Offer successfully submitted !");
			}
			
			output.put("error", "false");
			return output.toString();
			
		}catch (Exception e) {
			output.put("error", "true");
			output.put("message", "Input error" );
			return output.toString();
		}
	}
}
