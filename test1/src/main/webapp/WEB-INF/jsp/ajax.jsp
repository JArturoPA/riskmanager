<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Spring MVC Json Test</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	
	<script type="text/javascript">
    	function ajaxFunction() {
        	$.ajax({
            	url : 'ajaxtest.html',
            	cache : false,
                contentType : 'application/json; charset=utf-8',
                type : 'GET',
            	success : function(data) {
            		
                	$('#result').html(data);
            	}
        	});
    	}
	</script>
	
	<!-- script type="text/javascript">
	    var intervalId = 0;
	    intervalId = setInterval(ajaxFunction, 3000);
	</script-->
</head>
<body>
	<div align="center">
        <br> <br> ${message} <br> <br>
        <br> <br> <button onClick="ajaxFunction()">Update</button>
        <br> <br> <div id="result"></div>
    </div>
</body>
</html>