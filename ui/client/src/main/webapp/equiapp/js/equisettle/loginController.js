var urlappend2="http://localhost:8555/client/";
//var urlappend2="http://schoolwala.com:8080/client/"
function authienticateLogin(){
	var lusername=$("#lusername").val();
	var lpassword=$("#lpassword").val();
	$('#loginButton').attr('disabled', 'disabled');
    var input={"userName":lusername,"password":lpassword};
    $.ajax({
        dataType: "json",
        type : 'POST',
        url: urlappend2+'client/authenticateLogin',
        data: {"input":JSON.stringify(input)} ,
        success: function(data) {
        	$('#loginButton').removeAttr('disabled');
        	if(data.error=="false"){
        		toastr.success(data.message);
        		 localStorage.setItem('JSESSIONID', data.JSESSIONID);
                 localStorage.setItem('clientName', data.clientName);
        		location.href="index.html";
        	}else{
        		if(data.errorCode!=undefined){
        			toastr.error(data.message);
        			location.href="login.html";
        		}
        		toastr.error(data.message);
        	}
        	
        },
        error: function(data) {
        	$('#register-submit-btn').attr('disabled', 'disabled');
        }
    });

	
}

function createAccount(){
	var fullname=$("#fullname").val();
	var email=$("#email").val();
	var address=$("#address").val();
	var city=$("#city").val();
	var countryCode=$("#countryCode").val();
	var usernameForCreating=$("#usernameForCreating").val();
	usernameForCreating="";
	var pwdForCreating=$("#register_password").val();
	var rpwdForCreating=$("#rpwdForCreating").val();
	var mobileNo=$("#mobileNo").val();
	if(fullname=="" || fullname ==null){
		toastr.error("Please enter your name to register");
		return;
	}
	
	if(mobileNo=="" || mobileNo ==null){
		toastr.error("Please enter your  mobile no");
		return;
	}
	
	
	
	if(email=="" || email ==null){
		toastr.error("Please enter email to  register");
		return;
	}
	if(address=="" || address ==null){
		toastr.error("Please enter your address");
		return;
	}
	if(city=="" || city ==null){
		toastr.error("Please enter the city Name");
		return;
	}
	if(countryCode=="" || countryCode ==null){
		toastr.error("Please Select the country");
		return;
	}
	/*if(usernameForCreating=="" || usernameForCreating ==null){
		toastr.error("Please enter the username");
		return;
	}*/
	if(pwdForCreating=="" || pwdForCreating ==null){
		toastr.error("Please enter desired password");
		return;
	}
	if(rpwdForCreating=="" || rpwdForCreating ==null){
		toastr.error("Please re-enter the password");
		return;
	}
	if(pwdForCreating!=rpwdForCreating){
		toastr.error("Password are not matching , please make sure both are matching");
		return;
	}
	$('#register-submit-btn').attr('disabled', 'disabled');
    var input={"fullname":$("#fullname").val(),
    		"email":$("#email").val(),
    		"address":$("#address").val(),
    		"city":$("#city").val(),
    		"countryCode":$("#countryCode").val(),
    		"usernameForCreating":$("#usernameForCreating").val(),
    		"pwdForCreating":$("#register_password").val(),
    		"rpwdForCreating":$("#rpwdForCreating").val(),
    		"mobileNo":mobileNo};
    $.ajax({
        dataType: "json",
        type : 'POST',
        url: urlappend2+'client/createAccount',
        data: {"input":JSON.stringify(input)} ,
        success: function(data) {
        	$('#register-submit-btn').removeAttr('disabled');
        	if(data.error=="false"){
        		toastr.success(data.message);
        	}else{
        		if(data.errorCode!=undefined){
        			toastr.error(data.message);
        			location.href="login.html";
        		}
        		toastr.error(data.message);
        	}
        	
        },
        error: function(data) {
        	$('#register-submit-btn').attr('disabled', 'disabled');
        }
    });

	
}
clearSessionInfo();

function clearSessionInfo(){
	 localStorage.setItem('JSESSIONID', '');
     localStorage.setItem('clientName', '');
}

$("#otp").hide();
$("#newPwd1").hide();
$("#newPwd2").hide();
$("#resetPwd").hide();

function sendOtpToEmail(){
	var emailToRecover=$("#emailToRecover").val();
	if(emailToRecover=="" || emailToRecover ==null){
		toastr.error("Please enter the email ");
		return;
	}
	$('#sendOtpButton').attr('disabled', 'disabled');
    var input={"emailToRecover":emailToRecover};
    $.ajax({
        dataType: "json",
        type : 'POST',
        url: urlappend2+'client/sendOtpToEmail',
        data: {"input":JSON.stringify(input)} ,
        success: function(data) {
        	$('#sendOtpButton').removeAttr('disabled');
        	if(data.error=="false"){
        		toastr.success(data.message);
        		$("#resetPwd").show();
        		$("#otp").show();
        		$("#newPwd1").show();
        		$("#newPwd2").show();
        		$("#sendOtpButton").hide(); 
        		$('#emailToRecover').attr('disabled', 'disabled');
        	}else{
        		if(data.errorCode!=undefined){
        			toastr.error(data.message);
        			location.href="login.html";
        		}
        		toastr.error(data.message);
        	}
        	
        },
        error: function(data) {
        	$('#register-submit-btn').attr('disabled', 'disabled');
        }
    });
	
}


function resetpassword(){
	var otp=$("#otp").val();
	var newPwd1=$("#newPwd1").val();
	var newPwd2=$("#newPwd2").val();
	if(otp==''||otp==null){
		toastr.error("Please Enter the OTP which you received in your Email Id");
	}
	if(newPwd1==''||newPwd1==null){
		toastr.error("Please Enter the New password");
	}
	if(newPwd2==''||newPwd2==null){
		toastr.error("Please Re-Enter the New password");
	}
	if(newPwd2.length<5){
		toastr.error("Your Password should be atleast 5 characters");
	}
	
	$('#loginButton').attr('disabled', 'disabled');
    var input={"otp":otp,"password":newPwd1,"emailToRecover":emailToRecover};
    $.ajax({
        dataType: "json",
        type : 'POST',
        url: urlappend2+'client/resetPassword',
        data: {"input":JSON.stringify(input)} ,
        success: function(data) {
        	$('#loginButton').removeAttr('disabled');
        	if(data.error=="false"){
        		alert("Please log in now");
        		location.href="login.html";
        	}else{
        		if(data.errorCode!=undefined){
        			toastr.error(data.message);
        			location.href="login.html";
        		}
        		toastr.error(data.message);
        	}
        	
        },
        error: function(data) {
        	$('#register-submit-btn').attr('disabled', 'disabled');
        }
    });
	
}










