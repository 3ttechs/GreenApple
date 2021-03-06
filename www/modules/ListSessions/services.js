/*
Create By  : Tony Jacob
Description: Services for ListSessions module 
*/

'use strict';
//console.log('From ListSessions-services.js');
angular.module('ListSessions')
 
.factory('ListSessionsService',
    ['$timeout', '$filter', '$http', '$q', 'UtilityService',
    function ($timeout, $filter, $http, $q, UtilityService) {

        //console.log('Inside function ListSessionsService ListSessions-services.js');
        
        var service = {};
		//var BaseAPIUrl = UtilityService.BaseAPIUrl;
		var BaseAPIUrl = "http://ec2-18-221-0-251.us-east-2.compute.amazonaws.com/SmartClinicWebApi"



		
		service.deleteSession = deleteSession;
       
        return service;
		
		function deleteSession(session) {
            var def = $q.defer();
            
            $http({
                method: 'POST',
                url: BaseAPIUrl+'/Session/DeleteSession',
                data: session,
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
                    console.log("error...");
                    def.reject("Failed to get user info");
                    alert("AJAX failed!!!!!!");
                });
            return def.promise;
        };

    }]);