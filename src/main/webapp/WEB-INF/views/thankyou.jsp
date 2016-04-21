<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/" var="welcome" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
     <%@ include file="/WEB-INF/css/style.css"%>
     <%@ include file="/WEB-INF/css/materialize.css"%>
</style>

<html>

	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>HelloWorld page</title>
	</head>
	
	<body>
		<div class="materialize-red-text center-align materialize-red.lighten-3">
		
			<h2>${greeting}</h2>
			
	        <form  method="get" action="congrats">
			</form>
			
	    </div>
	</body>

</html>

</script>