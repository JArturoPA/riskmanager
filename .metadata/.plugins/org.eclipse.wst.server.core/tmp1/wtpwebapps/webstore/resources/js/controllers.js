/**
 * 
 */
var cartApp = angular.module('cartApp', []);

cartApp.controller('cartCtrl', function($scope, $http){
	$scope.refreshCart = function(cardId){
		$http.get('/webstore/rest/cart/' + $scope.cartId).success(function data(){
			$scope.cart = data;
		});
	};
	
	$scope.clearCart = function(){
		$http.delete('/webstore/rest/cart/' + $scope.cartId).success($scope.refreshCart($scope.cartId));
	};
	
	$scope.initCart = function(cartId){
		$scope.cartId = cartId;
		$scope.refreshCart($scope.cartId);
	};
	
	$scope.addToCart = function(productId){
		$http.put('/webstore/rest/cart/add/' + productId).success(function(data){
			$scope.refreshCart($http.get('/webstore/rest/cart/get/cartId'));
			alert("Product successfully added to the cart.");
		});
	};
	
	$scope.removeFromCart = function(productId){
		$http.put('/webstore/rest/cart/remove/' + productId).success(function(data){
			$scope.refreshCart($http.get('/webstore/rest/cart/get/cartId'));
		});
	};
});