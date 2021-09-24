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

<form id="nouServeiForm" method="post" action="#">
<!--  Inici Request parameters -->
	<input type="hidden" name="idProfessional" id="idProfessional" value="<%=request.getParameter("idProfessional")%>">
	<input type="hidden" name="idTipusServei" id="idTipusServei" value="<%=request.getParameter("idTipusServei")%>">
	<input type="hidden" name="idHoraris" id="idHoraris" value="<%=request.getParameter("idHoraris")%>">
	<input type="hidden" name="idClient" id="idClient" value="">
	<input type="hidden" name="resultat" id="resultat" value="">
	<input type="hidden" name="missatgeConfirm" id="missatgeConfirm" value="<fmt:message key="missatge.confirmacio.servei" />">
	<input type="hidden" name="pais" id="pais" value="ESP">
	<input type="hidden" name="grupFuncional" id="grupFuncional" value="<%=request.getParameter("strTipusServei")%>">
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
<label class="webcuidpers-cos m-1">
	<fmt:message key="label.agenda.servei" />
</label>
    <input type="text" id="servei" class="form-control webcuidpers-form-control m-1 p-1" placeholder="<fmt:message key="label.agenda.servei.ph"/>" value="<%=request.getParameter("servei")%>">
<label class="webcuidpers-cos m-1">
	<fmt:message key="label.agenda.detall.servei" />
</label>	  		
	<textarea class="form-control webcuidpers-form-control m-1 p-1" rows="3" id="detall-servei" placeholder="<fmt:message key="label.agenda.detall.reserva.ph" />"><%=request.getParameter("detall-servei")%></textarea>
	
	<div class="row">
	  	<div class="col-sm-3">
		<label class="webcuidpers-cos m-1">
			<fmt:message key="label.servei.professional" />
		</label>	  	
	  </div>
	  <div class="col-sm-3">
	  	<label class="webcuidpers-cos m-1">
			<fmt:message key="label.servei.professio" />
		</label>	
		</div>
	  <div class="col-sm-4">
	  	  <label class="webcuidpers-cos m-1">
			<%=request.getParameter("strTipusServei")%>
		</label>	
	  </div>
	  <div class="col-sm-2">
	  	  <label class="webcuidpers-cos m-1">
			<fmt:message key="label.servei.data.reserva" />
		</label>	
	  </div>
	</div>
	<div class="row">
	  <div class="col-sm-3">
		<label class="webcuidpers-persona m-1 pl-2" id="dadesProfessional">
		</label>
  	  </div>
	  <div class="col-sm-3">
	  	<label class="webcuidpers-persona m-1 pl-2" id="dadesProfessions">
		</label>
	  </div>
	  <div class="col-sm-4">
	  	<label class="webcuidpers-persona m-1 pl-2" id="dadesServeis">
	  	</label>
	  </div>
	  <div class="col-sm-2">
	  	<label class="webcuidpers-persona m-1 pl-2" id="datesReserva">
	  	</label>
	  </div>
	</div>
	<div class="row">
	  	<div class="col-sm-12">
		<label class="webcuidpers-cos m-1">
			<fmt:message key="label.busqueda.client" />
		</label>	  	
	  </div>
	</div>
	<div class="row">
	  	<div class="col-sm-1">
	  	</div>
	  	<div class="col-sm-1">
			<label class="webcuidpers-form-text mt-3">
				<fmt:message key="label.busqueda.referencia" />:
			</label>	
		</div>
	  	<div class="col-sm-2">
			<input type="text" id="busqref" name="busqref" class="form-control webcuidpers-form-control m-1 p-1" placeholder="<fmt:message key="label.busqueda.referencia"/>...">
	  </div>
	  	<div class="col-sm-1 mt-2">
	  		<a href="#cercarClient" class="webcuidpers-search">
			<img onclick="cercaClient();" src="../img/cercar.png" class="rounded-circle" height="25px">
			</a>
	  </div>	  
	  <div class="col-sm-7">
	  </div>
	</div>
	<div class="row">
		<div class="col-sm-1">
	  	</div>
	  	<div class="col-sm-1">
			<label class="webcuidpers-form-text mt-3">
				<fmt:message key="label.busqueda.nom" />:
			</label>	
		</div>
		<div class="col-sm-3">
			<input type="text" id="busqnom" name="busqnom" class="form-control webcuidpers-form-control m-1 p-1" placeholder="<fmt:message key="label.busqueda.nom"/>...">
	    </div>
	    <div class="col-sm-1">
			<label class="webcuidpers-form-text mt-3">
				<fmt:message key="label.busqueda.telefono" />:
			</label>	
	    </div>
	    <div class="col-sm-2">
			<input type="text" id="busqtelefono" name="busqtelefono" class="form-control webcuidpers-form-control m-1 p-1" placeholder="<fmt:message key="label.busqueda.telefono"/>...">
	    </div>
	    <div class="col-sm-4">
	  	</div>
	</div>
  			<div class="container mt-2">
			<!--  Tabla - capçalera -->
				 <div class="row">
				   <div class="col webcuidpers-client-cap-border ">
				     <fmt:message key="label.taula.client.referencia"/>
				   </div>
				   <div class="col webcuidpers-client-cap-border">
				     <fmt:message key="label.taula.client.nom"/>
				   </div>
				   <div class="col webcuidpers-client-cap-border">
				     <fmt:message key="label.taula.client.data.naixement"/>
				   </div>
				   <div class="col webcuidpers-client-cap-border">
				     <fmt:message key="label.taula.client.telefon"/>
				   </div>
				   <div class="col webcuidpers-client-cap-border">
				     <fmt:message key="label.taula.client.poblacio"/>
				   </div>
				   <div class="col webcuidpers-client-cap-border">
				     <fmt:message key="label.taula.client.contactes"/>
				   </div>
				   <div class="col webcuidpers-client-cap-border">
				     <fmt:message key="label.taula.client.info.relevant"/>
				   </div>
				 </div>					 
			<!--  Tabla - linia 1  --><div class="row"><div id="col00" onclick="clickTaulaClient(this)" class="col webcuidpers-client-border-senar" style="text-align:center"></div><div id="col10" class="col webcuidpers-client-border-senar"></div><div id="col20" class="col webcuidpers-client-border-senar" style="text-align:center"></div><div id="col30" class="col webcuidpers-client-border-senar" style="text-align:center"></div><div id="col40" class="col webcuidpers-client-border-senar"></div><div id="col50" class="col webcuidpers-client-border-senar"></div><div id="col60" class="col webcuidpers-client-border-senar"></div></div>
			<!--  Tabla - linia 2  --><div class="row"><div id="col01" onclick="clickTaulaClient(this)" class="col webcuidpers-client-border" style="text-align:center"></div><div id="col11" class="col webcuidpers-client-border"></div><div id="col21" class="col webcuidpers-client-border" style="text-align:center"></div><div id="col31" class="col webcuidpers-client-border" style="text-align:center"></div><div id="col41" class="col webcuidpers-client-border"></div><div id="col51" class="col webcuidpers-client-border"></div><div id="col61" class="col webcuidpers-client-border"></div></div>
			<!--  Tabla - linia 3  --><div class="row"><div id="col02" onclick="clickTaulaClient(this)" class="col webcuidpers-client-border-senar" style="text-align:center"></div><div id="col12" class="col webcuidpers-client-border-senar"></div><div id="col22" class="col webcuidpers-client-border-senar" style="text-align:center"></div><div id="col32" class="col webcuidpers-client-border-senar" style="text-align:center"></div><div id="col42" class="col webcuidpers-client-border-senar"></div><div id="col52" class="col webcuidpers-client-border-senar"></div><div id="col62" class="col webcuidpers-client-border-senar"></div></div>
			<!--  Tabla - linia 4  --><div class="row"><div id="col03" onclick="clickTaulaClient(this)" class="col webcuidpers-client-border" style="text-align:center"></div><div id="col13" class="col webcuidpers-client-border"></div><div id="col23" class="col webcuidpers-client-border" style="text-align:center"></div><div id="col33" class="col webcuidpers-client-border" style="text-align:center"></div><div id="col43" class="col webcuidpers-client-border"></div><div id="col53" class="col webcuidpers-client-border"></div><div id="col63" class="col webcuidpers-client-border"></div></div>
			<!--  Tabla - linia 5  --><div class="row"><div id="col04" onclick="clickTaulaClient(this)" class="col webcuidpers-client-border-senar" style="text-align:center"></div><div id="col14" class="col webcuidpers-client-border-senar"></div><div id="col24" class="col webcuidpers-client-border-senar" style="text-align:center"></div><div id="col34" class="col webcuidpers-client-border-senar" style="text-align:center"></div><div id="col44" class="col webcuidpers-client-border-senar"></div><div id="col54" class="col webcuidpers-client-border-senar"></div><div id="col64" class="col webcuidpers-client-border-senar"></div></div>
			<!--  Tabla - linia 6  --><div class="row"><div id="col05" onclick="clickTaulaClient(this)" class="col webcuidpers-client-border" style="text-align:center"></div><div id="col15" class="col webcuidpers-client-border"></div><div id="col25" class="col webcuidpers-client-border" style="text-align:center"></div><div id="col35" class="col webcuidpers-client-border" style="text-align:center"></div><div id="col45" class="col webcuidpers-client-border"></div><div id="col55" class="col webcuidpers-client-border"></div><div id="col65" class="col webcuidpers-client-border"></div></div>
			<!--  Tabla - linia 7  --><div class="row"><div id="col06" onclick="clickTaulaClient(this)" class="col webcuidpers-client-border-senar" style="text-align:center"></div><div id="col16" class="col webcuidpers-client-border-senar"></div><div id="col26" class="col webcuidpers-client-border-senar" style="text-align:center"></div><div id="col36" class="col webcuidpers-client-border-senar" style="text-align:center"></div><div id="col46" class="col webcuidpers-client-border-senar"></div><div id="col56" class="col webcuidpers-client-border-senar"></div><div id="col66" class="col webcuidpers-client-border-senar"></div></div>
			<!--  Tabla - linia 8  --><div class="row"><div id="col07" onclick="clickTaulaClient(this)" class="col webcuidpers-client-border" style="text-align:center"></div><div id="col17" class="col webcuidpers-client-border"></div><div id="col27" class="col webcuidpers-client-border" style="text-align:center"></div><div id="col37" class="col webcuidpers-client-border" style="text-align:center"></div><div id="col47" class="col webcuidpers-client-border"></div><div id="col57" class="col webcuidpers-client-border"></div><div id="col67" class="col webcuidpers-client-border"></div></div>
			<!--  Tabla - linia 9  --><div class="row"><div id="col08" onclick="clickTaulaClient(this)" class="col webcuidpers-client-border-senar" style="text-align:center"></div><div id="col18" class="col webcuidpers-client-border-senar"></div><div id="col28" class="col webcuidpers-client-border-senar" style="text-align:center"></div><div id="col38" class="col webcuidpers-client-border-senar" style="text-align:center"></div><div id="col48" class="col webcuidpers-client-border-senar"></div><div id="col58" class="col webcuidpers-client-border-senar"></div><div id="col68" class="col webcuidpers-client-border-senar"></div></div>
			<!--  Tabla - linia 10 --><div class="row"><div id="col09" onclick="clickTaulaClient(this)" class="col webcuidpers-client-border" style="text-align:center"></div><div id="col19" class="col webcuidpers-client-border"></div><div id="col29" class="col webcuidpers-client-border" style="text-align:center"></div><div id="col39" class="col webcuidpers-client-border" style="text-align:center"></div><div id="col49" class="col webcuidpers-client-border"></div><div id="col59" class="col webcuidpers-client-border"></div><div id="col69" class="col webcuidpers-client-border"></div></div>
			</div>
			
	<!--  Adreça -->
	<div class="row">
	  	<div class="col-sm-12">
		<label class="webcuidpers-cos m-1">
			<br>
			<fmt:message key="label.busqueda.adreca.client" />
		</label>	  	
	  </div>
	</div>
	<div class="row">
	  	<div class="col-sm-1">
	  	</div>
		<div class="col-sm-11">
		<label class="webcuidpers-cos-red">
			<fmt:message key="label.busqueda.adreca.client.coment" />
		</label>	  	
	  </div>
	</div>
	<div class="row">
	  	<div class="col-sm-1">
	  	</div>
	  	<div class="col-sm-1">
			<label class="webcuidpers-form-text mt-3">
				<fmt:message key="label.adreca.adreca" />:
			</label>	
		</div>
	  	<div class="col-sm-5">
			<input type="text" id="adreca" name="adreca" class="form-control webcuidpers-form-control m-1 p-1" placeholder="<fmt:message key="label.adreca.adreca"/>...">
	  </div>
	  <div class="col-sm-5">
	  </div>
	</div>
	<div class="row">
		<div class="col-sm-1">
	  	</div>
	  	<div class="col-sm-1">
			<label class="webcuidpers-form-text mt-3">
				<fmt:message key="label.adreca.codi.postal" />:
			</label>	
		</div>
		<div class="col-sm-2">
			<input type="text" id="codipostal" name="codipostal" size="5" maxlength="5" class="form-control webcuidpers-form-control m-1 p-1" placeholder="<fmt:message key="label.adreca.codi.postal"/>...">
	    </div>
	    <div class="col-sm-1">
			<label class="webcuidpers-form-text mt-3">
				<fmt:message key="label.adreca.poblacio" />:
			</label>	
	    </div>
	    <div class="col-sm-3">
			<input type="text" id="poblacio" name="poblacio" class="form-control webcuidpers-form-control m-1 p-1" placeholder="<fmt:message key="label.adreca.poblacio"/>...">
	    </div>
	   	<div class="col-sm-1">
			<label class="webcuidpers-form-text mt-3">
				<fmt:message key="label.adreca.provincia" />:
			</label>	
	    </div>
	    <div class="col-sm-2">
			<input type="text" id="provincia" name="provincia" class="form-control webcuidpers-form-control m-1 p-1" placeholder="<fmt:message key="label.adreca.provincia"/>...">
	    </div>
	    <div class="col-sm-1">
	  	</div>
	</div>
				
	<div class="container-sm mt-2">			
		<div class="row">
    	  	<div class="col webcuidpers-cos p-1">
    	  	    <div class="card webcuidpers-grid">
		    		<div class="card-body webcuidpers-cos"> 
					<button onclick="anteriorServei();" type="button" class="btn btn-block btn-sm webcuidpers-menu-ver-button">
						<fmt:message key="boto.nou.anterior" />
					 </button>
			 	 	</div> 	 	 	 	
		 	 	</div> 	 	 	 	
	 	 	</div> 	  
    	  	<div class="col webcuidpers-cos p-1">
			</div>
	 	 	<div class="col webcuidpers-cos p-1">
		    <div class="card webcuidpers-grid">
	    		<div class="card-body webcuidpers-cos"> 
				<button onclick="guardarServei();" type="button" class="btn btn-block btn-sm webcuidpers-menu-ver-button">
					<fmt:message key="boto.nou.confirmar" />
				 </button>
				</div> 	 	 	 	
		 	</div> 	 	
 	 	</div> 	 
 	 	</div>
 	</div>

</form>
</body>
</html>
<!-- Nou servei -->
<script src="../js/nouServei.js"></script>

