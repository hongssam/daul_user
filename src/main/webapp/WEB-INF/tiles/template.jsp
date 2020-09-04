<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html class="no-js js-menubar">
    <head>
        <tiles:insertAttribute name="header" />
    </head>
    <body class="animsition dashboard">
    	<tiles:insertAttribute name="nav" />
    	<tiles:insertAttribute name="left" />
        <tiles:insertAttribute name="body" />
        <tiles:insertAttribute name="footer" />
        <tiles:insertAttribute name="scripts" />
    </body>
</html>