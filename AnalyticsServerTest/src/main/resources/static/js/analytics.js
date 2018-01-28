//$(document).ready(function() {
//	alert("로딩 완료"); 
//});

var id;
var domain;
var path;

function an() {
	var a = arguments;
	switch (a.length){
	case 1: 
		if(a[0]=='send') {
			var source = {
				url: "http://localhost:8080/an/addpv",
				data: {
					id: id,
					domain: domain,
					path: path
				},
				datatype: "json",
				type: 'POST'
			};
			var dataAdapter = new $.jqx.dataAdapter(source, {
				loadComplete: function (data) {
					//alert(data.result);
				}
			});
			dataAdapter.dataBind();
		}
		//var val = a[0];
		break;
	case 2:
		//var val = a[0];
		//var val2 = a[1];
		if(a[0]=='set') {
			id = a[1];
			domain = window.location.protocol + "//" + window.location.host;
			path = window.location.pathname;
		}
		break;
	}
}
