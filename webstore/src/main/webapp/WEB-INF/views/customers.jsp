<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
	<title>Customers</title>
</head>
<body>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Customers</h1>
				<p>All the available customers in our store</p>
			</div><!-- .container end -->
		</div><!-- .jumbotron end -->
	</section>
	
	<section class="container">
		<div class="row">
			<c:forEach items="${customers}" var="customer">
				<div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
					<div class="thumbnail">
						<div class="caption">
							<h3>${customer.name}</h3>
							<p>${customer.address}</p>
							<p>${customer.noOfOrdersMade} orders made.</p>
						</div><!-- .caption end -->
					</div><!-- .thumbnail end -->
				</div><!-- .col end -->
			</c:forEach>
		</div><!-- .row end -->
	</section><!-- .container end -->
</body>
</html>