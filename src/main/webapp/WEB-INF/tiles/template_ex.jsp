<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
    <head>
     	<tiles:insertAttribute name="header" />
    </head>
    <body>
	    <div class="wrapper">
			<div class="preloader"></div>
	        <tiles:insertAttribute name="body" />
		</div>
    </body>
</html>