<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js"></script>
	<script src="/webstore/resource/js/controllers.js"></script>
	<title>Products</title>
</head>
<body>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Products</h1>
			</div><!-- .container end -->
		</div><!-- .jumbotron end -->
	</section>
	
	<section class="container" data-ng-app="cartApp">
		<div class="row"> 
				<div class="col-md-5">
					<img src="<c:url value="/resource/images/${product.productId}.jpg">
					          </c:url>" alt="image" style = "width:100%"/>
				</div>
				<div class="col-md-5">
					<h3>${product.name}</h3>
					<p>${product.description}</p>
					<p>
						<strong>Item Code : </strong>
						<span class="label label-warning">${product.productId}</span>
					</p>
					<p>
						<strong>Manufacturer : </strong>${product.manufacturer}
					</p>
					<p>
						<strong>Category : </strong>${product.category}
					</p>
					<p>
						<strong>Available units in stock : </strong>
						${product.unitsInStock}
					</p>
					
					<h4>${product.unitPrice} USD</h4>
					<p data-ng-controller="cartCtrl">
						<a href="#" class="btn btn-warning btn-large" data-ng-click="addToCart('${product.productId}')">
							<span class="glyphicon-shopping-cart glyphicon"></span> Order Now
						</a>
					</p>
					<a href="<spring:url value="/cart" />" class="btn btn-default">
						<span class="glyphicon-hand-right glyphicon"></span> View Cart
					</a>
					<a href=" <spring:url value="/products" />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span> back
					</a>
				</div><!-- .col end -->
		</div><!-- .row end -->
	</section><!-- .container end -->
</body>
</html>