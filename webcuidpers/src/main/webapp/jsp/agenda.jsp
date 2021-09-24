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

<form id="agendaForm" method="post" action="nouServei.jsp">
<!--  Parameters -->
	<input type="hidden" name="idProfessional" id="idProfessional" value="">
	<input type="hidden" name="idHoraris" id="idHoraris" value="">
	<input type="hidden" name="strTipusServei" id="strTipusServei" value="<fmt:message key="label.agenda.serveis"/>">
	<input type="hidden" name="idTipusServei" id="idTipusServei" value="0">
	<input type="hidden" name="strMissatgeDadesObligatories" id="strMissatgeDadesObligatories" value="<fmt:message key="missatge.dades.obligatories"/>">
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
		<fmt:message key="label.subtitol.agenda" />
	</li>
</ul>
</div>
	
<!--  cos principal-->	
<div class="row">
<!--  cos principal ESQUERRA -->	
  <div class="col-sm-3 pr-0" id="cos-esquerra">	  
	<div class="card webcuidpers-grid">
    <div class="card-body text-center webcuidpers-cos">
	<div id="accordion">
	
	</div>
	</div>
	</div>	
  </div>
      
<!--  cos principal CENTRE -->	
  <div class="col-sm-6 pl-0 pr-0">
  <div class="card webcuidpers-grid">
    <div class="card-body text-center webcuidpers-cos">
    	<div class="list-group">
	  		<label id="labelTipusServei" class="webcuidpers-cos m-1"><fmt:message key="label.agenda.serveis" /></label>
	  		<ul class="list-group">
	  			<li class="list-group-item" id="cbServeis">	
	  				<div class="row">
				    <div class="col custom-control custom-checkbox webcuidpers-servei-checkbox ml-4">
				      <input type="checkbox" class="custom-control-input" id="cbServei0" onclick="handleCheckBoxClick(this);">
				      <label class="pt-1 custom-control-label" for="cbServei0" id="lbServei0" style="display: none;"></label>
				    </div>
				    <div class="col custom-control custom-checkbox webcuidpers-servei-checkbox ml-4">
				      <input type="checkbox" class="custom-control-input" id="cbServei1" onclick="handleCheckBoxClick(this);">
				      <label class="pt-1 custom-control-label" for="cbServei1" id="lbServei1" style="display: none;"></label>
				    </div>
					</div>
	  				<div class="row">
				    <div class="col custom-control custom-checkbox webcuidpers-servei-checkbox ml-4">
				      <input type="checkbox" class="custom-control-input" id="cbServei2" onclick="handleCheckBoxClick(this);">
				      <label class="pt-1 custom-control-label" for="cbServei2" id="lbServei2" style="display: none;"></label>
				    </div>
				    <div class="col custom-control custom-checkbox webcuidpers-servei-checkbox ml-4">
				      <input type="checkbox" class="custom-control-input" id="cbServei3" onclick="handleCheckBoxClick(this);">
				      <label class="pt-1 custom-control-label" for="cbServei3" id="lbServei3" style="display: none;"></label>
				    </div>
					</div>
					<div class="row">
				    <div class="col custom-control custom-checkbox webcuidpers-servei-checkbox ml-4">
				      <input type="checkbox" class="custom-control-input" id="cbServei4" onclick="handleCheckBoxClick(this);">
				      <label class="pt-1 custom-control-label" for="cbServei4" id="lbServei4" style="display: none;"></label>
				    </div>
				    <div class="col custom-control custom-checkbox webcuidpers-servei-checkbox ml-4">
				      <input type="checkbox" class="custom-control-input" id="cbServei5" onclick="handleCheckBoxClick(this);">
				      <label class="pt-1 custom-control-label" for="cbServei5" id="lbServei5" style="display: none;"></label>
				    </div>
					</div>
				</li>
			</ul>
			  
	    	<label class="webcuidpers-cos m-1">
	  			<fmt:message key="label.agenda.servei" />
	  		</label>
	  		      <input type="text" name="servei" id="servei" class="form-control webcuidpers-form-control" placeholder="<fmt:message key="label.agenda.servei.ph" />">
	  		<label class="webcuidpers-cos m-1">
	  			<fmt:message key="label.agenda.detall.servei" />
	  		</label>	  		
	  			<textarea class="form-control webcuidpers-form-control" rows="3" name="detall-servei" id="detall-servei" placeholder="<fmt:message key="label.agenda.detall.reserva.ph" />"></textarea>
	  		<label class="webcuidpers-cos m-1">
	  			<fmt:message key="label.agenda.reserva.hores" />
	  		</label>
	  			<div class="container">
				<!--  Tabla - capçalera -->
					 <div class="row p-0">
					   <div class="col p-1 webcuidpers-calendar-border">					     
					   </div>
					   <div class="col p-1 webcuidpers-calendar-cap-border">
					     <fmt:message key="table.capcalera.dia1"/>
					     <br><div id="diaD1"></div>
					   </div>
					   <div class="col p-1 webcuidpers-calendar-cap-border">
					     <fmt:message key="table.capcalera.dia2"/>
					     <br><div id="diaD2"></div>
					   </div>
					   <div class="col p-1 webcuidpers-calendar-cap-border">
					     <fmt:message key="table.capcalera.dia3"/>
					     <br><div id="diaD3"></div>
					   </div>
					   <div class="col p-1 webcuidpers-calendar-cap-border">
					     <fmt:message key="table.capcalera.dia4"/>
					     <br><div id="diaD4"></div>
					   </div>
					   <div class="col p-1 webcuidpers-calendar-cap-border">
					     <fmt:message key="table.capcalera.dia5"/>
					     <br><div id="diaD5"></div>
					   </div>
					   <div class="col p-1 webcuidpers-calendar-cap-border" style="color:#8a0045">
					     <fmt:message key="table.capcalera.dia6"/>
					     <br><div id="diaD6"></div>
					   </div>
					   <div class="col p-1 webcuidpers-calendar-cap-border" style="color:#8a0045">
					     <fmt:message key="table.capcalera.dia7"/>
					     <br><div id="diaD7"></div>
					   </div>
					 </div>
					 
				<!--  Tabla - linia 1  --><div class="row p-0"><div class="col p-1 webcuidpers-calendar-left-senar">7:00 </div><div id="dia17" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia27" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia37" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia47" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia57" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia67" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia77" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div></div>
 				<!--  Tabla - linia 2  --><div class="row p-0"><div class="col p-1 webcuidpers-calendar-left">8:00 </div><div id="dia18" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia28" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia38" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia48" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia58" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia68" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia78" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div></div>
				<!--  Tabla - linia 3  --><div class="row p-0"><div class="col p-1 webcuidpers-calendar-left-senar">9:00 </div><div id="dia19" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia29" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia39" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia49" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia59" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia69" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia79" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div></div>
				<!--  Tabla - linia 4  --><div class="row p-0"><div class="col p-1 webcuidpers-calendar-left">10:00</div><div id="dia110" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia210" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia310" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia410" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia510" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia610" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia710" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div></div>
				<!--  Tabla - linia 5  --><div class="row p-0"><div class="col p-1 webcuidpers-calendar-left-senar">11:00</div><div id="dia111" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia211" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia311" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia411" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia511" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia611" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia711" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div></div>
 				<!--  Tabla - linia 6  --><div class="row p-0"><div class="col p-1 webcuidpers-calendar-left">12:00</div><div id="dia112" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia212" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia312" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia412" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia512" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia612" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia712" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div></div>
				<!--  Tabla - linia 7  --><div class="row p-0"><div class="col p-1 webcuidpers-calendar-left-senar">13:00</div><div id="dia113" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia213" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia313" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia413" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia513" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia613" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia713" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div></div>
				<!--  Tabla - linia 8  --><div class="row p-0"><div class="col p-1 webcuidpers-calendar-left">14:00</div><div id="dia114" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia214" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia314" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia414" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia514" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia614" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia714" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div></div>
				<!--  Tabla - linia 9  --><div class="row p-0"><div class="col p-1 webcuidpers-calendar-left-senar">15:00</div><div id="dia115" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia215" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia315" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia415" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia515" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia615" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia715" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div></div>
 				<!--  Tabla - linia 10 --><div class="row p-0"><div class="col p-1 webcuidpers-calendar-left">16:00</div><div id="dia116" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia216" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia316" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia416" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia516" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia616" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia716" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div></div>
				<!--  Tabla - linia 11 --><div class="row p-0"><div class="col p-1 webcuidpers-calendar-left-senar">17:00</div><div id="dia117" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia217" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia317" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia417" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia517" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia617" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia717" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div></div>
				<!--  Tabla - linia 12 --><div class="row p-0"><div class="col p-1 webcuidpers-calendar-left">18:00</div><div id="dia118" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia218" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia318" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia418" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia518" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia618" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia718" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div></div>
				<!--  Tabla - linia 13 --><div class="row p-0"><div class="col p-1 webcuidpers-calendar-left-senar">19:00</div><div id="dia119" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia219" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia319" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia419" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia519" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia619" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia719" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div></div>
 				<!--  Tabla - linia 14 --><div class="row p-0"><div class="col p-1 webcuidpers-calendar-left">20:00</div><div id="dia120" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia220" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia320" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia420" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia520" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia620" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia720" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div></div>
				<!--  Tabla - linia 15 --><div class="row p-0"><div class="col p-1 webcuidpers-calendar-left-senar">21:00</div><div id="dia121" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia221" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia321" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia421" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia521" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia621" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia721" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div></div>
				<!--  Tabla - linia 16 --><div class="row p-0"><div class="col p-1 webcuidpers-calendar-left">22:00</div><div id="dia122" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia222" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia322" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia422" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia522" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia622" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div><div id="dia722" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia"></div></div>
				<!--  Tabla - linia 17 --><div class="row p-0"><div class="col p-1 webcuidpers-calendar-left-senar">23:00</div><div id="dia123" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia223" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia323" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia423" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia523" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia623" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div><div id="dia723" onclick="clickAgenda(this)" class="col p-1 webcuidpers-calendar-capcalera-dia-senar"></div></div>
			
				</div>
    	</div>
	</div>
  </div>
  </div>
<!--  cos principal DRET -->	
  <div class="col-sm-3 pl-0">
    <div class="card webcuidpers-grid">
    <div class="card-body text-left webcuidpers-cos p-1">   		
	    <div class="card webcuidpers-grid">
	  		<div class="card-body webcuidpers-cos">
				<button onclick="nouServei();" type="button" class="btn btn-block text-left btn-sm webcuidpers-menu-ver-button">
					<fmt:message key="boto.nou.servei" />
				 </button>
			</div>
 	 	</div>
	    <label class="pt-3">
	    	<fmt:message key="label.agenda.seleccionar.prof" />
	    </label>
		<div id="divProfessionals" class="row pl-2 custom-control-label">

		</div>
 	 </div>
    </div>
  </div>
</div>	
</form>
</body>
</html>
<!-- Agenda -->
<script src="../js/agenda.js"></script>