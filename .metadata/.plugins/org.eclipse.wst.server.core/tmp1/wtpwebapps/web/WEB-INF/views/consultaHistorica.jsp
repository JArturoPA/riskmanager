<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Welcome</title>
    <!-- JQuery UI -->
	<link rel="stylesheet" type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
	<!-- DataTables -->
	<link rel="stylesheet" type="text/css" href="/web/resource/css/datatables.min.css"/>
	<!-- Highcharts -->
	<link rel="stylesheet" type="text/css" href="/web/resource/css/highcharts.css">
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link rel="stylesheet" type="text/css" href="/web/resource/css/ie10-viewport-bug-workaround.css">
    
	<!-- JQuery & JQuery UI javascript-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
  	
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="/web/resource/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/web/resource/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
    	.st80{
			width: 80%;
			margin: 0 auto;
		}
		.row{
			padding-top: 10px;
			padding-bottom: 10px;
		}
    	div.generateReport{
			width: 60%;
			display: block;
			background-color: #4682B4;
			color: #FFFFFF;
			font-weight: 600;
			padding: 10px 0 10px 10px;
    		margin: 10px 0;
    		border-radius: 5px;
    		border: 2px solid #4682B4;
    		transition: all 500ms ease;
		}
		div.generateReport:hover{
			background-color: #0c3a61;
			border: 2px solid #0c3a61;
			cursor: pointer;
		}
		div#highcharts-0{
			height: 350px;
		}
		div#highcharts-0 svg{
			height: 100%;
			width: 100%;
		}
		div.col-sm-3 > div.st80 > input[type="text"],
		div.col-sm-3 > div.st80 > select{
			width: 85%;
		}
    </style>
    
    <script type="text/javascript">
	    function Options(){
			this.id_proveedor = 0;
			this.id_factor = 0;
			this.fechaI = "";
			this.fechaF = "";
		}
	    
	    Options.prototype.equals = function(n){
			if(this.id_proveedor != n.id_proveedor){ return false;}
			if(this.id_factor != n.id_factor){ return false;}
			if(this.fechaI != n.fechaI){ return false;}
			if(this.fechaF != n.fechaF){ return false;}
			return true;
		}
	    
	    var $enableDestroy = 0;
	    var sels = new Options();
	    var dataTable;
	    
	    function drawGraphics(){
			var chart = new Highcharts.Chart({
                chart: {
                	renderTo: 'graphic',
                    type: 'line',
                    borderWidth: 1,
                    plotBorderWidth: 2,
                    borderColor: '#a1a1a1',
                    borderRadius: 3,
                    marginLeft: 80
                },
                data: {
                    table: 'tableReport'
                },
                title: {
                    text: 'TEMP'
                },
                legend: {
                    enabled: false
                },
                xAxis: {
                    showLastLabel: true,
                    tickPixelInterval: 25,
                    type: 'datetime',
                    labels: {
                        format: '{value:%d-%m-%y}',
                        rotation: 90,
                        style: {
                            fontSize: '1.2em'
                        }
                    }
                },
                yAxis: {  
                    title: {
                        enabled: false
                    },
                    labels: {
                        format: '{value} %',
                        style: { fontSize: '1.2em' }
                    },
                    tickPixelInterval: 80
                },
                credits: {
                    enabled: false
                },
                plotOptions: {
                    series: {
                        dataLabels: {
                            enabled: true,
                            format: '{point.label}'
                        },
                        tooltip: {
                            valueSuffix: ' %'
                        }
                    }
                },
                tooltip: {
                    pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b> ({point.change}%)<br/>',
                    valueDecimals: 2
                }
			});
		}
	    
	    function drawTables() {
            dataTable = $('#tableReport').DataTable({
                "bSort" :          false,
                "sPaginationType": "full_numbers"
            });
        }
        
        function deleteTables(){
            dataTable.destroy();
        }
	    
	    function getFactores(sel) {
	    	sels.id_proveedor = sel.value;
			ajaxFactorFunction(sel.value);
	    }
	    
	    function generateReport(){
	    	sels.id_factor = $('#selFactor').val();

			ajaxReportFunction();
		}
	    
	    function ajaxFactorFunction(id){
	    	$.ajax({
            	url : 'consultaHistorica/factores/'+id,
            	cache : false,
                contentType : 'application/json; charset=utf-8',
                type : 'GET',
            	success : function(data) {
            		var items = [];
            		
            		$.each(data, function(id, option){
            			items.push("<option value='"+ option.id_factor +"' " 
            					  + "name='" + option.id_proveedor + "' "
            					  + ">" + option.factor + "</option>");
            		});
            		
            		$('#selFactor').html('');
            		$('#selFactor').html(items.join(''));
            	}
	    	});
	    }
	    
	    function ajaxReportFunction(){
	    	$.ajax({
		    	url : 'consultaHistorica/report/',
		       	cache : false,
	           	contentType : 'application/json; charset=utf-8',
	           	dataType : 'json',
	           	data : JSON.stringify(sels),
	           	type : 'POST',
		       	success : function(data){
		       		var report = [];
		       		var div = "<div class='col-sm-6 col-xs-12'><div id='graphic'></div></div>";
		       		var info = "<div class='col-sm-6 col-xs-12'><div class='st80'><table id='tableReport'><thead>"
		       				 + "<tr><th>Fecha</th><th>Valor</th></tr>"
		       				 + "</thead>"
		       				 + "<tbody>";
		       		
		       		$.each(data, function(id, option){
		       			console.log(option.date);
		       			info += "<tr><td>" + option.date + "</td><td>" + option.doubleValue + "</td></tr>";
		       		});
		       		
		       		info += "</tbody></table></div></div>";
		       		report.push(div);
		       		report.push(info);
		       		
		       		if( $enableDestroy > 0 ){
	                    deleteTables();
	                }
		       		$('#report').html(report.join(''));
		       		drawGraphics();
		       		drawTables();
		       		$enableDestroy = $enableDestroy + 1;
		       	}
	    	});
	    }
	    
    	$(function(){
    		$("#fechaI").datepicker({
				showOn          : "button",
                buttonImage     : "<c:url value="/resource/img/calender.png"></c:url>",
                buttonImageOnly : true,
                buttonText      : "Seleccione una fecha",
                changeMonth     : true,
                changeYear      : true,
                yearRange       : "-15:+0",
                dateFormat      : 'mm-dd-yy',
                showAnim        : 'slideDown',
                beforeShow      : function(){$(".ui-datepicker").css('font-size',10);},
                onSelect		: function(){sels.fechaI = $(this).val();}
			});
			
			$("#fechaF").datepicker({
				showOn          : "button",
				buttonImage     : "<c:url value="/resource/img/calender.png"></c:url>",
                buttonImageOnly : true,
                buttonText      : "Seleccione una fecha",
                changeMonth     : true,
                changeYear      : true,
                yearRange       : "-15:+0",
                dateFormat      : 'mm-dd-yy',
                showAnim        : 'slideDown',
                beforeShow      : function(){$(".ui-datepicker").css('font-size',10);},
                onSelect		: function(){sels.fechaF = $(this).val();}
			});
    	});
    </script>
</head>
<body>
	<section>
		<div class="container jumbotron">
			<h1> Consulta Histórica </h1>
		</div><!-- .container end -->
	</section>
	
	<section class="container">
		<div class="row">
			<div class="col-sm-3 col-xs-12"><div class="st80">
				<label for="selProveedor">Proveedor</label><br>
				<select id="selProveedor" onchange="getFactores(this);">
				<c:forEach items="${proveedores}" var="proveedores">
					<option value="${proveedores.id}">${proveedores.proveedor}</option>
				</c:forEach>
				</select>
			</div></div>
			
			<div class="col-sm-3 col-xs-12"><div class="st80">
				<label for="selFactor">Factor</label><br>
				<select id="selFactor">
				<c:forEach items="${factores}" var="factores">
					<option value="${factores.id_factor}">${factores.factor}</option>
				</c:forEach>
				</select>
			</div></div>
			
			<div class="col-sm-3 col-xs-12"><div class="st80">
				<label for="fechaI">Fecha inicial</label><br>
				<input type="text" id="fechaI" >
			</div></div>
			
			<div class="col-sm-3 col-xs-12"><div class="st80">
				<label for="fechaF">Fecha final</label><br>
				<input type="text" id="fechaF" >
			</div></div>
		</div><!-- .row end -->
		
		<div class="row">
			<div class="col-sm-3 col-xs-12"></div>
			<div class="col-sm-3 col-xs-12"></div>
			<div class="col-sm-3 col-xs-12"></div>
			<div class="col-sm-3 col-xs-12"><div class="st80">
				<div class="generateReport" onclick="generateReport();">Enviar</div>
			</div></div>
		</div>
		
		<div id="report" class="row"></div>
		
	</section><!-- .container end -->
	
	<!-- Bootstrap core JavaScript
	================================================== -->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script type="text/javascript" src="/web/resource/js/ie10-viewport-bug-workaround.js"></script>
    <!-- Highcharts -->
    <script type="text/javascript" src="/web/resource/js/highcharts.js"></script>
    <script type="text/javascript" src="/web/resource/js/modules/data.js"></script>
    <script type="text/javascript" src="/web/resource/js/modules/exporting.js"></script>
    <!-- DataTables -->
    <script type="text/javascript" src="/web/resource/js/datatables.min.js"></script>
</body>
</html>