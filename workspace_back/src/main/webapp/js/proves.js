// The root URL for the RESTful services
var rootURL = "http://192.168.1.129:8080/webcuidpers/services/agenda";

allTipusServeis('es');

//http://localhost:8080/webcuidpers/services/agenda/allServeis/es
function allTipusServeis(searchKey) {	
	console.log('allServeis-js: ' + searchKey);
	$.ajax({
		type: 'GET',
		url: rootURL + '/allServeis/' + searchKey,
		dataType: "json",
		success: renderListAllTipusServeis
	});
	return false;
}

function renderListAllTipusServeisBis(data) {
	// JAX-RS serializes an empty list as null, and a 'collection of one' as an object (not an 'array of one')
	var list = data == null ? [] : (data instanceof Array ? data : [data]);
	//$('#collapse-cb-1 input').remove();
	//$('#collapse-cb-1 label').remove();
	//$.each(list, function(index, tipusServei) {
	//	var listServeis = tipusServei.llistaServeis == null ? [] : (tipusServei.llistaServeis instanceof Array ? tipusServei.llistaServeis : [tipusServei.llistaServeis]);
		
	$('#accordion').append('<div class="card">');
	$('#accordion').append('<div class="card-header">');
	$('#accordion').append('<a class="collapsed card-link" data-toggle="collapse" href="#collapse-5">');
	$('#accordion').append('Collapsible Group Item #5');
	$('#accordion').append('</a>');
	$('#accordion').append('</div>');
	$('#accordion').append('<div id="collapse-5" class="collapse" data-parent="#accordion">');
	$('#accordion').append('<div class="card-body" id="collapse-cb-5">');
	$('#accordion').append('Hola!');
	/*
		$('#collapse-cb-5').append('<br><input type="checkbox" id="vehicle105" name="vehicle105" value="Bike">');
		$('#collapse-cb-5').append('&nbsp;<label for="vehicle105" style="font:14px/14px sans-serif;"> I have a bike</label>');
		$('#collapse-cb-5').append('<br><input type="checkbox" id="vehicle205" name="vehicle205" value="Car">');
		$('#collapse-cb-5').append('&nbsp;<label for="vehicle205" style="font:14px/14px sans-serif;"> I have a car</label>');
		*/
	$('#accordion').append('</div>');
	$('#accordion').append('</div>');
	$('#accordion').append('</div>');  
	
		/*
		$.each(listServeis, function(index, servei) {
			(eval("$('#div-boto-esquerra-" + tipusServei.id + "')")).append('<input onclick="alert(' + tipusServei.id + '.' + servei.id + ');" type="checkbox" id="cb' + tipusServei.id + '.' + servei.id + '" name="cb' + tipusServei.id + '.' + servei.id + '" value="cb' + tipusServei.id + '.' + servei.id + '">');
			(eval("$('#div-boto-esquerra-" + tipusServei.id + "')")).append('&nbsp;<label for="cb' + tipusServei.id + '.' + servei.id + '" style="padding:5px;font:14px/14px sans-serif;">' + servei.nom + '</label><br>');
		});
		$('#botons-esquerra').append('</div>');
		*/
	//});
	return false;
}

function renderListAllTipusServeis(data) {
	// JAX-RS serializes an empty list as null, and a 'collection of one' as an object (not an 'array of one')
	var list = data == null ? [] : (data instanceof Array ? data : [data]);
	$('#collapse-cb-1 input').remove();
	$('#collapse-cb-1 label').remove();
	//$.each(list, function(index, tipusServei) {
	//	var listServeis = tipusServei.llistaServeis == null ? [] : (tipusServei.llistaServeis instanceof Array ? tipusServei.llistaServeis : [tipusServei.llistaServeis]);
		
		$('#collapse-cb-1').append('<br><input type="checkbox" id="vehicle10" name="vehicle10" value="Bike">');
		$('#collapse-cb-1').append('&nbsp;<label for="vehicle10" style="font:14px/14px sans-serif;"> I have a bike</label>');
		$('#collapse-cb-1').append('<br><input type="checkbox" id="vehicle20" name="vehicle20" value="Car">');
		$('#collapse-cb-1').append('&nbsp;<label for="vehicle20" style="font:14px/14px sans-serif;"> I have a car</label>');
		$('#vehicle10').checked(true);
		/*
		$.each(listServeis, function(index, servei) {
			(eval("$('#div-boto-esquerra-" + tipusServei.id + "')")).append('<input onclick="alert(' + tipusServei.id + '.' + servei.id + ');" type="checkbox" id="cb' + tipusServei.id + '.' + servei.id + '" name="cb' + tipusServei.id + '.' + servei.id + '" value="cb' + tipusServei.id + '.' + servei.id + '">');
			(eval("$('#div-boto-esquerra-" + tipusServei.id + "')")).append('&nbsp;<label for="cb' + tipusServei.id + '.' + servei.id + '" style="padding:5px;font:14px/14px sans-serif;">' + servei.nom + '</label><br>');
		});
		$('#botons-esquerra').append('</div>');
		*/
	//});
	return false;
}
