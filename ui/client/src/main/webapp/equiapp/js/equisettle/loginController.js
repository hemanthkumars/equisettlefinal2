var urlappend2="http://localhost:8555/client/"
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
    		"rpwdForCreating":$("#rpwdForCreating").val()};
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