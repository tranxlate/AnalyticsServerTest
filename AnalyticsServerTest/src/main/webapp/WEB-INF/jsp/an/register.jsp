<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" type="text/css" href="/css/views/common.css">
<link rel="stylesheet" type="text/css" href="/css/views/register.css">
<link rel="stylesheet" type="text/css" href="/css/normalize-5.0.0.min.css">
<link rel="stylesheet" type="text/css" href="/css/font-awesome-4.7.0.css">
<link rel="stylesheet" type="text/css" href="/css/w3/w3.css">
<script type="text/javascript" src="/js/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="/js/jqwidgets/jqxcore.js"></script>
<script type="text/javascript" src="/js/jqwidgets/jqxdata.js"></script>
<script type="text/javascript">
function register() {
	var id = $("#id").val();
	var domain = $("#domain").val();
	if(id=='' || domain=='') {
		alert("Please checking ID and domain.");
		return ;
	}
	var source = {
		url: "/register/post",
		data: {
			id: id,
			domain: domain
		},
		datatype: "json",
		type: 'POST'
	};
	var dataAdapter = new $.jqx.dataAdapter(source, {
        loadComplete: function (data) {
        	alert(data.script);
        }
	});
	dataAdapter.dataBind();
}
</script>
<title>Hello Analytics</title>
</head>
<body>
	<header>
		<jsp:include page="../menu/menu.jsp"></jsp:include>
	</header>
	<section>
		<article class="register">
			<form class="w3-container w3-card-4 w3-light-grey w3-text-blue w3-margin">
			<h2 class="w3-center">Register</h2>
			 
			<div class="w3-row w3-section">
				<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
				<div class="w3-rest">
					<input class="w3-input w3-border" name="id" id="id" type="text" placeholder="Your ID">
				</div>
			</div>
			
			<div class="w3-row w3-section">
				<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-pencil"></i></div>
				<div class="w3-rest">
					<input class="w3-input w3-border" name="domain" id="domain" type="text" placeholder="Domain">
				</div>
			</div>
			
			<button type="button" class="w3-button w3-block w3-section w3-blue w3-ripple w3-padding" onclick="register();">Send</button>
			
			</form>
		</article>
		<article class="script">
			<h2 class="w3-center">Script</h2>
			<textarea></textarea>
		</article>
	</section>
	<footer></footer>
</body>
</html>