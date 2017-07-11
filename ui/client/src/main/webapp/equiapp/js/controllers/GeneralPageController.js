/* Setup general page controller */
angular.module('MetronicApp').controller('GeneralPageController', ['$scope', '$scope', 'settings', function($scope, $scope, settings) {
    $scope.$on('$viewContentLoaded', function() {   
    	// initialize core components
    	App.initAjax();

    	// set default layout mode
    	$scope.settings.layout.pageContentWhite = true;
        $scope.settings.layout.pageBodySolid = false;
        $scope.settings.layout.pageSidebarClosed = false;
    });
}]);


angular.module('MetronicApp').controller('caseController', function($scope, $scope, $http, $timeout) {
    $scope.$on('$viewContentLoaded', function() {   
        // initialize core components
        App.initAjax();
    });

    // set sidebar closed and body solid layout mode
    $scope.settings.layout.pageContentWhite = true;
    $scope.settings.layout.pageBodySolid = false;
    $scope.settings.layout.pageSidebarClosed = false;
    
    $scope.addCase=function(){
    	var caseTypeId=$("#caseTypeId").val();
    	var caseTitle=$("#caseTitle").val();
    	var caseDescription=$("#caseDescription").val();
    	var address=$("#address").val();
    	var otherPartyName=$("#otherPartyName").val();
    	var otherPartyMobile=$("#otherPartyMobile").val();
    	var otherPartyEmail=$("#otherPartyEmail").val();
    	var settlementTypeId=$("#settlementTypeId").val();
    	
    	if(caseTypeId=="" || caseTypeId ==null){
    		toastr.error("Please Select the Case Type");
    		return;
    	}
    	
    	if(caseTitle=="" || caseTitle ==null){
    		toastr.error("Please enter the case title");
    		return;
    	}
    	
    	if(caseDescription=="" || caseDescription ==null){
    		toastr.error("Please enter case description");
    		return;
    	}
    	
    	if(address=="" || address ==null){
    		toastr.error("Please enter the address");
    		return;
    	}
    	
    	if(otherPartyName=="" || otherPartyName ==null){
    		toastr.error("Please enter other party name");
    		return;
    	}
    	
    	
    	if(otherPartyMobile=="" || otherPartyMobile ==null){
    		toastr.error("Please enter other mobile no");
    		return;
    	}
    	
    	if(otherPartyEmail=="" || otherPartyEmail ==null){
    		toastr.error("Please enter other party email");
    		return;
    	}
    	
    	if(settlementTypeId=="" || settlementTypeId ==null){
    		toastr.error("Please select settlement type");
    		return;
    	}
    	
    	
    	$('#addCaseButton').attr('disabled', 'disabled'); 
    	 var input={"caseTypeId":caseTypeId,
    			 "caseTitle":caseTitle,
    			 "caseDescription":caseDescription,
    			 "address":address,
    			 "otherPartyName":otherPartyName,
    			 "otherPartyMobile":otherPartyMobile,
    			 "otherPartyEmail":otherPartyEmail,
    			 "settlementTypeId":settlementTypeId
    	    		};
        $.ajax({
            dataType: "json",
            type : 'POST',
            url: urlappend2+'client/createNewCase',
            data: {"input":JSON.stringify(input)} ,
            success: function(data) {
            	$('#addCaseButton').removeAttr('disabled');
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
            	$('#addCaseButton').removeAttr('disabled');
            }
        });
    	
    }
    
    //$timeout(enableKendo(),0);
});


angular.module('MetronicApp').controller('caseByMeController', function($scope, $scope, $http, $timeout) {
	
	  $scope.findCaseByMe=function(){
	    	 var input={};
	        $.ajax({
	            dataType: "json",
	            type : 'POST',
	            url: urlappend2+'client/findCaseByMe',
	            data: {"input":JSON.stringify(input)} ,
	            success: function(data) {
	            	if(data.error=="false"){
                        var caseArray=	data.result;
                        var caseList="";
                        caseList+=  " <div class='row'>"; 
                        for (var int = 0; int < caseArray.length; int++) {
                        	
                        	caseList+=  "           	<div class='col-lg-3 col-md-12 col-sm-12 col-xs-12'> "; 
                        	caseList+=  "           	<div class='mt-widget-3'>"; 
                        	caseList+=  "       <div class='mt-head bg-blue'>";   
                        	caseList+=  "           "; 
                        	caseList+=  "           <div class='mt-head-desc'> <h3> "+caseArray[int].caseTitle+"</h3></div>"; 
                        	caseList+=  "            <div class='mt-head-desc'> "+caseArray[int].otherpartyName+"</div>"; 
                        	caseList+=  "            <div class='mt-head-desc'> #"+caseArray[int].caseId+"</div>"; 
                        	caseList+=  "           "; 
                        	caseList+=  "           <div class='mt-head-button'>"; 
                        	caseList+=  "               <a onclick='gotoCaseDetailPage("+caseArray[int].caseId+")'><button type='button' class='btn btn-circle btn-outline white btn-sm'>View Details</button></a>"; 
                        	caseList+=  "           </div>"; 
                        	caseList+=  "       </div>"; 
                        	caseList+=  "      "; 
                        	caseList+=  "   </div>"; 
                        	caseList+=  "           	</div>"; 
                        	caseList+=  "           "; 
                        	caseList+=  "           "; 
                        	caseList+=  "           "; 
						}   
                        caseList+=  "           </div> "; 
                        $("#caseListData").empty();
                        $("#caseListData").append(caseList);
	            	}else{
	            		if(data.errorCode!=undefined){
	            			toastr.error(data.message);
	            			location.href="login.html";
	            		}
	            		toastr.error(data.message);
	            	}
	            	
	            },
	            error: function(data) {
	            	$('#addCaseButton').removeAttr('disabled');
	            }
	        });
	    	
	    }
	  
	  $scope.findCaseByMe();
});


angular.module('MetronicApp').controller('caseOnMeController', function($scope, $scope, $http, $timeout) {
	
	  $scope.findCaseOnMe=function(){
	    	 var input={};
	        $.ajax({
	            dataType: "json",
	            type : 'POST',
	            url: urlappend2+'client/findCaseOnMe',
	            data: {"input":JSON.stringify(input)} ,
	            success: function(data) {
	            	if(data.error=="false"){
                      var caseArray=	data.result;
                      var caseList="";
                      caseList+=  " <div class='row'>"; 
                      for (var int = 0; int < caseArray.length; int++) {
                      	
                      	caseList+=  "           	<div class='col-lg-3 col-md-12 col-sm-12 col-xs-12'> "; 
                      	caseList+=  "           	<div class='mt-widget-3'>"; 
                      	caseList+=  "       <div class='mt-head bg-blue'>";   
                      	caseList+=  "           "; 
                      	caseList+=  "           <div class='mt-head-desc'> <h3> "+caseArray[int].caseTitle+"</h3></div>"; 
                      	caseList+=  "            <div class='mt-head-desc'> "+caseArray[int].otherpartyName+"</div>"; 
                      	caseList+=  "            <div class='mt-head-desc'> #"+caseArray[int].caseId+"</div>"; 
                      	caseList+=  "           "; 
                      	caseList+=  "           <div class='mt-head-button'>"; 
                      	caseList+=  "               <a onclick='gotoCaseDetailPage("+caseArray[int].caseId+")'><button type='button' class='btn btn-circle btn-outline white btn-sm'>View Details</button></a>"; 
                      	caseList+=  "           </div>"; 
                      	caseList+=  "       </div>"; 
                      	caseList+=  "      "; 
                      	caseList+=  "   </div>"; 
                      	caseList+=  "           	</div>"; 
                      	caseList+=  "           "; 
                      	caseList+=  "           "; 
                      	caseList+=  "           "; 
						}   
                      caseList+=  "           </div> "; 
                      $("#caseListData").empty();
                      $("#caseListData").append(caseList);
	            	}else{
	            		if(data.errorCode!=undefined){
	            			toastr.error(data.message);
	            			location.href="login.html";
	            		}
	            		toastr.error(data.message);
	            	}
	            	
	            },
	            error: function(data) {
	            	$('#addCaseButton').removeAttr('disabled');
	            }
	        });
	    	
	    }
	  
	  $scope.findCaseOnMe();
});



function gotoCaseDetailPage(caseId){
	  currentCaseId=caseId;
	  toastr.info(caseId);
	  localStorage.setItem('currentCaseId', caseId);
	  location.href="#/casedetails";
	  
}


angular.module('MetronicApp').controller('caseDetailController', function($scope, $scope, $http, $timeout) {
	$("#negoMessage").val("");
	/*$scope.sentDate1="";
	$scope.sentBy1="";
	$scope.offerAmt1="";
	$scope.offerMsg1=""
	
	$scope.replyDate1="";
	$scope.replyBy1="";
	$scope.counterOfferAmt1="";
	$scope.counterOfferMsg1="";*/
	  $scope.findCaseFullDetails=function(){
	    	 var input={"currentCaseId":currentCaseId};
	        $.ajax({
	            dataType: "json",
	            type : 'POST',
	            url: urlappend2+'client/findCaseFullDetails',
	            data: {"input":JSON.stringify(input)} ,
	            success: function(data) {
	            	if(data.error=="false"){
	            		var caseData=data.caseData;
	            		$("#caseId").empty();
	            		$("#caseBy").empty();
	            		$("#startDate").empty();
	            		$("#mediatorName").empty();
	            		$("#caseOn").empty();
	            		$("#caseStatus").empty();
	            		$("#caseTitle").empty();
	            		
	            		$("#caseId").append(caseData.caseId);
	            		$("#caseBy").append(caseData.caseBy);
	            		$("#startDate").append(caseData.caseInitDate);
	            		$("#mediatorName").append(caseData.mediator);
	            		$("#caseOn").append(caseData.caseOn);
	            		$("#caseStatus").append(caseData.caseStatus);
	            		$("#caseTitle").append(caseData.caseTitle);
	            		
	            		if(caseData.containsCaseNego=="true"){
	            			//toastr.info("Contains Nego")
	            			if(caseData.content1=="true"){
	            				$scope.sentDate1=caseData.sentDate1;
	            				$scope.sentBy1=caseData.sentBy1;
	            				$scope.offerAmt1=caseData.offerAmt1;
	            				$scope.offerMsg1=caseData.offerMsg1;
	            				
	            				$scope.replyDate1=caseData.replyDate1;
	            				$scope.replyBy1=caseData.replyBy1;
	            				$scope.counterOfferAmt1=caseData.counterOfferAmt1;
	            				$scope.counterOfferMsg1=caseData.counterOfferMsg1;
	            				$scope.$apply();
	            			}
	            			
	            			if(caseData.content2=="true"){
	            				$scope.sentDate2=caseData.sentDate2;
	            				$scope.sentBy2=caseData.sentBy2;
	            				$scope.offerAmt2=caseData.offerAmt2;
	            				$scope.offerMsg2=caseData.offerMsg2;
	            				
	            				$scope.replyDate2=caseData.replyDate2;
	            				$scope.replyBy2=caseData.replyBy2;
	            				$scope.counterOfferAmt2=caseData.counterOfferAmt2;
	            				$scope.counterOfferMsg2=caseData.counterOfferMsg2;
	            				$scope.$apply();
	            			}
	            			
	            			if(caseData.content3=="true"){
	            				$scope.sentDate3=caseData.sentDate3;
	            				$scope.sentBy3=caseData.sentBy3;
	            				$scope.offerAmt3=caseData.offerAmt3;
	            				$scope.offerMsg3=caseData.offerMsg3;
	            				
	            				$scope.replyDate3=caseData.replyDate3;
	            				$scope.replyBy3=caseData.replyBy3;
	            				$scope.counterOfferAmt3=caseData.counterOfferAmt3;
	            				$scope.counterOfferMsg3=caseData.counterOfferMsg3;
	            				$scope.$apply();
	            			}
	            		}
	            		
	            	}else{
	            		if(data.errorCode!=undefined){
	            			toastr.error(data.message);
	            			location.href="login.html";
	            		}
	            		toastr.error(data.message);
	            	}
	            	
	            },
	            error: function(data) {
	            	$('#addCaseButton').removeAttr('disabled');
	            }
	        });
	    	
	    }
	  
	  $scope.findCaseFullDetails();
	  
	  
	  $scope.submitOffer=function(){
		  var offerAmount=$("#offerAmount").val();
		  var negoMessage=$("#negoMessage").val();
		  if(offerAmount==""||offerAmount==null){
			  toastr.error("Please Enter Offer Amount");
			  return;
		  }
		  if(negoMessage==""||negoMessage==null){
			  toastr.error("Please type some message to submit your offer");
			  return;
		  }
	    	 var input={"offerAmount":offerAmount,
	    			 "negoMessage":negoMessage,
	    			 "currentCaseId":currentCaseId};
	        $.ajax({
	            dataType: "json",
	            type : 'POST',
	            url: urlappend2+'client/submitOffer',
	            data: {"input":JSON.stringify(input)} ,
	            success: function(data) {
	            	if(data.error=="false"){
	            		$scope.findCaseFullDetails();
	            		$("#offerAmount").val("");
	            		$("#negoMessage").val("")
	            		toastr.info(data.message);
	            		
	            	}else{
	            		if(data.errorCode!=undefined){
	            			toastr.error(data.message);
	            			location.href="login.html";
	            		}
	            		toastr.error(data.message);
	            	}
	            	
	            },
	            error: function(data) {
	            	$('#addCaseButton').removeAttr('disabled');
	            }
	        });
	    	
	    }
	  
	  $scope.acceptOffer=function(){
	    	 var input={"currentCaseId":currentCaseId};
	        $.ajax({
	            dataType: "json",
	            type : 'POST',
	            url: urlappend2+'client/acceptOffer',
	            data: {"input":JSON.stringify(input)} ,
	            success: function(data) {
	            	if(data.error=="false"){
	            		
	            	}else{
	            		if(data.errorCode!=undefined){
	            			toastr.error(data.message);
	            			location.href="login.html";
	            		}
	            		toastr.error(data.message);
	            	}
	            	
	            },
	            error: function(data) {
	            	$('#addCaseButton').removeAttr('disabled');
	            }
	        });
	    	
	    }
	  
	  
});


function formNegoSection(){
	
}




