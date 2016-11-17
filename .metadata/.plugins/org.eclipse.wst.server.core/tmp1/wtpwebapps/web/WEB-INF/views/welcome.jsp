<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Welcome</title>
    <!-- Bootstrap -->
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
	<!-- JQuery UI -->
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
	<!-- Highcharts -->
	<link rel="stylesheet" href="/web/resource/css/highcharts.css">
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link rel="stylesheet" href="/web/resource/css/ie10-viewport-bug-workaround.css">
    
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
		#proveedoresDePrecios, #curvasDeMercado, #nodosDeCurva{
			padding-top: 10px;
			padding-bottom: 10px;
		}
		/*#proveedoresDePrecios div.st80{
			height: 100px;
		}*/
		#selProveedor{
			height: 30px;
		}
		#curvasDeMercado div.st80, #nodosDeCurva div.st80{
			background-color: #F5F5F5;
			height: 350px;
			overflow-y: scroll;
			/*margin-right: 100px;*/
		}
		#curvasDeMercado div.list div, div.generateGraphics{
			background-color: #4682B4;
			color: #FFFFFF;
			font-weight: 600;
			padding: 10px 0 10px 10px;
    		margin: 10px 0;
    		border-radius: 5px;
    		border: 2px solid #4682B4;
    		transition: all 500ms ease;
		}	
		#curvasDeMercado div.list div:hover, div.generateGraphics:hover{
			background-color: #0c3a61;
			border: 2px solid #0c3a61;
			cursor: pointer;
		}
		#curvasDeMercado div.list div.selected{
			color: #4682B4;
			background-color: #FFFFFF;
			border: 2px solid #4682B4;
		}
		#nodosDeCurva ul{
			list-style-type: none;
			padding-left: 10px;
    		padding-top: 10px;
		}
		#nodosDeCurva ul li input[type="checkbox"]{
			margin-right: 5px;
			margin-bottom: 3px;
		}
		div.generateGraphics{
			width: 60%;
			
		}
		div.littleScreen div.generateGraphics{
			display: none;
		}
		div.bigScreen div.generateGraphics{
			display: block;
		}
		#graphicsTables table{
			display: none;
		}
		div.graphics div.chart{
			height: 350px;
			margin-top: 30px;
		}
		div.chart svg{
			height: 100%;
			width: 100%;
		}
		div.col-sm-4 > div.st80 > p > input[type="text"],
		div.col-sm-4 > div.st80 > div > p > input[type="number"]{
			width: 50%;
		}
		/* RESPONSIVE CSS
		-------------------------------------------------- */
		@media only screen and (max-width: 480px), only screen and (max-device-width_ 480px){
			div.bigScreen div.generateGraphics{
				display: none;
			}
			div.littleScreen div.generateGraphics{
				display: block;
			}
		}
		@media (min-width: 768px) and (max-width: 1014px){
			div.col-sm-4 > div.st80 > p > input[type="text"],
			div.col-sm-4 > div.st80 > div > p > input[type="number"]{
				width: 75%;
			}
		}
	</style>
	<script type="text/javascript">
		var graphicsIds = [];
		var tableIds = [];
		var tableCounter = 0;
		
		function drawGraphics(){
			tableCounter = 0;
			$.each(graphicsIds, function(id, item){
				var chart = new Highcharts.Chart({
	                chart: {
	                	renderTo: item,
	                    type: 'line',
	                    borderWidth: 1,
	                    plotBorderWidth: 2,
	                    borderColor: '#a1a1a1',
	                    borderRadius: 3,
	                    marginLeft: 80
	                },
	                data: {
	                    table: tableIds[tableCounter]
	                },
	                title: {
	                    text: tableIds[tableCounter]
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
				
				tableCounter += 1;
			});
		}
		
		function Nodo(prov, id){
			this.prov = prov;
			this.id = id;
		}
		
		Nodo.prototype.equals = function(n){
			if(this.prov != n.prov){ return false;}
			if(this.id != n.id){ return false;}
			return true;
		}
		
		function SelectedNodos(){
			this.nodos = [];
			this.fechaI = "";
			this.fechaF = "";
			this.metodo = 0;
			this.noDias = 0;
			this.noDatos = 0;
			this.factorDD = 0;
		}
		
		SelectedNodos.prototype.addNodo = function(nodo){
			for(var i = 0; i < this.nodos.length; i++ ){
				if( this.nodos[i].equals(nodo) ) return false;
			}
			
			this.nodos.push(nodo);
			
			return true;
		}
			
		SelectedNodos.prototype.deleteNodo = function(nodo){
			for(var i = 0; i < this.nodos.length; i++ ){
				if( this.nodos[i].equals(nodo) ){
					this.nodos.splice(i, 1);
					return true;
				}
			}
			
			return false;
		}
		
		var sels = new SelectedNodos();
		
		function updateSelected(elem){
			var idP = $('#selProveedor').val();
			var nodo = new Nodo(idP, elem.id); 
			
			if(elem.checked){ 
				sels.addNodo(nodo);
			}else{ 
				sels.deleteNodo(nodo); 
			}
		}
		
		function generateGraphics(){
			sels.metodo = parseInt( $('input[name=method]:checked').val() );
			if( $('#noDias').val() > 0 )
				sels.noDias = parseInt( $('#noDias').val() );
			if( $('#noDatos').val() )
				sels.noDatos = parseInt( $('#noDatos').val() );
			if( $('#factorDD').val() > 0 )
				sels.factorDD = parseFloat( $('#factorDD').val() ); 
			
			console.log(sels);
			
			
			ajaxGraphicsFunction();
		}
		
		function getCurvas(sel) {
			$('#curvasDeMercado div.st80 div.list, #nodosDeCurva ul').fadeOut("slow", function(){
				$('#curvasDeMercado div.st80 div.list').html('');
				$('#nodosDeCurva ul').html('');
				ajaxCurvaFunction(sel.value);
			});
	    }
		
		function getNodos(sel){
			$(sel).siblings().each(function(){
				if( $(this).hasClass('selected') ){
					$(this).toggleClass('selected');
				}
			});
			
			$(sel).toggleClass('selected');
			
			var id_prov = $('#selProveedor').val();
			$('#nodosDeCurva ul').fadeOut("slow", function(){
    			$('#nodosDeCurva ul').html('');
    			ajaxNodoFunction(id_prov, sel.className, sel.attributes["name"].value);
    		});
		}
		
    	function ajaxCurvaFunction(id) {
        	$.ajax({
            	url : 'curvas/'+id,
            	cache : false,
                contentType : 'application/json; charset=utf-8',
                type : 'GET',
            	success : function(data) {
                	var items = [];
                	
                	$.each(data, function(id, option){
                		items.push("<div class='" + option.id_curva + "' name='" 
               				 + option.columna + "' onclick='getNodos(this);'>" + option.descripcion + "</div>");
                	});
                	
                	$('#curvasDeMercado div.st80 div.list').html(items.join(''));
                	$('#curvasDeMercado div.st80 div.list').fadeIn();
            	}
        	});
    	}
    	
    	function ajaxNodoFunction(id_prov, id_curva, col){
    		$.ajax({
            	url : 'nodos/ByCriteria;id_proveedor='+id_prov+';col='+col+';',
            	cache : false,
                contentType : 'application/json; charset=utf-8',
                type : 'GET',
            	success : function(data) {
                	var items = [];
                	
                	$.each(data, function(id, option){
                		items.push("<li><input onclick='updateSelected(this);' type='checkbox' value='" + option.factor 
                				 + "' id='"+option.id_Factor + /*"' name='" + option.columna + */"'>" 
                				 + option.factor + "</li>");
                	});
                	
                	$('#nodosDeCurva ul').html(items.join(''));
                	for(var i = 0; i < sels.nodos.length; i++){ 
                		if( $('#'+sels.nodos[i].id).length > 0 ){ 
                			if( $('#selProveedor').val() == sels.nodos[i].prov ){ 
                				$('#'+sels.nodos[i].id).prop("checked", true);
                			}
                		}
                	}
                	$('#nodosDeCurva ul').fadeIn();
            	}
        	});
    	}
    	
    	function ajaxGraphicsFunction(){
    		$.ajax({
            	url : 'graficas/',
            	cache : false,
                contentType : 'application/json; charset=utf-8',
                dataType : 'json',
                data : JSON.stringify(sels),
                type : 'POST',
            	success : function(data) {
            		var tables = [];
            		var graphicDivs = [];
            		tableIds.length = 0;
            		graphicsIds.length = 0;
            		
            		$.each(data, function(id, option){
            			var divs = "<div class='col-sm-6 col-xs-12 chart' id='"
            			         + option.proveedor + option.factor + "'></div>";
            			
            			var table = "<table id='" + option.proveedor + "-" + option.factor + "' class='graphicTable'>"
            			          + "<thead>"
            			          + "<tr><th></th><th>" + option.proveedor + "-" + option.factor + "</th></tr>"
            			          + "</thead><tbody>";
            			          
     			        tableIds.push(option.proveedor + "-" + option.factor);
               			graphicsIds.push(option.proveedor + option.factor);
               			
						$.each(option.listOfValues, function(id, val){
							table += "<tr><th>" + val.date +"</th><td>" + val.doubleValue + "</td></tr>";
						});
						
						table += "</tbody></table>";
						tables.push(table);
						graphicDivs.push(divs);
            		});
            		graphicDivs = graphicDivs.concat(tables);
            		$('#graphicsTables').html(graphicDivs.join(''));
            		drawGraphics();
            	},
            	error : function(e){
            		console.log("ERROR: ", e);
            	}
    		});
    	}
    	
    	$(function(){
    		$("input[name=method]").on( "change", function() {
                var method = parseInt($(this).val());
                switch(method) {
                    case 1:
                        $(".method2").hide();
                        $(".method1").show("slow");
                        break;
                    case 2:
                        $(".method1").hide();
                        $(".method2").show("slow");
                        break;
                }
            });
    		
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
			<h1> Reporte de Volatilidades </h1>
		</div><!-- .container end -->
	</section>
	
	<section class="container">
		<div class="row">
			<div class="col-sm-4 col-xs-12"><div class="st80">
				<p>
					<label for="fechaI">Fecha inicial</label><br>
					<input type="text" id="fechaI" >
				</p>
				<p>
					<label for="fechaF">Fecha final</label><br>
					<input type="text" id="fechaF" >
				</p>
			</div></div>
			
			<div class="col-sm-4 col-xs-12"><div class="st80">
				<p><b>Seleccione un m�todo</b></p>
				
                <p> 
                	<input id="method1" type="radio" name="method" value="1" />
                	<label for="method1">M�todo simple</label>
                </p>
                
                <p>
                 	<input id="method2" type="radio" name="method" value="2"/>
                 	<label for="method2">EWMA</label> 
                 </p>
			</div></div>
			
			<div class="col-sm-4 col-xs-12"><div class="st80">
				<div class="method1" style="display:none">
					<p><label for="noDias">N�mero de d�as</label><br>
					<input type="number" id="noDias" placeholder="0" min="1" max="600"></p>
				</div>
				
				<div class="method2" style="display:none">
					<p><label for="noDatos">N�mero de datos</label><br>
					<input type="number" id="noDatos" placeholder="0" min="1" max="600"></p>
					
					<p><label for="factorDD">Factor de Decaimiento</label><br>
					<input type="number" id="factorDD" placeholder="0" min="0.001" max="0.999"></p>
				</div>
			</div></div>
		</div><!-- .row end -->
		
		<div class="row bigScreen">
			<div id="proveedoresDePrecios" class="col-sm-4 col-xs-12"><div class="st80">
				<p>
					<select id="selProveedor" onchange="getCurvas(this);">
					<c:forEach items="${proveedores}" var="proveedores">
						<option value="${proveedores.id}">${proveedores.proveedor}</option>
					</c:forEach>
					</select>
				</p>
				
				<div class="generateGraphics" onclick="generateGraphics();">Enviar</div>
				
			</div></div>
			
			<div id="curvasDeMercado" class="col-sm-4 col-xs-12"><div class="st80"><div class="list"></div></div></div>
			
			<div id="nodosDeCurva" class="col-sm-4 col-xs-12"><div class="st80"><ul></ul></div></div>
		</div><!-- .row end -->
		
		<div class="row littleScreen">
			<div class="col-sm-4 col-xs-12"></div>
			<div class="col-sm-4 col-xs-12"></div>
			<div class="col-sm-4 col-xs-12"><div class="st80">
				<div class="generateGraphics" onclick="generateGraphics()">Enviar</div>
			</div></div>
		</div><!-- .row end -->
		
		<div id="graphicsTables" class="row graphics">
		</div>
	</section><!-- .container end -->
	
	<!-- Bootstrap core JavaScript
	================================================== -->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/web/resource/js/ie10-viewport-bug-workaround.js"></script>
    <!-- Highcharts -->
    <script src="/web/resource/js/highcharts.js"></script>
    <script src="/web/resource/js/modules/data.js"></script>
    <script src="/web/resource/js/modules/exporting.js"></script>
</body>
</html>