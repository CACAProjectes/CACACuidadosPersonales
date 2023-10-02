// The root URL for the RESTful services
var rootURL = "http://les009584:8080/webcuidpers/services/agenda";

getSessio();
iniDades();

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
function iniDades() {
	var vRes = $('#resultat_form').val();
	$('#textResultat div').remove();
	if (vRes == '0') {
		$('#textResultat').append('&nbsp;&nbsp;&nbsp;<img src="../img/flag_ok.png" class="rounded-circle" height="50px">&nbsp;&nbsp;&nbsp;');
		$('#textResultat').append($('#resultat_ok').val());
	}
	else {
		$('#textResultat').append('&nbsp;&nbsp;&nbsp;<img src="../img/flag_ko.png" class="rounded-circle" height="50px">&nbsp;&nbsp;&nbsp;');
		$('#textResultat').append($('#resultat_ko').val());
	}	
}
