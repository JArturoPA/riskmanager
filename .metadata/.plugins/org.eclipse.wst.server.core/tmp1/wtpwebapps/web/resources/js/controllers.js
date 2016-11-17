/**
 * 
 */

var curvasApp = angular.module('curvasApp', []);

curvasApp.controller('curvasCtrl', function scope($scope, $http){
	
	$scope.data = {
		singleSelect: null
	},
	
	$scope.refreshCurvasSection = function(sel){
		$http.put('web/rest/curvas/' + sel.value ).success(function(data){
			$scope.curvas = data;
		});
	}
	
	
});