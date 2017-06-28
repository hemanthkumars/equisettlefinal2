angular.module('MetronicApp').controller('DashboardController', function($rootScope, $scope, $http, $timeout) {
    $scope.$on('$viewContentLoaded', function() {   
        // initialize core components
        App.initAjax();
    });

    // set sidebar closed and body solid layout mode
    $rootScope.settings.layout.pageContentWhite = true;
    $rootScope.settings.layout.pageBodySolid = false;
    $rootScope.settings.layout.pageSidebarClosed = false;
    
    //$timeout(enableKendo(),0);
    
    
});



function invalidateSession(){
    var input={};
    $.ajax({
        dataType: "json",
        type : 'POST',
        url: urlappend2+'client/invalidateSession',
        data: {"input":JSON.stringify(input)} ,
        success: function(data) {
        	if(data.error=="false"){
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