/*
Create By  : Tony Jacob
Description: Services for DoctorSelection module 
*/

'use strict';
console.log('From DoctorSelection-services.js');
angular.module('DoctorSelection')
 
.factory('DoctorSelectionService',
    ['$timeout', '$filter', '$http', '$q', 'UtilityService',
    function ($timeout, $filter, $http, $q, UtilityService) {

        //console.log('Inside function DoctorSelectionService DoctorSelection-services.js');
        
        var service = {};
		var BaseAPIUrl = UtilityService.BaseAPIUrl;



		

        service.GetAllDoctors = GetAllDoctors;
       
        return service;

		function GetAllDoctors() {
            var def = $q.defer();
            //console.log('Inside DoctorSelectionService-GetAllDoctors()...');
            
            $http({
                method: 'GET',
				url: BaseAPIUrl+'/Doctor/GetAllDoctors/',
                dataType: 'json',
                headers: {'Content-Type': 'application/json; charset=UTF-8'},
 				params: {}
                })
                .success(function (data, status, headers, config) {
                    //console.log("success");
                    var results = {};
                    results.data = data;
                    results.headers = headers();
                    results.status = status;
                    results.config = config;

                    def.resolve(results);
                })
                .error(function (data) {
                    //console.log("error...");
                    def.reject("Failed to get user info");
                    alert("AJAX failed!!!!!!");
                });
            
            return def.promise;
        };
		
    }]);