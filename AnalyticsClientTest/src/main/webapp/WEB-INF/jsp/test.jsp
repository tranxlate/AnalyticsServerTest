<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<script type="text/javascript" src="http://localhost:8080/js/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/js/jqwidgets/jqxcore.js"></script>
<script type="text/javascript" src="http://localhost:8080/js/jqwidgets/jqxdata.js"></script>
<script type="text/javascript" src="http://localhost:8080/js/analytics.js"></script>
<script type="text/javascript">
an('set','test');
an('send');
</script>
<script type="text/javascript">
function go(path) {
	location.href=path;
}
</script>
<title>Test Analytics</title>
</head>
<body>
	<button type="button" onclick="go('/');">/</button>
	<button type="button" onclick="go('/1');">/1</button>
	<button type="button" onclick="go('/2');">/2</button>
	<button type="button" onclick="go('/3');">/3</button>
	<button type="button" onclick="go('/4');">/4</button>
	<br/>
	<button type="button" onclick="go('/1/1');">/1/1</button>
	<button type="button" onclick="go('/1/2');">/1/2</button>
	<button type="button" onclick="go('/1/3');">/1/3</button>
	<button type="button" onclick="go('/1/4');">/1/4</button>
	<button type="button" onclick="go('/1/5');">/1/5</button>
	<br/>
	<button type="button" onclick="go('/2/1');">/2/1</button>
	<button type="button" onclick="go('/2/2');">/2/2</button>
	<button type="button" onclick="go('/2/3');">/2/3</button>
	<button type="button" onclick="go('/2/4');">/2/4</button>
	<button type="button" onclick="go('/2/5');">/2/5</button>	
</body>
</html>