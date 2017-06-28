/* Setup general page controller */
angular.module('MetronicApp').controller('GeneralPageController', ['$rootScope', '$scope', 'settings', function($rootScope, $scope, settings) {
    $scope.$on('$viewContentLoaded', function() {   
    	// initialize core components
    	App.initAjax();

    	// set default layout mode
    	$rootScope.settings.layout.pageContentWhite = true;
        $rootScope.settings.layout.pageBodySolid = false;
        $rootScope.settings.layout.pageSidebarClosed = false;
    });
}]);


angular.module('MetronicApp').controller('caseController', function($rootScope, $scope, $http, $timeout) {
    $scope.$on('$viewContentLoaded', function() {   
        // initialize core components
        App.initAjax();
    });

    // set sidebar closed and body solid layout mode
    $rootScope.settings.layout.pageContentWhite = true;
    $rootScope.settings.layout.pageBodySolid = false;
    $rootScope.settings.layout.pageSidebarClosed = false;
    
    $scope.addCase=function(){
    	var caseTypeId=$("#caseTypeId").val();
    	var caseTitle=$("#caseTitle").val();
    	var caseDescription=$("#caseDescription").val();
    	var address=$("#address").val();
    	var otherPartyName=$("#otherPartyName").val();
    	var otherPartyMobile=$("#otherPartyMobile").val();
    	var otherPartyEmail=$("#otherPartyEmail").val();
         
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
    	
    	$('#addCaseButton').attr('disabled', 'disabled'); 
    	 var input={"caseTypeId":caseTypeId,
    			 "caseTitle":caseTitle,
    			 "caseDescription":caseDescription,
    			 "address":address,
    			 "otherPartyName":otherPartyName,
    			 "otherPartyMobile":otherPartyMobile,
    			 "otherPartyEmail":otherPartyEmail
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
