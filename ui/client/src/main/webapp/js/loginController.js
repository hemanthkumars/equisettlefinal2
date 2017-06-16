angular.module('app')
.controller ('loginController', function($scope,$rootScope,$stateParams,$http,$filter,$state,$window,$timeout) {
	$('#fullDashBoard').attr('style', 'visibility: collapse;');
	$('#userName').focus();
   $rootScope.urlappend="http://localhost:8555/client/";
//	$rootScope.urlappend="http://easybolt.in/admin/";
	//$rootScope.urlappend="http://schoolwala.com:8080/admin/"


	$rootScope.JSESSIONID="";
	$rootScope.schoolName="";
	$rootScope.schooolAddress="";
	$rootScope.schoolLogo="";

	$rootScope.validateSession=function(data){
		if(data.error=="true"){
			if(data.errorCode!=undefined){
				if(data.errorCode=="1"){
					alertify.error("Sorry Your Has Expired.Please Log In Again!");
					$("#menuGrid").hide();
				    $("#quikNavigationDiv").hide();
					$state.go("login",{});
				}
			}
		}
	};
	   $rootScope.fetchAcademicYear=function(){

			var serverPath="admin/schoolsetup/fetchAcademicYear";
			var input={};
			$http({
	            url: $rootScope.urlappend + serverPath+';jsessionid='+$rootScope.JSESSIONID,
	            method: "POST",
	            params:{"input":JSON.stringify(input)}

	        }).success(function (data, status, headers, config) {
	        	$rootScope.validateSession(data);
	        	if(data.error=="true"){
	        		alertify.error(data.message);
	        	}else{
	        		$rootScope.academicYearRes=JSON.parse(data.result);
	        	}

	        }).error(function (data, status, headers, config) {

	        });
	    }

    $scope.login=function(){
    	if($scope.userName==''||$scope.userName==undefined){
    		alertify.error("Please enter the username");
    		$('#loginButton').removeAttr('disabled');
    		$scope.loadingImg=false;
    		return;
    	}
    	if($scope.password==''||$scope.password==undefined){
    		alertify.error("Please Enter the Password");
    		$('#loginButton').removeAttr('disabled');
    		$scope.loadingImg=false;
    		return;
    	}
    	console.log($scope.userName);
    	console.log($scope.password);
    	var input={"userName":$scope.userName,"password":$scope.password};
    	var serverPath="client/authenticateLogin"
    		$scope.loadingImg=true;
    	$('#loginButton').attr('disabled', 'disabled');
    	 $http({
	            url: $rootScope.urlappend + serverPath+';jsessionid'+$rootScope.JSESSIONID,
	            method: "POST",
	            params:{input: JSON.stringify(input)}

	        }).success(function (data, status, headers, config) {
	        	$scope.loadingImg=false;
	        	if(data.error=="false"){
	        		alertify.success("Login Successfull!");
	        		$rootScope.JSESSIONID=data.JSESSIONID;
	        		JSESSIONID=data.JSESSIONID;
                    $("#menuGrid").show();
                    $("#quikNavigationDiv").show();
                    $rootScope.fetchAcademicYear();
                    $window.localStorage.setItem('JSESSIONID', data.JSESSIONID);
                    $window.localStorage.setItem('clientName', data.clientName);
                    $window.localStorage.setItem('urlappend', $rootScope.urlappend);
                    
                    $rootScope.clientName=data.clientName;
                    $timeout(populateTiltle(data.clientName),0);
                    
	        		$state.go("dashboard",{});
	        	}else{
	        		alertify.error(data.message);
	        	}
	        	$('#loginButton').removeAttr('disabled');
	        }).error(function (data, status, headers, config) {
	        	$('#loginButton').removeAttr('disabled');
	        });
    	//$state.go("dashboard",{});

    };




 });

//var urlappend="http://easybolt.in/admin/";
//var urlappend="http://schoolwala.com:8080/admin/";

 var urlappend="http://localhost:8555/client/";
var JSESSIONID="";



angular.module('app')
.service('RefreshHandling', function($http, $state, $rootScope,$window,$timeout){
	$rootScope.validateSession=function(data){
		if(data.error=="true"){
			if(data.errorCode!=undefined){
				if(data.errorCode=="1"){
					alertify.error("Sorry Your Has Expired.Please Log In Again!");
					$state.go("login",{});
				}
			}
		}
	};
	
	
	   $rootScope.JSESSIONID =  $window.localStorage.getItem('JSESSIONID');
	   $rootScope.clientName =  $window.localStorage.getItem('clientName');
	   $rootScope.urlappend=$window.localStorage.getItem('urlappend');
	   $timeout(populateTiltle($rootScope.clientName),0);
	   urlappend=$rootScope.urlappend;
	   JSESSIONID=$rootScope.JSESSIONID;
	   var currentLocation = window.location;
	   currentLocation=currentLocation.toString();
	   if(!currentLocation.includes('login')){
		   $("#menuGrid").show();
	       $("#quikNavigationDiv").show();
	   }
	   
	  // $timeout(enableCalendar(),0);
	   

})

function enableCalendar(){

	var dummydata=[{"title":"Republic Day","allDay":true,"start":"2017-01-26T21:45:00.8461321+02:00","end":"2017-01-26T23:45:00.8461321+02:00","url":null,"id":1}];
	 $('#calendar1').fullCalendar({
         disableDragging: true,
         events:dummydata
     });
}



function populateTiltle(schoolName){
	$("#schoolNameTitle").empty();
    $("#schoolNameTitle").append(schoolName);
}







