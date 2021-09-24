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

<!-- WEBCUIDPERS CSS -->
<link rel="stylesheet" href="../css/webcuidpers.css">
 <!-- Agenda -->
<script src="../js/agenda.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title><fmt:message key="label.titol" /></title>
</head>
<body">

<form id="agendaForm">
<!--  Capçalera 1 -->
<div class="row">
	<div class="col webcuidpers-capcalera-1" >
	<div class="container-fluid">
		<div class="btn-group float-left webcuidpers-images">
		  <a href="#en-EN"><img src="../img/en-EN.png" class="rounded-circle" height="25px"></a>
		  <a href="#ca-CA"><img src="../img/ca-CA.png" class="rounded-circle" height="25px"></a>
		  <a href="#es-ES"><img src="../img/es-ES.png" class="rounded-circle" height="25px"></a>  
		</div>
		<div class="btn-group float-left webcuidpers-capcalera-text"><fmt:message key="label.subtitol.1" /></div>
		<div class="btn-group float-right webcuidpers-images">
		  <a href="#instagram"><img src="../img/instagram.png" height="25px"></a>
		  <a href="#twitter"><img src="../img/twitter.png" height="25px"></a>
		  <a href="#facebook"><img src="../img/facebook.png" class="rounded-circle" height="25px"></a>  
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
		<img src="../img/AD000001.png" class="rounded-circle" width="50px">
		</a>
	</li>
</ul>
</div>

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
  <div class="col-sm-3">
      
	<div id="accordion">
				
		<div>
			<button data-toggle="collapse" href="#collapse1" type="button" class="btn webcuidpers-menu-ver-button btn-block text-left btn-sm webcuidpers-grid-1">Servicios sanitarios a personas</button>
				    <br/>
				    <div id="collapse1" class="collapse show" data-parent="#accordion">
				      <div class="card-body">
		
					<div class="custom-control custom-checkbox webcuidpers-cos-checkbox" >
					    <input type="checkbox" class="custom-control-input" id="customCheck1" name="example1"/>
					    <label class="custom-control-label" for="customCheck1">Atender a niños</label>
					</div>
					<div class="custom-control custom-checkbox webcuidpers-cos-checkbox" >
					    <input type="checkbox" class="custom-control-input" id="customCheck2" name="example2"/>
					    <label class="custom-control-label" for="customCheck2">Atender a minusv./discapac.</label>
					</div>
					<div class="custom-control custom-checkbox webcuidpers-cos-checkbox" >
					    <input type="checkbox" class="custom-control-input" id="customCheck3" name="example3"/>
					    <label class="custom-control-label" for="customCheck3">Atender a adultos</label>
					</div>
					</div>
				    </div>
		</div>
		<div>
			<button data-toggle="collapse" href="#collapse2" type="button" class="btn webcuidpers-menu-ver-button btn-block text-left btn-sm webcuidpers-grid-1">Servicios a deportistas</button>
				    <br/>
				    <div id="collapse2" class="collapse show" data-parent="#accordion">
				      <div class="card-body">
		
					<div class="custom-control custom-checkbox webcuidpers-cos-checkbox" >
					    <input type="checkbox" class="custom-control-input" id="customCheck11" name="example11"/>
					    <label class="custom-control-label" for="customCheck11">Atender a niños</label>
					</div>
					<div class="custom-control custom-checkbox webcuidpers-cos-checkbox" >
					    <input type="checkbox" class="custom-control-input" id="customCheck21" name="example21"/>
					    <label class="custom-control-label" for="customCheck21">Atender a minusv./discapac.</label>
					</div>
					<div class="custom-control custom-checkbox webcuidpers-cos-checkbox" >
					    <input type="checkbox" class="custom-control-input" id="customCheck31" name="example31"/>
					    <label class="custom-control-label" for="customCheck31">Atender a adultos</label>
					</div>
					</div>
				    </div>
	  		
		</div>
		<div height="50px">
			<button data-toggle="collapse" href="#collapse3" type="button" class="btn webcuidpers-menu-ver-button btn-block text-left btn-sm webcuidpers-grid-1">Servicios para actividades lúdicas</button>
   				    <br/><br/>
   				    <div id="collapse3" class="collapse show" data-parent="#accordion">
				      <div class="card-body">
				    		
					<div class="custom-control custom-checkbox webcuidpers-cos-checkbox" >						
					    <input type="checkbox" class="custom-control-input" id="customCheck111" name="example111"/>
					    <label class="custom-control-label" for="customCheck111">Atender a niños</label>
					</div>
					<div class="custom-control custom-checkbox webcuidpers-cos-checkbox" >
					    <input type="checkbox" class="custom-control-input" id="customCheck222" name="example222"/>
					    <label class="custom-control-label" for="customCheck222">Atender a minusv./discapac.</label>
					</div>
					<div class="custom-control custom-checkbox webcuidpers-cos-checkbox" >
					    <input type="checkbox" class="custom-control-input" id="customCheck333" name="example333"/>
					    <label class="custom-control-label" for="customCheck333">Atender a adultos</label>
					</div>
					</div>
				    </div>
				  		
		</div>		
		<div height="50px">
			<button data-toggle="collapse" href="#collapse4" type="button" class="btn webcuidpers-menu-ver-button btn-block text-left btn-sm webcuidpers-grid-1">Servicios a adultos</button>
   				    <br/>
   				    <div id="collapse4" class="collapse show" data-parent="#accordion">
				      <div class="card-body">
				    		
					<div class="custom-control custom-checkbox webcuidpers-cos-checkbox" >						
					    <input type="checkbox" class="custom-control-input" id="customCheck1111" name="example1111"/>
					    <label class="custom-control-label" for="customCheck1111">Atender a niños</label>
					</div>
					<div class="custom-control custom-checkbox webcuidpers-cos-checkbox" >
					    <input type="checkbox" class="custom-control-input" id="customCheck2222" name="example2222"/>
					    <label class="custom-control-label" for="customCheck2222">Atender a minusv./discapac.</label>
					</div>
					<div class="custom-control custom-checkbox webcuidpers-cos-checkbox" >
					    <input type="checkbox" class="custom-control-input" id="customCheck3333" name="example3333"/>
					    <label class="custom-control-label" for="customCheck3333">Atender a adultos</label>
					</div>
					</div>
				    </div>
				  		
		</div>	
  	</div>
  </div>
<!--  cos principal CENTRE -->	
  <div class="col-sm-6">
  <div class="card webcuidpers-grid">
    <div class="card-body text-center webcuidpers-cos">
    	<div class="list-group">
	    	<label class="webcuidpers-cos">
	  			<fmt:message key="label.agenda.servei" />
	  		</label>
	  		      <input type="text" id="servei" class="form-control webcuidpers-form-control" placeholder="<fmt:message key="label.agenda.servei.ph" />">
	  		<br/><label class="webcuidpers-cos">
	  			<fmt:message key="label.agenda.detall.servei" />
	  		</label>	  		
	  			<textarea class="form-control webcuidpers-form-control" rows="3" id="detall-servei" placeholder="<fmt:message key="label.agenda.detall.reserva.ph" />"></textarea>
	  		<br/><label class="webcuidpers-cos">
	  			<fmt:message key="label.agenda.reserva.hores" />
	  		</label>
    	</div>
	</div>
  </div>
  </div>
<!--  cos principal DRET -->	
  <div class="col-sm-3">
    <div class="card webcuidpers-grid">
    <div class="card-body text-center webcuidpers-cos webcuidpers-persona-checkbox">
   		<div class="custom-control custom-checkbox webcuidpers-persona-checkbox" >						
		    <input type="checkbox" class="custom-control-input" id="cbSeleccionarProf" name="cbSeleccionarProf"/>
		    <label class="custom-control-label" for="cbSeleccionarProf">
		    	<fmt:message key="label.agenda.seleccionar.prof" />
		    </label>
		</div>
		</br>
		<div class="row webcuidpers-persona-row-1">
		  	<div class="col-sm-2">
				<span class="badge badge-pill webcuidpers-boles-num">1</span>
			</div>
		  	<div class="col-sm-3">
				<img src="../img/AD000001.png" width="50px">
			</div>
		  	<div class="col-sm-7">		
					<label class="webcuidpers-persona">
				    	Juan J. Campos</br>
				    	Fisioterapeuta</br>
				    	626.924.434 – Sant Cugat
				    </label>
			</div>
		</div>
				<div class="row webcuidpers-persona-row-0">
		  	<div class="col-sm-2">
				<span class="badge badge-pill webcuidpers-boles-num">2</span>
			</div>
		  	<div class="col-sm-3">
				<img src="../img/AD000002.png" width="50px">
			</div>
		  	<div class="col-sm-7">		
					<label class="webcuidpers-persona">
				    	Elisenda Canals</br>
				    	TCAI</br>
				    	626.924.434 – Rubí
				    </label>
			</div>
		</div>
				<div class="row webcuidpers-persona-row-1">
		  	<div class="col-sm-2">
				<span class="badge badge-pill webcuidpers-boles-num">3</span>
			</div>
		  	<div class="col-sm-3">
				<img src="../img/AD000003.png" width="50px">
			</div>
		  	<div class="col-sm-7">		
					<label class="webcuidpers-persona">
				    	Helena Campos</br>
				    	Enfermera</br>
				    	626.924.434 – Sant Cugat
				    </label>
			</div>
		</div>
  </div>
    </div>
  </div>
</div>	
</form>
</body>
</html>