// The root URL for the RESTful services
//var rootURL = "http://192.168.1.136:8080/webcuidpers/services/agenda";
//var rootURL = "http://localhost:8080/webcuidpers/services/agenda";
var rootURL = "http://les009584:8080/webcuidpers/services/agenda";

var mTipusServeisTam;			// Número de botons de grups funcionals (tipus de servei)
//var mColorSelect = "#37fd77";				// Color dels objectes seleccionats per l'usuari
//var mColorSelect = "rgb(173, 255, 47)";	// GreenYellow - Color dels objectes seleccionats per l'usuari
//var mColorSelect = "rgb(189, 183, 107)";	// DarkKhaki - Color dels objectes seleccionats per l'usuari
var mColorSelect = "rgb(152, 251, 152)";	// PaleGreen - Color dels objectes seleccionats per l'usuari
var vLlistaProfTam;				// Número de professionals a la llista

getSessio();
allTipusServeis('es');

function getSessio() {
	if ($.session.get('usuari') == null ||
			$.session.get('usuari') == undefined ||
			$.session.get('usuari') == "") {
		location.href="entrada.jsp";	
		return;
	}
	document.getElementById("nomFoto").title = $.session.get('usuari');
	document.getElementById("nomFoto").src = "../foto/" + $.session.get('foto');
}
function comprovarDadesObligatories() {
	var vResAgenda = false;
	// Comprovar Caselles de l'agenda
	for(var i=1;i<8 && !vResAgenda;i++) {
		for(var j=7;j<24 && !vResAgenda;j++) {
			vResAgenda = (document.getElementById("dia"+i+j).style.backgroundColor == mColorSelect);
		}
	}
	var vResProf = false;
	// Comprovar Professional seleccionat
	for(var i=0;i<vLlistaProfTam && !vResProf;i++) {
		var vTag = document.getElementById("divProfessional1" + i);
		vResProf = (vTag.style.backgroundColor == mColorSelect);	//"#37fd77"
	}
	//	Servei
	var vResServei = document.getElementById("servei").value != "";
	var vResDetallServei = document.getElementById("detall-servei").value != "";
	//
	return (vResAgenda && vResProf && vResServei && vResDetallServei);
}
function nouServei() {
	if (comprovarDadesObligatories()) {
		document.getElementById("agendaForm").submit();
	}
	else {
		alert(document.getElementById("strMissatgeDadesObligatories").value);
	}
}
function formatData(pData) {
	return pData.getDate() +"/"+ (pData.getMonth() + 1) +"/"+pData.getFullYear();
}

function omplirCalendari() {
	var vToday = new Date();
	var diaSemana = vToday.getDay();	
	if (diaSemana == 0)
		diaSemana = 6;
	else 
		diaSemana--;
	vToday.setDate(vToday.getDate() - diaSemana);
	document.getElementById("diaD1").innerHTML=formatData(vToday);
	vToday.setDate(vToday.getDate() + 1);
	document.getElementById("diaD2").innerHTML=formatData(vToday);
	vToday.setDate(vToday.getDate() + 1);
	document.getElementById("diaD3").innerHTML=formatData(vToday);	
	vToday.setDate(vToday.getDate() + 1);
	document.getElementById("diaD4").innerHTML=formatData(vToday);	
	vToday.setDate(vToday.getDate() + 1);
	document.getElementById("diaD5").innerHTML=formatData(vToday);	
	vToday.setDate(vToday.getDate() + 1);
	document.getElementById("diaD6").innerHTML=formatData(vToday);	
	vToday.setDate(vToday.getDate() + 1);
	document.getElementById("diaD7").innerHTML=formatData(vToday);	

	return false;
}

// http://192.168.1.130:8080/webcuidpers/services/agenda/allProfessionals/es/3,10,19
function allProfessionals(idIdioma, idsServeis) {	
	//console.log('allProfessionals-js: ' + idIdioma + " - " + idsServeis);
	$.ajax({
		type: 'GET',
		cache: false,
		url: rootURL + '/allProfessionals/' + idIdioma + '/' + idsServeis,
		dataType: "json",
		success: renderListAllProfessionals
	});
	return false;
}

//http://localhost:8080/webcuidpers/services/agenda/allServeis/es
function allTipusServeis(searchKey) {	
	//console.log('allTipusServeis-js: ' + searchKey);
	$.ajax({
		type: 'GET',
		cache: false,
		url: rootURL + '/allServeis/' + searchKey,
		dataType: "json",
		success: renderListAllTipusServeis
	});
	return false;
}

//http://localhost:8080/webcuidpers/services/agenda/allAgenda/1,2
function allAgenda(idsProfessionals, vDataIni, vDataFi) {	
	//console.log('allAgenda-js: ' + rootURL + '/allAgenda/' + idsProfessionals + "/" + vDataIni + "/" + vDataFi);
	//alert(rootURL + '/allAgenda/' + idsProfessionals + "/" + vDataIni + "/" + vDataFi);
	$.ajax({
		type: 'GET',
		cache: false,
		url: rootURL + '/allAgenda/' + idsProfessionals + "/" + vDataIni + "/" + vDataFi,
		dataType: "json",
		success: renderAgenda
	});
	return false;
}

var listTipusServeis;
var numCheckBoxMax = 6;

function seleccionarProfessional(vTamLlista, vIndex, vIdProfessional) {
	// Comprova si el Tag ja estava seleccionat. En aquest cas s'ha de desmarcar
	var vTagAnt = document.getElementById("divProfessional1" + vIndex);
	var estaRepetit = (vTagAnt.style.backgroundColor == mColorSelect);
	netejarProfessionals(vTamLlista);
	if(!estaRepetit) {
		var vTag = document.getElementById("divProfessional1" + vIndex);
		vTag.style.backgroundColor = mColorSelect;
		vTag = document.getElementById("divProfessional2" + vIndex);
		vTag.style.backgroundColor = mColorSelect;
		vTag = document.getElementById("divProfessional3" + vIndex);
		vTag.style.backgroundColor = mColorSelect;
		//
		document.getElementById("idProfessional").value=vIdProfessional;
	}
	else {
		document.getElementById("idProfessional").value='';
	}
	//
	// Agenda a partir dels Ids dels professionals
	//
	buidarAgenda();
	//	Preparar l'agenda de la setmana
	var vDataIni = formatDataSQL(document.getElementById("diaD1").innerHTML) + "_" + "00:00:00";
	var vDataFi = formatDataSQL(document.getElementById("diaD7").innerHTML) + "_" + "23:59:59";
	allAgenda(vIdProfessional, vDataIni, vDataFi);
}
function netejarProfessionals(vTamLlista) {
	var vFonsColor = "#e8fae7";
	for(var i=0;i<vTamLlista;i++) {
		var vTag = document.getElementById("divProfessional1" + i);
		vTag.style.backgroundColor = vFonsColor;
		vTag = document.getElementById("divProfessional2" + i);
		vTag.style.backgroundColor = vFonsColor;
		vTag = document.getElementById("divProfessional3" + i);
		vTag.style.backgroundColor = vFonsColor;
		//
		if (i%2 == 0)
			vFonsColor = "#e8facc";
		else
			vFonsColor = "#e8fae7";
	}
}

function renderListAllProfessionals(data) {
	// JAX-RS serializes an empty list as null, and a 'collection of one' as an object (not an 'array of one')
	var listProfessionals = data == null ? [] : (data instanceof Array ? data : [data]);
	$('#divProfessionals div').remove();
	var strIdsProfessionals = "";
	var i=0;
	vLlistaProfTam = listProfessionals.length;
	$.each(listProfessionals, function(index, varProfessional) {
		$('#divProfessionals').append('<img src="../img/punt.png" width="100%" height="0px">'); 
		$('#divProfessionals').append('<div id="divProfessional1'+index+'" onclick="seleccionarProfessional('+vLlistaProfTam+','+index+','+varProfessional.idProf+');" class="p-1 webcuidpers-professionals"><p class="badge badge-pill webcuidpers-boles-num" style="background-color:#'+varProfessional.color+';">'+varProfessional.idProf+'</p></div>'); 
		$('#divProfessionals').append('<div id="divProfessional2'+index+'" onclick="seleccionarProfessional('+vLlistaProfTam+','+index+','+varProfessional.idProf+');" class="p-1 webcuidpers-professionals"><img src="../foto/'+varProfessional.idPers+'.png" width="50px"></div>'); 
		$('#divProfessionals').append('<div id="divProfessional3'+index+'" onclick="seleccionarProfessional('+vLlistaProfTam+','+index+','+varProfessional.idProf+');" class="p-1 webcuidpers-professionals">'+varProfessional.nom+' '+varProfessional.cognoms+'<br>'+varProfessional.telefon+' '+varProfessional.telefonBis+'<br>'+varProfessional.codiPostal+' '+varProfessional.localitat+'</div>');
		strIdsProfessionals += varProfessional.idProf; 
		if (index < vLlistaProfTam - 1)
			strIdsProfessionals += ",";
	});
	netejarProfessionals(vLlistaProfTam); 
	//
	// Agenda a partir dels Ids dels professionals
	//
	//	Preparar l'agenda de la setmana
	if (strIdsProfessionals != '') {
		var vDataIni = formatDataSQL(document.getElementById("diaD1").innerHTML) + "_" + "00:00:00";
		var vDataFi = formatDataSQL(document.getElementById("diaD7").innerHTML) + "_" + "23:59:59";
		//alert(strIdsProfessionals + ";" + vDataIni + ";" + vDataFi);
		allAgenda(strIdsProfessionals, vDataIni, vDataFi);
	}
	//
	return false;
}


function renderListAllTipusServeis(data) {
	// JAX-RS serializes an empty list as null, and a 'collection of one' as an object (not an 'array of one')
	listTipusServeis = data == null ? [] : (data instanceof Array ? data : [data]);
	$('#accordion ul').remove();
	$('#accordion').append('<ul class="nav flex-column">'); 
	$.each(listTipusServeis, function(index, varTipusServeis) {
		$('#accordion').append('<li class="nav-item">');
		$('#accordion').append('<button id="button'+index+'" onclick="renderServeis('+index+');" type="button" class="btn btn-block text-left btn-sm webcuidpers-menu-ver-button">'+varTipusServeis.nom+'</button>');
		$('#accordion').append('<br><br>');
		$('#accordion').append('</li>');
	});
	mTipusServeisTam = listTipusServeis.length;
	$('#accordion').append('</ul>');
	//	Buidar serveis
	for(i=0;i<6;i++) {
		var x = document.getElementById("lbServei" + i);
		x.style.visibility = "hidden";
		var cb = document.getElementById("cbServei" + i);
		cb.checked = false;
	}
	//
	/*
	 * 	Omplir calendari
	 */
	omplirCalendari();
	/*
	 * 
	 */
	return false;
}
function formatDataSQL(pData) {
	// 23/02/2021 to 2021-02-23
	var strAux = pData.split("/");
	return strAux[2] + "-" +strAux[1] + "-" +strAux[0];
}
function guardarSeleccionats() {
	var strSeleccionats = '';
	for(var i=1;i<8;i++) {
		for(var j=7;j<24;j++) {
			if (document.getElementById("dia"+i+j).style.backgroundColor == mColorSelect) {
				//	2021-02-23_12:00:00,2021-02-24_13:00:00
				var vFecha = document.getElementById("diaD" + i).innerHTML;
				var vHora = "" + j + ":00:00";
				strSeleccionats += formatDataSQL(vFecha) + "_" + vHora + ",";	
			}
		}
	}
	return strSeleccionats;
}
function clickAgenda(pCelda) {
	if (pCelda.style.backgroundColor != mColorSelect)
		pCelda.style.backgroundColor = mColorSelect;
	else {
		var vId = pCelda.id.substr(pCelda.id.length - 1);
		if (vId % 2 == 0)
			pCelda.style.backgroundColor = "#e0ffd2";
		else
			pCelda.style.backgroundColor = "#eaf7e1";
	}
	//	Guardar en el HIDDEN las celdas seleccionadas
	var strSelecc = guardarSeleccionats();
	document.getElementById("idHoraris").value = strSelecc;
}

function buidarAgenda() {
	for(var i=1;i<8;i++) {
		for(var j=7;j<24;j++) {
			//alert("dia"+i+j);
			document.getElementById("dia"+i+j).innerHTML = '';
			//document.getElementById("dia"+i+j).style.backgroundColor = "#e0ffd2";
		}
	}
}
function renderAgenda(data) {
	// JAX-RS serializes an empty list as null, and a 'collection of one' as an object (not an 'array of one')
	var listAgenda = data == null ? [] : (data instanceof Array ? data : [data]);
	// Agenda
	buidarAgenda();
	//
	$.each(listAgenda, function(index, cita) {		
		var vDataCita = new Date(cita.dataCita);
		var vColor = cita.color;
		var vDia = vDataCita.getDay();
		if (vDia == 0)
			vDia = 7;
		if (vDataCita.getHours() > 0) {
			document.getElementById("dia" + vDia + vDataCita.getHours()).innerHTML += "<span style=\"background-color: #"+vColor+";\">"+ cita.idProfessional +"</span>";
		}
	});	
}

function iniTipusServeisBackground() {
	for(var i=0;i<mTipusServeisTam;i++) {
		document.getElementById("button"+i).style.backgroundColor = "#c1e69d";
	}
}
function renderServeis(pIndex) {
	//
	iniTipusServeisBackground();
	document.getElementById("button" + pIndex).style.backgroundColor = mColorSelect;
	// Titol
	var x = document.getElementById("labelTipusServei");	// TITOL
	x.innerHTML = listTipusServeis[pIndex].nom;
	var y = document.getElementById("strTipusServei");		// HIDDEN Tipus de servei - String
	y.value = listTipusServeis[pIndex].nom;	
	var z = document.getElementById("idTipusServei");		// HIDDEN Tipus de servei - ID
	z.value = listTipusServeis[pIndex].id;	
	// Añadir Checkbox serveis
	var varIndex;
	var listServeis = listTipusServeis[pIndex].llistaServeis == null ? [] : (listTipusServeis[pIndex].llistaServeis instanceof Array ? listTipusServeis[pIndex].llistaServeis : [listTipusServeis[pIndex].llistaServeis]);
	$.each(listServeis, function(index, servei) {
		// Label
		var x = document.getElementById("lbServei" + index);
		x.innerHTML = servei.nom;
		x.style.visibility = "visible";
		x.style.display = "inline";
		// Checkbox
		var cb = document.getElementById("cbServei" + index);
		cb.checked = false;
		cb.value = servei.id;
		varIndex = index;
	});	
	// Eliminar Checkbox sobrantes
	var i;
	for(i=varIndex + 1;i<numCheckBoxMax;i++) {
		// Label
		var x = document.getElementById("lbServei" + i);
		x.style.display = "none";
		// Checkbox
		var cb = document.getElementById("cbServei" + i);
		cb.checked = false;
		cb.value = '';
	}
	// Eliminar professionals
	buidarAgenda();
	renderListAllProfessionals(null);
	
	return false;
}

function handleCheckBoxClick(pCheckBox) {
	var listCheckeds = '';
	var i;
	for(i=0;i<numCheckBoxMax;i++) {
		var cb = document.getElementById("cbServei" + i);
		if (cb.checked) {
			listCheckeds += cb.value + ","; 	
		}
	}
	// Render Professionals
	if (listCheckeds.localeCompare('') != 0 ) {		
		listCheckeds = listCheckeds.substr(0, listCheckeds.length - 1);
		allProfessionals('es', listCheckeds);
	}
	else {
		buidarAgenda();
		renderListAllProfessionals(null);
	}
}
