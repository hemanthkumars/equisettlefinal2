package com.equisettle.ui.client.util;

import java.io.*;
import java.net.InetAddress;
import java.util.List;
import java.util.Properties;
import java.util.Date;

import javax.mail.*;
import javax.mail.internet.*;

import com.sun.mail.smtp.*;


public class SendMail implements Runnable{
	private List<String> recepients;
	private String message;
	private String subject;
	
	public SendMail(List<String> recepients,String message,String subject) {
		this.recepients=recepients;
		this.message=message;
		this.subject=subject;
	}
	
	
    public static void main(String args[]) throws Exception {
        Properties props = System.getProperties();
        props.put("mail.smtps.host","smtp.mailgun.org");
        props.put("mail.smtps.auth","true");
        Session session = Session.getInstance(props, null);
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress("equisettle@gmail.com"));
        msg.setRecipients(Message.RecipientType.TO,
        InternetAddress.parse("hemanthkumars.india@gmail.com", false));
        msg.setSubject("Hello1233333");
        msg.setText("Testing some Mailgun awesomness");
        msg.setSentDate(new Date());
        SMTPTransport t =
            (SMTPTransport)session.getTransport("smtps");
        t.connect("smtp.mailgun.com", "postmaster@sandbox99efa7b94c5f4ba5b303d31f68a12155.mailgun.org", "1df5c57695f11bf2a6c632d7a217c5df");
        t.sendMessage(msg, msg.getAllRecipients());
        System.out.println("Response: " + t.getLastServerResponse());
        t.close();
    }
    
    public static void sendMail(List<String> recepients,String message,String subject) throws Exception {
    	Thread thread= new Thread(new SendMail(recepients, message, subject));
    	thread.start();
    }

	public void run() {
        Properties props = System.getProperties();
        props.put("mail.smtps.host","smtp.mailgun.org");
        props.put("mail.smtps.auth","true");
        Session session = Session.getInstance(props, null);
        Message msg = new MimeMessage(session);
        try {
			msg.setFrom(new InternetAddress("leokidsbangalore@gmail.com"));
        msg.setRecipients(Message.RecipientType.TO,
        InternetAddress.parse(recepients.get(0), false));
        msg.setSubject(subject);
        msg.setText(message);
        msg.setSentDate(new Date());
        SMTPTransport t =
            (SMTPTransport)session.getTransport("smtps");
        t.connect("smtp.mailgun.com", "postmaster@sandboxe19f77c38c6a4faf9fc31b1ada8461cd.mailgun.org", "a0dbf999111b963805b2607defc98e83");
        t.sendMessage(msg, msg.getAllRecipients());
        System.out.println("Response: " + t.getLastServerResponse());
        t.close();
        } catch (Exception e) {
			e.printStackTrace();
		} 
    
		
	}
    
/*    public static ClientResponse SendSimpleMessage() {
        Client client = Client.create();
        client.addFilter(new HTTPBasicAuthFilter("api",
                        "key-115c0c5ecbe98748665ea0930cca248d"));
        WebResource webResource =
                client.resource("https://api.mailgun.net/v3/sandboxe19f77c38c6a4faf9fc31b1ada8461cd.mailgun.org" +
                                "/messages");
        MultivaluedMapImpl formData = new MultivaluedMapImpl();
        formData.add("from", "Excited User <mailgun@sandboxe19f77c38c6a4faf9fc31b1ada8461cd.mailgun.org>");
        formData.add("to", "bar@example.com");
        formData.add("to", "leokidsbangalore@gmail.com");
        formData.add("subject", "Hello");
        formData.add("text", "Testing some Mailgun awesomness!");
        return webResource.type(MediaType.APPLICATION_FORM_URLENCODED).
                post(ClientResponse.class, formData);
 }
*/
    
}

