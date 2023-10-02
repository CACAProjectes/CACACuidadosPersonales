<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="../css/bootstrap.css">
<!-- jQuery library -->
<script src="../js/jquery.js"></script>
<!-- Popper JS -->
<script src="../js/popper.js"></script>
<!-- Latest compiled JavaScript -->
<script src="../js/bootstrap.js"></script>
<script src="../js/jquery.session.js"></script>
<!-- WEBCUIDPERS CSS -->
<link rel="stylesheet" href="../css/webcuidpers.css">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title><fmt:message key="label.titol" /></title>
</head>
<body">
<!--  Capçalera 1 -->
<div class="row">
	<div class="col webcuidpers-capcalera-1" >
	<div class="container-fluid">
		<div class="btn-group float-left webcuidpers-images">
		  <a href="#en-EN"><img title=<fmt:message key="title.img.en" /> src="../img/en-EN.png" class="rounded-circle" height="25px"></a>
		  <a href="#ca-CA"><img title=<fmt:message key="title.img.ca" /> src="../img/ca-CA.png" class="rounded-circle" height="25px"></a>
		  <a href="#es-ES"><img title=<fmt:message key="title.img.es" /> src="../img/es-ES.png" class="rounded-circle" height="25px"></a>  
		</div>
		<div class="btn-group float-left webcuidpers-capcalera-text"><fmt:message key="label.subtitol.1" /></div>
		<div class="btn-group float-right webcuidpers-images">
		  <a href="#instagram"><img title=<fmt:message key="title.img.instagram" /> src="../img/instagram.png" height="25px"></a>
		  <a href="#twitter"><img title=<fmt:message key="title.img.twitter" /> src="../img/twitter.png" height="25px"></a>
		  <a href="#facebook"><img title=<fmt:message key="title.img.facebook" /> src="../img/facebook.png" class="rounded-circle" height="25px"></a>  
		</div>
	</div>
	</div>
</div>
<!--  Capçalera 2 -->
<div>
<ul class="webcuidpers-menu-hor-ul-1">
	<li class="webcuidpers-menu-hor-li">
		<img src="../img/logo_webcuidpers.png" class="rounded" width="50px">
	</li>
  	<li class="webcuidpers-menu-hor-li">
		<label class="webcuidpers-capcalera-titol">
		<fmt:message key="label.subtitol.2" />			
		</label>
	</li>
	<li style="float:right">
		<a href="#fotoUsuari">
		<img src="../img/clients.png" title="" id="nomFoto" name="nomFoto" class="rounded-circle" width="50px">
		</a>
	</li>
</ul>
</div>

<form id="resultat" method="post" action="#">
<!--  Inici Request parameters -->
	<input type="hidden" name="resultat_form" id="resultat_form" value="<%=request.getParameter("resultat")%>">
	<input type="hidden" name="resultat_ok" id="resultat_ok" value="<fmt:message key='label.resultat.operacio.satisfactori' />">
	<input type="hidden" name="resultat_ko" id="resultat_ko" value="<fmt:message key='label.resultat.operacio.error' />">
<!--  Fi Request parameters -->

<!--  Capçalera 3 -->
<div>
<ul class="webcuidpers-menu-hor-ul-2">
  <li class="webcuidpers-menu-hor-li "><a href="#agenda">
  	<img src="../img/agenda.png" width="25px">	
		<fmt:message key="label.menu.agenda" />
	</a></li>
  <li class="webcuidpers-menu-hor-li"><a href="#professionals">
	<img src="../img/professionals.png" class="rounded-circle" width="25px">
		<fmt:message key="label.menu.profesionals" />
	</a></li>
  <li class="webcuidpers-menu-hor-li"><a href="#clients">	
	<img src="../img/clients.png" class="rounded-circle" width="25px">
  		<fmt:message key="label.menu.clients" />
  	</a></li>
  <li style="float:right" class="webcuidpers-menu-hor-li ">

    <div class="input-group webcuidpers-search">
      <input type="text" class="form-control webcuidpers-search" placeholder="<fmt:message key="label.cerca.persones" />">
      <a href="#cercar" class="webcuidpers-search">
      <img src="../img/cercar.png" class="rounded-circle" height="25px">
      </a>
    </div>
    
	</li>
</ul>
</div>

<!--  metro -->
<div>
<ul class="webcuidpers-capcalera-2">
  	<li class="webcuidpers-menu-hor-li">
		<fmt:message key="label.subtitol.nou.servei" />
	</li>
</ul>
</div>
<!--  cos principal-->	
<div class="webcuidpers-cos m-1">	
	<ul class="list-group webcuidpers-cos">
	<li class="webcuidpers-cos">
		<label class="webcuidpers-form-text-bold m-1">
			<fmt:message key="label.resultat.operacio" />
		</label>
		<br>
		<label class="webcuidpers-form-text-bold m-4">
			<div class="webcuidpers-cos m-1" id="textResultat"></div>			
		</label>

  	</li>
	</ul>
</div>
<br><br><br><br><br><br>
<!--  cos principal-->	
<div class="m-4">	
	<ul class="list-group webcuidpers-menu-hor-ul-2">
	<li class="webcuidpers-enllac">
	  	<a href="agenda.jsp">
	  		<img src="../img/agenda.png" width="25px">	
			<fmt:message key="label.menu.agenda" />
		</a>
	</li>
	<li class="webcuidpers-enllac">
		<a href="professionals.jsp">
			<img src="../img/professionals.png" class="rounded-circle" width="25px">
			<fmt:message key="label.menu.profesionals" />
		</a>
	</li>
  	<li class="webcuidpers-enllac">
  		<a href="clients.jsp">	
			<img src="../img/clients.png" class="rounded-circle" width="25px">
  			<fmt:message key="label.menu.clients" />
  		</a>
  	</li>
	</ul>
</div>

</form>
</body>
</html>
 <!-- Resultat -->
<script src="../js/resultat.js"></script>
