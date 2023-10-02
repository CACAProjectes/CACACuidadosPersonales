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
</ul>
</div>

<form id="entradaForm" method="post" action="agenda.jsp">
	<input type="hidden" name="missatgeUsuariPwd" id="missatgeUsuariPwd" value="<fmt:message key="missatge.entrada.usuari.pwd" />">
	<input type="hidden" name="missatgeUsuariPwdFail" id="missatgeUsuariPwdFail" value="<fmt:message key="missatge.entrada.usuari.pwd.fail" />">

	<div class="container-sm p-1">  
	<br>
	</div>
	<div class="container-sm border p-1">  
		
		<div class="container-sm p-1 webcuidpers-cos-alt">
			<label class="webcuidpers-cos-alt">
	  			<fmt:message key="label.entrada.iniciar.sessio" />
	  		</label>
	  		<br>
		</div>
		
		<div class="container-sm p-1">
			<br>
			<label class="webcuidpers-cos">
	  			<fmt:message key="label.entrada.usuari" />
	  		</label>
			<br>
	     	<input type="text" id="usuari" name="usuari" size="255" maxlength="255" class="form-control webcuidpers-form-control m-1 p-1" placeholder="<fmt:message key="label.entrada.usuari" />...">
		</div>
		<div class="container-sm p-1">  
			<label class="webcuidpers-cos">
	  			<fmt:message key="label.entrada.pwd" />
	  		</label>
			<br>
	     	<input type="password" id="pwd" name="pwd" size="255" maxlength="255" class="form-control webcuidpers-form-control m-1 p-1" placeholder="<fmt:message key="label.entrada.pwd" />...">
		</div>
		
		<div class="container-sm p-1">
			<label class="webcuidpers-cos-red">
				<a href="#" onclick="oblitUsuari();" class="webcuidpers-cos-red">
	  				<fmt:message key="label.entrada.oblit" />
	  			</a>
	  		</label>
		</div>
		
		<div class="container-sm mt-2">	
			<div class="row">
    	  	<div class="col p-1">
					<a href="#" onclick="nouUsuari();" class="btn btn-block btn-sm webcuidpers-menu-ver-button">
						<fmt:message key="label.entrada.nou.usuari" />
					 </a>
	 	 	</div> 	  
    	  	<div class="col webcuidpers-cos p-1">
			</div>
	 	 	<div class="col webcuidpers-cos p-1">
		    <div class="card webcuidpers-grid">
	    		<div class="card-body webcuidpers-cos"> 
				<button onclick="aceptarUsuari();" type="button" class="btn btn-block btn-sm webcuidpers-menu-ver-button">
					<fmt:message key="label.entrada.aceptar" />
				 </button>
				</div> 	 	 	 	
		 	</div> 	 	
 	 	</div> 	 	
 	 	</div> 	 	
 	 </div>
</form>
</body>
</html>
<!-- Entrada -->
<script src="../js/entrada.js"></script>