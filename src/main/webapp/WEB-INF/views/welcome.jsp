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
	<link rel="shortcut icon"
 	href="images/favicon.ico" />
	<title>HelloWorld page</title>
	</head>
	
	<body>
		<div class="materialize-red-text center-align materialize-red.lighten-3">
		
			<h2>${greeting}</h2>
			
	        <form  method="get" action="congrats">
				<div class="lighten-5 z-depth-1 enter-info-block">
					<div class="row">
						<div class="input-field col s12 data-to-enter">
							<input type="text" value="" placeholder="Jhon Smith" required  >
							<label class="active" for="telephone">Name</label>
						</div>
						<div class="input-field col s12 data-to-enter">
							<input id="mobile" name="mobile" type="tel" pattern="[0-9]+" value="" placeholder="03123456" required  >
							<label class="active" for="telephone">Telephone</label>
						</div>
						<div class="input-field col s12 data-to-enter">
							<input  id="email" type="email" value="" placeholder="name@email.com" required>
							<label class="active" for="email">Email</label>
						</div>
					</div>	
				</div>
				
				<a class="waves-effect waves-light btn red submit-btn" type="submit"><input type="submit" value="Register"/></a>
			</form>
			
	    </div>
	</body>

</html>
