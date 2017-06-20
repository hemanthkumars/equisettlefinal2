var urlappend2="http://localhost:8555/client/"
function authienticateLogin(){
    var input={"schoolClassSectionId":fcSchoolClassSectionId};
    $.ajax({
        dataType: "json",
        type : 'POST',
        url: 'admin/student/findAllStudentDetailsFeeCollect;jsessionid='+JSESSIONID,
        data: {"input":JSON.stringify(input)} ,
        success: function(data) {
        	if(data.error=="false"){
        		var results=JSON.parse(data.result);
        		populateStudentDataForPayment(results);
        	}else{
        		if(data.errorCode!=undefined){
        			alertify.error(data.message);
        			location.href="#/login";
        		}
        		alertify.error(data.message);
        	}
        	
        },
        error: function(data) {
          //  $('input.suggest-user').removeClass('ui-autocomplete-loading');  
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
	var pwdForCreating=$("#register_password").val();
	var rpwdForCreating=$("#rpwdForCreating").val();
	if(fullname=="" || fullname ==null){
		alertify.error("Please enter nameto register");
		return;
	}
	
	if(email=="" || email ==null){
		alertify.error("Please enter nameto register");
		return;
	}
	if(address=="" || address ==null){
		alertify.error("Please enter your address");
		return;
	}
	if(city=="" || city ==null){
		alertify.error("Please enter the city Name");
		return;
	}
	if(countryCode=="" || countryCode ==null){
		alertify.error("Please Select the country");
		return;
	}
	if(usernameForCreating=="" || usernameForCreating ==null){
		alertify.error("Please enter the username");
		return;
	}
	if(pwdForCreating=="" || pwdForCreating ==null){
		alertify.error("Please enter desired password");
		return;
	}
	if(rpwdForCreating=="" || rpwdForCreating ==null){
		alertify.error("Please re-enter the password");
		return;
	}
	if(pwdForCreating!=rpwdForCreating){
		alertify.error("Password are not matching , please make sure both are matching");
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
        		alertify.error(data.message);
        	}else{
        		if(data.errorCode!=undefined){
        			alertify.error(data.message);
        			location.href="login.html";
        		}
        		alertify.error(data.message);
        	}
        	
        },
        error: function(data) {
        	$('#register-submit-btn').attr('disabled', 'disabled');
        }
    });

	
}