<%@page import="java.util.List"%>
<%@page import="com.dongguk.Raview.dao.ImageDao"%>
<%@page import="com.dongguk.Raview.dao.IImageDao"%>
<%@page import="com.google.appengine.api.datastore.KeyFactory"%>
<%@page import="com.google.appengine.api.datastore.Key"%>
<%@page import="com.google.appengine.api.datastore.Entity"%>
<%@page
	import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Welcome My Raspberry Demo Site</title>
<!-- Bootstrap core CSS-->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<link href="resources/css/sb-admin.css" rel="stylesheet">
<!-- Google Graph template-->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>


<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function ajaxData() {
    $.ajax({
        url: './data',
        type: 'post',
        async: false,
        success: function(lists) {
        	google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(drawChart);
			function drawChart() { 
				
                var dataChart = [['Time', 'countCar']];
                if(lists.length != 0) {
                    $.each(lists, function(i, item){
                        dataChart.push([item.time, item.countCar]);
                    });
                }else {
                    dataChart.push(['입력해주세요', 1]);
                }
                var data = google.visualization.arrayToDataTable(dataChart);
                var view = new google.visualization.DataView(data);

				var options = {
			  		title: 'Vehicle detection number by time zone',
			  		hAxis: {title: 'Time',  titleTextStyle: {color: '#333'}},
			  		vAxis: {minValue: 0}
				};

				var chart = new google.visualization.AreaChart(document.getElementById('graph'));
				chart.draw(view, options);
			}
        }
    });
}
$(document).ready(function(){ 
	ajaxData();
    setInterval(ajaxData, 3000);
});
</script>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- [Edge Area] -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav"> <a class="navbar-brand" href="graph">Dongguk's
		Pi</a>
	<button class="navbar-toggler navbar-toggler-right" type="button"
		data-toggle="collapse" data-target="#navbarResponsive"
		aria-controls="navbarResponsive" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarResponsive">
		<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
			<!-- [Selection Part] -->
			<li class="nav-item" data-toggle="tooltip" data-placement="right"
				title="Chart"><a class="nav-link" href="chart"> <i
					class="fa fa-fw fa-area-chart"></i> <span class="nav-link-text">Chart</span>
			</a></li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right"
				title="cctv"><a class="nav-link" href="cctv"> <i
					class="fa fa-fw fa-dashboard"></i> <span class="nav-link-text">CCTV</span>
			</a></li>
			<!-- [/Selection Part] -->
		</ul>

		<ul class="navbar-nav sidenav-toggler">
			<li class="nav-item"><a class="nav-link text-center"
				id="sidenavToggler"> <i class="fa fa-fw fa-angle-left"></i>
			</a></li>
		</ul>
		<!-- [Logout Part] -->
		<ul class="navbar-nav ml-auto">
			<li class="nav-item"><a href="/logout" class="nav-link">Logout</a>
			</li>
		</ul>
		<!-- [/Logout Part] -->
	</div>
	</nav>
	<!-- [/Edge Area] -->
	<!-- [Work Area] -->
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<h1>Welcome!!</h1>
					<p>This is Dongguk's raspberry pi test app</p>
				</div>
			</div>
			<!-- Example Social Card-->
			<!-- [Graph Part] -->
			<div id="graph" style="width: 100%; height: 500px;"></div>
			<!-- [/Graph Part] -->
			<footer class="sticky-footer">
			<div class="container">
				<div class="text-center">
					<small>Dongguk's Raspberry Pi Demo 2018</small>
				</div>
			</div>
			</footer>
			<!-- [/Work Area] -->

			<!-- Scroll to Top Button-->
			<a class="scroll-to-top rounded" href="#page-top"> <i
				class="fa fa-angle-up"></i>
			</a>

			<!-- Bootstrap core JavaScript-->
			<script src="resources/vendor/jquery/jquery.min.js"></script>
			<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
			<!-- Core plugin JavaScript-->
			<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
			<!-- Custom scripts for all pages-->
			<script src="resources/js/sb-admin.min.js"></script>

		</div>
</body>
</html>
