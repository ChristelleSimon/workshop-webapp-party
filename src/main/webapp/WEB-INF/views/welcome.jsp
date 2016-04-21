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
				<!-- <script  id="register" type="text/template7">
					<div class="center-align">
						{{#if id}}
							<button type="button"
							class="waves-effect waves-light btn-large digi-red"
							onclick="enterPriseActivatePlan('activate-{{id}}');" data-id="{{id}}"
							data-activate-message='{{js "activatePlanMessageFormat.printf(this.name, this.price)"}}'
							data-button-text="{{buttonText}}"
							data-is-carousel="false" id="activate-{{id}}">{{buttonText}}</button>
						{{/if}}
					</div>
				</script> -->
				
			</form>
			
	    </div>
	</body>

</html>

<script type="text/javascript">

    function validate(cookie)
    {
    	alert("validate cookie="+cookie);
    	
    	 /* document.cookie = "username=John Doe"; */
    	 /* doOnce("isCreatedMobiles","Mobiles"); */
    	var list = new cookieList("Mobiles");
   	 	alert("will call list.add");
    	list.add("03111111");
   	 	alert("will call list.items() ");
    	alert(list.items());
   	 	alert("I love you :*");
    }
    

	 var cookieList = function(cookieName) {
		 alert("cookieList is called with cookie name="+cookieName);
		//When the cookie is saved the items will be a comma seperated string
		//So we will split the cookie by comma to get the original array
		var cookie = cookieName.value;
		alert("will fill items");
		//Load the items or a new array if null.
		var items = cookie ? cookie.split(/,/) : new Array();
		alert("items= "+items);
		
		//Return a object that we can use to access the array.
		//while hiding direct access to the declared items array
		//this is called closures see http://www.jibbering.com/faq/faq_notes/closures.html
		return {
		   "add": function(val) {
		   	alert("add");
		       //Add to the items.
		       items.push(val);
		       alert("add2");
		       //Save the items to a cookie.
		       //EDIT: Modified from linked answer by Nick see 
		       //      http://stackoverflow.com/questions/3387251/how-to-store-array-in-jquery-cookie
		       $.cookie(cookieName, items.join(','));
		       alert("add3");
		   },
		   "remove": function (val) {
		   	alert("I love you remove :* 6");
		       //EDIT: Thx to Assef and luke for remove.
		       /** indexOf not support in IE, and I add the below code **/
		       if (!Array.prototype.indexOf) {
		           Array.prototype.indexOf = function(obj, start) {
		               for (var i = (start || 0), j = this.length; i < j; i++) {
		                   if (this[i] === obj) { return i; }
		               }
		               return -1;
		           }
		       }
		       var indx = items.indexOf(val);
		       if(indx!=-1) items.splice(indx, 1);
		       //if(indx!=-1) alert('lol');
		       $.cookie(cookieName, items.join(','));
		   },
		   "clear": function() {
		   	alert("I love you clear :* 7");
		       items = null;
		       //clear the cookie.
		       $.cookie(cookieName, null);
		   },
		   "items": function() {
		   	alert("I love you items :* 8");
		       //Get all the items.
		       return items;
	   		}
	 	}
	} 
	 
	 /* var createCookie = function(name, value, days) {
		    var expires;
		    alert("createCookie");
		    if (days) {
		        var date = new Date();
		        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
		        expires = "; expires=" + date.toGMTString();
		    }
		    else {
		        expires = "";
		    }
		    document.cookie = name + "=" + value + expires + "; path=/";
		} */

		function getCookie(c_name) {
			alert("getCookie");
		    if (document.cookie.length > 0) {
		        c_start = document.cookie.indexOf(c_name + "=");
		        if (c_start != -1) {
		            c_start = c_start + c_name.length + 1;
		            c_end = document.cookie.indexOf(";", c_start);
		            if (c_end == -1) {
		                c_end = document.cookie.length;
		            }
		            return unescape(document.cookie.substring(c_start, c_end));
		        }
		    }
		    return "";
		}
		
		/* function doOnce(isCreatedCookie,cookieName) {
			alert("doOnce");
			if (document.cookie.replace(/(?:(?:^|.*;\s*)isCreatedCookie\s*\=\s*([^;]*).*$)|^.*$/, "$1") !== "true") {
				alert("Do something here!");
				document.cookie = isCreatedCookie+"=true; expires=Fri, 31 Dec 9999 23:59:59 GMT";
			}
		} */

</script>