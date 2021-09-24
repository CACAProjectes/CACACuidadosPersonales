// The root URL for the RESTful services
var rootURL = "http://les009584:8080/webcuidpers/services/agenda";

function aceptarUsuari() {
	var vUsuari = document.getElementById("usuari").value;
	var vPwd = document.getElementById("pwd").value;
	if (vUsuari != "" && vPwd != "") {
		autUsuari(vUsuari, vPwd);
	}
	else {
		var vMissatge = document.getElementById("missatgeUsuariPwd").value;
		alert(vMissatge);
	}
}

//http://localhost:8080/webcuidpers/services/agenda/autUsuari/ADM/626924434/Miquel_01
function autUsuari(pUsuari, pPwd) {	
	//console.log("autUsuari-js: " + pUsuari + " - " + pPwd);
	$.ajax({
		type: 'GET',
		cache: false,
		url: rootURL + '/autUsuari/ADM/' + pUsuari + '/' + pPwd,
		dataType: "json",
		success: renderUsuari,
		error: renderNoUsuari
	});
	return false;
}
function renderNoUsuari(data) {
	// No ha trobat l'usuari
	var vMissatge = document.getElementById("missatgeUsuariPwdFail").value;
	alert(vMissatge);
}
function renderUsuari(data) {
	// Ha trobat l'usuari
	if (data == null || 
		data == undefined || 
		data.idPers == '') {
		var vMissatge = document.getElementById("missatgeUsuariPwdFail").value;
		alert(vMissatge);
	}
	else {
		$.session.set('usuari', data.nom + " " + data.cognoms);
		$.session.set('foto', data.idPers + '.png');
		//
		location.href="agenda.jsp";
	}
}

