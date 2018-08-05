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

<script langauge="javascript">
setInterval("my_function();",3000); 
function my_function(){
  $('#image').load(location.href + ' #image');
}
</script>

</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- [Edge Area] -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav"> <a class="navbar-brand" href="chart">Dongguk's
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
			<!-- [Image Part] -->
			<div id = "image" class="card mb-3">
              <img class="card-img-top img-fluid w-100" src="${imgSrc }" alt="">
              <div class="card-body">
                <h6 class="card-title mb-1">Gupo Sanbon 100, 100</h6>
                <p class="card-text small">Time : ${time }</p>
                <p class="card-text small">CountCar : ${countCar }</p>
              </div>
            </div>
			<!-- [/Image Part] -->
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
