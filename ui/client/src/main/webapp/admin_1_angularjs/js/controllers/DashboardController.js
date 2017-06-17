angular.module('MetronicApp').controller('DashboardController', function($rootScope, $scope, $http, $timeout) {
    $scope.$on('$viewContentLoaded', function() {   
        // initialize core components
        App.initAjax();
    });

    // set sidebar closed and body solid layout mode
    $rootScope.settings.layout.pageContentWhite = true;
    $rootScope.settings.layout.pageBodySolid = false;
    $rootScope.settings.layout.pageSidebarClosed = false;
    
    $timeout(enableKendo(),0);
    
    
});

function enableKendo() {
	
 	  $("#grid").kendoGrid({
                        dataSource: {
                            type: "odata",
                            transport: {
                                read: "https://demos.telerik.com/kendo-ui/service/Northwind.svc/Customers"
                            },
                            pageSize: 20
                        },
                        height: 550,
                        groupable: true,
                        sortable: true,
                        pageable: {
                            refresh: true,
                            pageSizes: true,
                            buttonCount: 5
                        },
                        columns: [{
                           
                            field: "ContactName",
                            title: "MileStone",
                            
                        }, {
                            field: "ContactTitle",
                            title: "Name",
                            
                        }, {
                            field: "CompanyName",
                            title: "Original EST date",
                           
                        }, {
                            field: "Country",
                            
                            title: "CurrentEST Date"
                        },
                        {
                            field: "Country",
                            
                            title: "Actual Date"
                        },
                        {
                            field: "Country",
                            
                            title: "Phase"
                        }]
                    });
                    
                	$("#datepicker1").kendoDatePicker();
                	$("#datepicker2").kendoDatePicker();
                	$("#datepicker3").kendoDatePicker();
                	
                    var data = [
                        { text: "07- Start Con Plan", value: "1" },
                        { text: "08- Start Con Plan", value: "2" },
                        { text: "09- Start Con Plan", value: "3" }
                    ];

                    // create DropDownList from input HTML element
                    $("#color").kendoDropDownList({
                        dataTextField: "text",
                        dataValueField: "value",
                        dataSource: data,
                        index: 0,
                        change: onChange
                    });

                    // create DropDownList from select HTML element
                    $("#size").kendoDropDownList();

                    var color = $("#color").data("kendoDropDownList");

                 //   color.select(0);
                    var size = $("#size").data("kendoDropDownList");

                    function onChange() {
                    	alert("Milestone changed");
                    };

                    
                  
                    
                    $("#textButton1").kendoButton();
                    $("#textButton2").kendoButton();
                    
               
  
}