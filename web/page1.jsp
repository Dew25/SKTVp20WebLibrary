<%-- 
    Document   : page1
    Created on : Dec 21, 2021, 6:12:06 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1><br>
        <h3>${infoText}</h3>
        <p>${author.firstname} ${author.lastname}</p>
        <p>Читатель: ${reader.firstname} ${reader.lastname}. Телефон: ${reader.phone}</p>
        <h1><a href="index.html">index</a></h1>
    </body>
</html>
