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
<!--   -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>A G E N D A</title>
</head>
<body background="#caffe6">
<form id="agendaForm">

<table class="webcuidpers-capcalera-table">
	<tr>
		<td valign="middle" class="webcuidpers-capcalera-td">
			<img src="../img/logo_webcuidpers.png" class="rounded" width="75px">
			<label class="webcuidpers-capcalera-titol">
				<fmt:message key="label.titol" />
			</label>
		</td>
		<td valign="middle" class="webcuidpers-capcalera-td" width="100%">
			&nbsp;
		</td>
		<td valign="middle" class="webcuidpers-capcalera-td">
			<img src="../img/AD000001.png" class="rounded-circle" width="75px">
		</td>
		<td valign="middle" class="webcuidpers-capcalera-td">
			<div class="webcuidpers-capcalera-nom">
			Juan J. Campos
			</div>
			<div class="webcuidpers-capcalera-professio">
			Atenció al client
			</div>
		</td>
	</tr>
</table>
<div>
<ul class="webcuidpers-menu-hor-ul">
  <li class="webcuidpers-menu-hor-li"><a href="#agenda">
  	<img src="../img/agenda.png" >
	<fmt:message key="label.agenda"/></a></li>
  <li class="webcuidpers-menu-hor-li"><a href="#professionals">
	<img src="../img/professionals.png" class="rounded-circle">
	<fmt:message key="label.professionals"/></a></li>
  <li class="webcuidpers-menu-hor-li"><a href="#clients">	
	<img src="../img/clients.png" class="rounded-circle">
  	<fmt:message key="label.clients"/></a></li>
  <li style="float:right" class="webcuidpers-menu-hor-li webcuidpers-menu-hor-active"><a href="#ajuda">
	<img src="../img/informacio.png" class="rounded-circle" >
	<fmt:message key="label.ajuda"/></a></li>
</ul>
</div>

<table class="webcuidpers-cos-table">
	<tr>
		<td valign="top" class="webcuidpers-cos-td" colspan="3">
			<label class="webcuidpers-cos-subtitol">
				<fmt:message key="label.subtitol.agenda" />
			</label>
		</td>
	</tr>
	<tr>
		<td valign="top" class="webcuidpers-cos-td-cap">
			<label class="webcuidpers-cos-subtitol-cap">
			<fmt:message key="label.agenda.grups" />
			</label>
		</td>
		<td valign="top" class="webcuidpers-cos-td-cap">
			<label class="webcuidpers-cos-subtitol-cap">
			<fmt:message key="label.agenda.serveis" />
			</label>
		</td>
		<td valign="top" class="webcuidpers-cos-td-cap">
			<label class="webcuidpers-cos-subtitol-cap">
			<fmt:message key="label.agenda.professionals" />
			</label>
		</td>
	</tr>
	<tr>
		<td class="webcuidpers-cos-td-top" width="1%">
			<div>
				<label id="GrupsFuncionalsList"></label>
			</div>
		</td>
		<td class="webcuidpers-cos-td-top">
			<label class="webcuidpers-cos-servei">
				<fmt:message key="label.agenda.servei.nom" />
			</label>
			<input type="text" class="form-control webcuidpers-form-control" id="servei">
			<label class="webcuidpers-cos-servei">
				<fmt:message key="label.agenda.servei.detall" />
			</label>
			<textarea class="form-control webcuidpers-form-control" rows="3" id="detall_servei"></textarea>
			<label class="webcuidpers-cos-servei">
				<fmt:message key="label.agenda.servei.professional" />
			</label>
			<div align="center">
				<div class="webcuidpers-padding">
					<label id="ProfessionsList1"></label>
					<label id="ProfessionsList2"></label>
				</div>
			</div>
			<label class="webcuidpers-cos-servei">
				<fmt:message key="label.agenda.servei.tipus" />
			</label>
			<div align="center">
				<div class="webcuidpers-padding">
					<label id="TipusServeisList"></label>
				</div>
			</div>			
			<label class="webcuidpers-cos-servei">
				<fmt:message key="label.agenda.servei.reserva" />
			</label>
		</td>
		<td class="webcuidpers-cos-td-top" width="1%">
			<div class="custom-control custom-checkbox webcuidpers-padding-long" >
			    <input type="checkbox" class="custom-control-input" id="customCheck" name="example1"/>
			    <label class="custom-control-label webcuidpers-cos-servei" for="customCheck"><fmt:message key="label.agenda.servei.seleccionar" /></label>
			</div>
			<div class="webcuidpers-padding-targeta rounded">
				<img src="../img/flag_targeta_verd.png" class="rounded-circle" width="50px" height="50px">
				<img src="../img/AD000003.png" class="rounded" width="50px" height="50px">
				<div class="btn-group-vertical webcuidpers-padding-targeta">
					<label> </label>
					<label>Helena Campos</label>
					<label>Fisioterapeuta</label>
					<label>Tarifa 20€/hora</label>
					<label>626.924.434 – Sant Cugat</label>
				</div>
			</div>
			<div class="webcuidpers-padding-targeta-sel rounded">
				<img src="../img/flag_targeta_groc.png" class="rounded-circle" width="50px" height="50px">
				<img src="../img/AD000002.png" class="rounded" width="50px" height="50px">
				<div class="btn-group-vertical webcuidpers-padding-targeta-sel">
					<label> </label>
					<label>Elisenda Canals</label>
					<label>TCAI</label>
					<label>Tarifa 20€/hora</label>
					<label>636.819.832 – Rubí</label>
				</div>
			</div>
			<div class="webcuidpers-padding-targeta rounded">
				<img src="../img/flag_targeta_blau.png" class="rounded-circle" width="50px" height="50px">
				<img src="../img/AD000001.png" class="rounded" width="50px" height="50px">
				<div class="btn-group-vertical webcuidpers-padding-targeta">
					<label> </label>
					<label>Luís Pérez</label>
					<label>Fisioterapeuta</label>
					<label>Tarifa 20€/hora</label>
					<label>626.924.434 – Sant Cugat</label>
				</div>
			</div>
		</td>
	</tr>
 </table>

 </form>

</body>
</html>