// The root URL for the RESTful services
var rootURL = "http://les009584:8080/webcuidpers/services/agenda";
var rootURLEvents = "http://les009584:8080/webcuidpers/services/events";

var mColorSelect = "rgb(152, 251, 152)";	// PaleGreen - Color dels objectes seleccionats per l'usuari
/*
 * Declaració de variables globals per l'event i email
 */
var mMissatgeTO;
var mTipusServeiIndex;
var mTipusServeiID = [];
var mTipusServei = [];
var mClientSeleccionat;
var mClientNom = [];
var mClientCognoms = [];
var mClientTelefons = [];
var mClientEmails = [];
var mProfNom;
var mProfCognoms;
var mProfTelefons;
var mProfEmails;
var mLocationAdreca = [];
var mLocationCodiPostal = [];
var mLocationLocalitat = [];
var mLocationProvincia = [];
var mHoraris;
var mTarifa = [];
var mIdReserva;

getSessio();
oneProfessional('es');
iniEvents();

function comprovarDadesObligatories() {
	var vIndex = 0;
	// Comprovar que hi ha alguna hora seleccionada
	var vHiHaUnChecked = false;
	var vResHora = true;
	var vFi = false;
	while(!vFi) {
		if (document.getElementById("datahora" + vIndex) != null) {
			if (document.getElementById("datahora" + vIndex).checked) {
				vHiHaUnChecked = true;
				vResHora &= (document.getElementById("data" + vIndex).value != "") &&
				(document.getElementById("hora" + vIndex).value != "") &&
				(document.getElementById("horaSeg" + vIndex).value != "");
			}
		}
		else {
			vFi = true;
			break;
		}
		vIndex++;
	}
	vResHora = vResHora && vHiHaUnChecked;
	// Comprovar que hi ha alguna hora seleccionada
	var vResClient = false;
	for(var i=0;i<10 && !vResClient;i++) {
		vResClient = (document.getElementById("col0"+i).style.backgroundColor == mColorSelect);
	}
	//	Servei
	var vResServei = document.getElementById("servei").value != "";
	var vResDetallServei = document.getElementById("detall-servei").value != "";
	//
	return vResHora && vResClient && vResServei && vResDetallServei;
}
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

function iniEvents() {
    $("#busqnom").keyup(function(){
    	buidarTaula();
    	cercaNomChange();
    }); 
}

function seleccionarRowNomClient() {
	if (mClientSeleccionat != "" && mClientSeleccionat != undefined)
		return document.getElementById("col1"+mClientSeleccionat).innerHTML;
	return "";
}

function guardarServei() {
	//console.log('guardarServei-js: ' + idIdioma);
	var vIdProfessional = document.getElementById("idProfessional").value;	// ID professional
	var vNomProfessional = mProfNom + " " +	mProfCognoms;
	var vIdClient = document.getElementById("idClient").value;				// ID client
	var vNomClient = seleccionarRowNomClient();
	//var vIdTipusServei = document.getElementById("valServei").value;		// ID tipus servei
	var vIdTipusServei = mTipusServeiID[mTipusServeiIndex];					// ID tipus servei
	var vNomTipusServei = mTipusServei[mTipusServeiIndex];
	var vTitolServei = document.getElementById("servei").value;
	var vDescServei = document.getElementById("detall-servei").value;
	var vHoraris = parserHoraris();											// Horaris
	//var vHorarisWeb = parserHorarisWeb(vHoraris);
	mHoraris = parserHorarisWeb(vHoraris);									// Horaris Web
	var vAdreca = parserAdreca();											// Adreça nova
	var vMissatge = document.getElementById("missatgeConfirm").value;		// Missatge
	var missatgeConf = vMissatge.replace("{1}", vNomProfessional).replace("{2}", vNomClient).replace("{3}", vNomTipusServei).replace("{4}", vHoraris).replace("{5}", vAdreca);	
	//alert(rootURL + '/guardarServei/' + vIdProfessional + '/' + vIdClient + '/' + vIdTipusServei + '/' + mHoraris + '/' + vAdreca + '/' + vTitolServei + '/' + vDescServei);
	if (comprovarDadesObligatories()) {
		if (confirm(missatgeConf)) {
			$.ajax({
				type: 'GET',
				cache: false,
				url: rootURL + '/guardarServei/' + vIdProfessional + '/' + vIdClient + '/' + vIdTipusServei + '/' + mHoraris + '/' + vAdreca + '/' + vTitolServei + '/' + vDescServei,
				dataType: "json",
				success: renderGuardarServei
			});
	    }
	}
	else {
		alert(document.getElementById("strMissatgeDadesObligatories").value);
	}
	return false;
}

function parserServei() {
	var rad = document.getElementById("radserveis");
	//alert(rad.value);
	for (var i = 0; i < rad.length; i++) {
		//alert(rad[i].value);
		if (rad[i].checked)
			return rad[i].value;
	}
	return 0;
}
/*
function parserHorarisAjuntar(pHoraris) {
	//2021-02-22_00:00:00,2021-02-29_00:00:00
	var lDates = pHoraris.split(",");	
	for(var i=0;i<lDates.length-1;i++) {
		var vDataHora = lDates[i].split("_");
		//var vData = vDataHora[0].split("-");	// Data
		var vHora = vDataHora[1].split(":");	// Hora
		
		}
	}
	
}
*/
function parserHorarisWeb(pHoraris) {
	// 19/3/2021 7:00,19/3/2021 8:00,
	// To
	// 2021-02-22_00:00:00,2021-02-29_00:00:00
	var strData = "";
	const search1 = '/';
	const searchRegExp1 = new RegExp(search1, 'g');
	pHoraris = pHoraris.replace(searchRegExp1, '-');
	var lDates = pHoraris.split(",");	
	for(var i=0;i<lDates.length-1;i++) {
		var vDataHora = lDates[i].split(" ");
		var vData = vDataHora[0].split("-");	
		var vHora = vDataHora[1].split(":");
		var vHoraSeg = vDataHora[2].split(":");
		strData += vData[2] + "-" +vData[1] + "-" +vData[0] + "_" +vHora[0] + ":" +vHora[1] + ":00"+ "_" +vHoraSeg[0] + ":" +vHoraSeg[1] + ":00,";
	}
	//alert(strData);
	return strData;
}
	
function parserHoraris() {
	var vFi = false;
	var vIndex = 0;
	var vHoraris = "";
	while(!vFi) {
		if (document.getElementById("datahora" + vIndex) != null) {
			if (document.getElementById("datahora" + vIndex).checked) {
				vHoraris += document.getElementById("data" + vIndex).value +
				" " +
				document.getElementById("hora" + vIndex).value +
				" " +
				document.getElementById("horaSeg" + vIndex).value +
				",";
			}
		}
		else
			break;
		vIndex++;
	}
	return vHoraris;
}
function handleRadioClick(vCBIndex) {
	mTipusServeiIndex = vCBIndex;	
}
function parserAdreca() {
	var vAdreca = "";
	if (document.getElementById("adreca").value != "") {	// Adreça nova
		vAdreca = document.getElementById("adreca").value + "!" +				
			document.getElementById("codipostal").value + "!" +
			document.getElementById("poblacio").value + "!" +
			document.getElementById("provincia").value + "!" +
			document.getElementById("pais").value;
	} else {
		vAdreca = mLocationAdreca[mClientSeleccionat] + "!" +
		mLocationCodiPostal[mClientSeleccionat] + "!" +
		mLocationLocalitat[mClientSeleccionat] + "!" +
		mLocationProvincia[mClientSeleccionat] + "!" +
		document.getElementById("pais").value;
	}	
	if (vAdreca != "") {
		const search1 = '/';
		const searchRegExp1 = new RegExp(search1, 'g');
		return vAdreca.replace(searchRegExp1, '_');
	}
	return "";
}
function renderGuardarServei(data) {
	document.getElementById("resultat").value = data.codi;
	mIdReserva = data.descripcio;	// Codi de la reserva RESERVA20210312174800
	alert(data.codi);
	if (data.codi == 0) {
		//	Enviar invitació al client
		enviarEventServei();
	}	
	document.getElementById("nouServeiForm").action = "resultat.jsp";
	document.getElementById("nouServeiForm").submit();
}
function enviarEventServei() {
	//console.log('enviarEventServei-js: ');
	var vIdProfessional = document.getElementById("idProfessional");	// ID professional
	var vIdClient = document.getElementById("idClient");				// ID client
	var vIdTipusServei = document.getElementById("idTipusServei");		// ID tipus servei
	var vHoraris = document.getElementById("idHoraris");				// Horaris
	var vMissatge = document.getElementById("missatgeConfirm");			// Missatge
	var missatgeConf = vMissatge.value.replace("{1}", vIdProfessional.value).replace("{2}", vIdClient.value).replace("{3}", vIdTipusServei.value).replace("{4}", vHoraris.value);	
	/*
	 // http://192.168.1.130:8080/webcuidpers/services/events/enviarServeiEvent/campospulido@gmail.com!campospulido@hotmail.com,cacaesports@gmail.com!Cuidar persona gran!Detall del servei!Grup funcional!Tipus servei!Client.nom!Client.cognoms!Client.telefons!Client.emails!Professional.nom!Professional.cognoms!Professional.telefons!Professional.emails!C_Música 6, 2º-4ª.08191 Rubí.Barcelona!2021-02-12_18:00:00!2021-02-12_19:15:00!20!RESERVA20210312174800!
		http://192.168.1.130:8080/webcuidpers/services/events/enviarServeiEvent/campospulido@gmail.com!campospulido@hotmail.com,cacaesports@gmail.com!Cuidar persona gran!Detall del servei!Grup funcional!Tipus servei!Client.nom!Client.cognoms!Client.telefons!Client.emails!Professional.nom!Professional.cognoms!Professional.telefons!Professional.emails!C_Música 6, 2º-4ª.08191 Rubí.Barcelona!2021-02-12_18:00:00!2021-02-12_19:15:00!20!RESERVA20210312174800!

 	 0  * campospulido@hotmail.com								TO
	 1  * campospulido@hotmail.com, elisendacanals@hotmail.com	CC
	 2  * Cuidar persona gran									TÍTOL DEL SERVEI
	 3  * Detall del servei										DESCRIPCIÓ DEL SERVEI
	 4	* Grup funcional										GRUP FUNCIONAL
	 5	* Tipus servei											TIPUS DE SERVEI
	 6  * Client.nom											CLIENT
	 7  * Client.cognoms
	 8  * Client.telefons
	 9  * Client.emails
	 10 * Professional.nom										PROFESSIONAL
	 11 * Professional.cognoms
	 12 * Professional.telefons
	 13 * Professional.emails
	 14 * C_Música 6, 2º-4ª.08191 Rubí.Barcelona				LOCATION
	 15 * 2021-02-22_00:00:00									DATA INI
	 16 * 2021-02-29_00:00:00									DATA FI
	 17 * 20													TARIFA
	 18 * RESERVA20210312174800									ID RESERVA
	 */
	var vMissatgeEvent = mMissatgeTO + "!" +		// TO
		mClientEmails[mClientSeleccionat] + "!" +	// CC
		document.getElementById("servei").value + "!" +
		document.getElementById("detall-servei").value + "!" +
		document.getElementById("grupFuncional").value + "!" +
		mTipusServei[mTipusServeiIndex] + "!" +
		mClientNom[mClientSeleccionat] + "!" +
		mClientCognoms[mClientSeleccionat] + "!" +
		mClientTelefons[mClientSeleccionat] + "!" +
		mClientEmails[mClientSeleccionat] + "!" +
		mProfNom + "!" +
		mProfCognoms + "!" +
		mProfTelefons + "!" +
		mProfEmails + "!" +
		mLocationAdreca[mClientSeleccionat] + "." +
		mLocationCodiPostal[mClientSeleccionat] + "." +
		mLocationLocalitat[mClientSeleccionat] + "." +
		mLocationProvincia[mClientSeleccionat] + "!" +
		mHoraris + "!" +
		mTarifa[mTipusServeiIndex] + "!" +
		mIdReserva + "!";
	
	vMissatgeEvent = parserMissatge(vMissatgeEvent);

	//alert(rootURLEvents + '/enviarServeiEvent/' + vMissatgeEvent);

	$.ajax({
		type: 'GET',
		cache: false,
		url: rootURLEvents + '/enviarServeiEvent/' + vMissatgeEvent,
		dataType: "json",
		success: renderEnviarServeiEvent
	});
	return false;
}
function parserMissatge(pMissatge) {
	const search1 = '/';
	const searchRegExp1 = new RegExp(search1, 'g');
	return pMissatge.replace(searchRegExp1, '_');
}
function renderEnviarServeiEvent(data) {
	console.log("renderEnviarServeiEvent-js: " + data.codi + " - " + data.descripcio);
}
function anteriorServei() {
	document.getElementById("nouServeiForm").action = "agenda.jsp";
	document.getElementById("nouServeiForm").submit();
}

//http://localhost:8080/webcuidpers/services/agenda/oneProfessional/es/2/8
function oneProfessional(idIdioma) {	
	//console.log('oneProfessional-js: ' + idIdioma);
	var vIdProfessional = document.getElementById("idProfessional");	// ID professional
	var vIdTipusServei = document.getElementById("idTipusServei");		// ID tipus servei
	var vHoraris = document.getElementById("idHoraris");				// Horaris
	//alert('/oneProfessional/' + idIdioma + '/' + vIdProfessional.value + '/' + vIdTipusServei.value + '/' + vHoraris.value);
	$.ajax({
		type: 'GET',
		cache: false,
		url: rootURL + '/oneProfessional/' + idIdioma + '/' + vIdProfessional.value + '/' + vIdTipusServei.value,
		dataType: "json",
		success: renderOneProfessionals
	});
	return false;
}

function renderOneProfessionals(data) {
	// JAX-RS serializes an empty list as null, and a 'collection of one' as an object (not an 'array of one')
	// Dades del professional
	document.getElementById("dadesProfessional").innerHTML = data.nom + 
		" " + data.cognoms + 
		"<br>" + data.telefon + 
		"<br>" + data.email +
		"<br>" + data.localitat +
		"<br>" + data.provincia;
	/////////////////////////////////
	// Dades per l'email
	mProfNom = data.nom;
	mProfCognoms = data.cognoms;
	mProfTelefons = data.telefon;
	mProfEmails = data.email;
	mMissatgeTO = data.email;
	/////////////////////////////////
	// Professions
	/*
	var llistaProf = data.llistaProfessions == null ? [] : (data.llistaProfessions instanceof Array ? data.llistaProfessions : [data.llistaProfessions]);
	document.getElementById("dadesProfessions").innerHTML = '';
	$.each(llistaProf, function(index, professio) {		
		document.getElementById("dadesProfessions").innerHTML += (index+1) + " - " + professio.nom + '<br>'; 

	});	
	*/
	// Serveis
	var llistaProf = data.llistaServeis == null ? [] : (data.llistaServeis instanceof Array ? data.llistaServeis : [data.llistaServeis]);
	document.getElementById("dadesServeis").innerHTML = '';
	$.each(llistaProf, function(index, servei) {		
		var vChecked = (index == 0 ? "checked" : "");
		$('#dadesServeis').append('<label class="webcuidpers-form-text"><input onclick="handleRadioClick('+ index +');" type="radio" '+ vChecked +' value="'+ servei.id +'" name="radserveis" id="radserveis"> '+ servei.nom +'</label><br>');
		// Dades de l'email
		mTipusServeiIndex = 0;
		mTipusServeiID[index] = servei.id;
		mTipusServei[index] = servei.nom;
		//mTarifa[index] = servei.tarifa;
		mTarifa[index] = 10;
	});	
	// Dates reserva
	var vDatesReserva = document.getElementById("idHoraris").value;
	// Elimina el darrer caracter si és una ','
	if (vDatesReserva.charAt(vDatesReserva.length-1) == ',')
		vDatesReserva = vDatesReserva.substring(0, vDatesReserva.length-1);
	
	var lDatesRes = vDatesReserva.split(",");		
	document.getElementById("datesReserva").innerHTML = '';
	$.each(lDatesRes, function(index, vData) {				
		//document.getElementById("datesReserva").innerHTML += string2Data(vData) + "<br>";
		$('#datesReserva').append('<label class="webcuidpers-form-text">');
		$('#datesReserva').append('<input type="checkbox" checked value="'+ index +'" name="datahora'+ index +'" id="datahora'+ index +'"> ');
		$('#datesReserva').append('<input class="webcuidpers-form-text" type="text" size="7" maxlength="10" value="'+ string2Data(vData) +'" id="data'+ index +'" name="data'+ index +'">&nbsp;&nbsp;');
		$('#datesReserva').append('<input class="webcuidpers-form-text" type="text" size="2" maxlength="5" value="'+ string2Hora(vData) +'" id="hora'+ index +'" name="hora'+ index +'">&nbsp;-&nbsp;');		
		$('#datesReserva').append('<input class="webcuidpers-form-text" type="text" size="2" maxlength="5" value="'+ string2HoraSeg(vData) +'" id="horaSeg'+ index +'" name="horaSeg'+ index +'">');		
		$('#datesReserva').append('</label><br>');		
	});		
	return false;
}
function esborrarData(pIndex) {
	document.getElementById("data" + pIndex).value = "";
	document.getElementById("hora" + pIndex).value = "";
}
function string2Hora(strData) {
	var vDataHora = strData.split("_");
	var vData = vDataHora[0].split("-");
	var vHora = vDataHora[1].split(":");
	return vHora[0] + ":" + vHora[1];
}
function string2HoraSeg(strData) {
	var vDataHora = strData.split("_");
	var vData = vDataHora[0].split("-");
	var vHora = vDataHora[1].split(":");
	return (parseInt(vHora[0]) + 1) + ":" + vHora[1];
}
function string2Data(strData) {
	var vDataHora = strData.split("_");
	var vData = vDataHora[0].split("-");
	var vHora = vDataHora[1].split(":");
	return vData[2] + "/" + vData[1] + "/" + vData[0];
}

function cercaClient() {
	//console.log('cercaClient-js: ');
	var vIdClient = document.getElementById("busqref").value;	// ID referencia
	if(vIdClient=='')
		return false;
	$.ajax({
		type: 'GET',
		cache: false,
		url: rootURL + '/cercaClient/' + vIdClient,
		dataType: "json",
		success: renderCercaClient
	});
	return false;
}
function renderCercaClient(data) {
	// JAX-RS serializes an empty list as null, and a 'collection of one' as an object (not an 'array of one')
	// Dades del client
	buidarTaula();
	//
	var llistaClients = data == null ? [] : (data instanceof Array ? data : [data]);
	$.each(llistaClients, function(index, vClient) {
		document.getElementById("col0" + index).innerHTML = vClient.idClient; 
		document.getElementById("col1" + index).innerHTML = vClient.nom + " " + vClient.cognoms; 
		document.getElementById("col2" + index).innerHTML = vClient.dataNaixement.substr(0,4); 
		document.getElementById("col3" + index).innerHTML = vClient.telefon + "<br>" + vClient.telefonBis.replace(/null/g, '""');
		document.getElementById("col4" + index).innerHTML = vClient.localitat + "<br>" + vClient.provincia; 
		if (vClient.contacte1.telefon != undefined) {
			document.getElementById("col5" + index).innerHTML = vClient.contacte1.telefon.replace(/null/g, '""') + " " + vClient.contacte1.nom.replace(/null/g, '""'); 
		}
		if (vClient.contacte2.telefon != undefined) {
			document.getElementById("col5" + index).innerHTML += "<br>" + vClient.contacte2.telefon.replace(/null/g, '""') + " " + vClient.contacte2.nom.replace(/null/g, '""'); 
		}
		if (vClient.infoRelevant.informacio != undefined)
			document.getElementById("col6" + index).innerHTML = vClient.infoRelevant.informacio.replace(/null/g, '""');
		// Dadel de l'email
		mClientNom[index] = vClient.nom;
		mClientCognoms[index] = vClient.cognoms;
		mClientTelefons[index] = vClient.telefon + " " + vClient.telefonBis.replace(/null/g, '""');
		mClientEmails[index] = vClient.email
		mLocationAdreca[index] = vClient.adreca;
		mLocationCodiPostal[index] = vClient.codiPostal;
		mLocationLocalitat[index] = vClient.localitat;
		mLocationProvincia[index] = vClient.provincia;
	});	
}
function buidarTaula() {
	for(var i=0;i<7;i++) {
		for(var j=0;j<10;j++) {
			document.getElementById("col"+i+j).innerHTML = '';
			if (j % 2 == 0)
				document.getElementById("col"+i+j).style.backgroundColor = "#eaf7e1";
			else
				document.getElementById("col"+i+j).style.backgroundColor = "#e0ffd2";
		}
	}
}
function buidarTaulaRef() {	
	for(var i=0;i<10;i++) {
		if (i % 2 == 0)
			//document.getElementById("col0"+i).style.backgroundColor = "#eaf7e1";
			seleccionarRowTaula(document.getElementById("col0"+i), "#eaf7e1");
		else
			//document.getElementById("col0"+i).style.backgroundColor = "#e0ffd2";
			seleccionarRowTaula(document.getElementById("col0"+i), "#e0ffd2");
	}
}

function seleccionarRowTaula(vControl, vColor) {	
	var rowIndex = vControl.id.substring(4);	// Index de la fila
	for(var i=0;i<7;i++) {
		document.getElementById("col"+i+rowIndex).style.backgroundColor = vColor;
	}
}
function clickTaulaClient(vControl) {
	mClientSeleccionat = vControl.id.substring(4);	// Num. de linia de la taula de clients
	document.getElementById("idClient").value = document.getElementById("col0"+mClientSeleccionat).innerHTML;
	//
	if (vControl.style.backgroundColor != mColorSelect) {
		buidarTaulaRef();
		//vControl.style.backgroundColor = mColorSelect;
		seleccionarRowTaula(vControl, mColorSelect);
	}
	else {
		buidarTaulaRef();
		var vId = vControl.id.substr(vControl.id.length - 1);
		if (vId % 2 == 0)
			vControl.style.backgroundColor = "#eaf7e1";
		else
			vControl.style.backgroundColor = "#e0ffd2";
		mClientSeleccionat = "";	// Client no seleccionat
	}
}
//http://localhost:8080/webcuidpers/services/agenda/cercaByNom/ca
function cercaByNom(vNom) {	
	//console.log('cercaByNom-js: ' + idIdioma);
	$.ajax({
		type: 'GET',
		cache: false,
		url: rootURL + '/cercaByNom/' + vNom,
		dataType: "json",
		success: renderCercaClient
	});
	return false;
}
function cercaNomChange() {
	vNom = document.getElementById("busqnom").value;
	if (vNom.length > 2)
		cercaByNom(vNom);
}
