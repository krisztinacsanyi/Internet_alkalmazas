<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:setDataSource 
    var="users"
    driver="org.apache.derby.jdbc.ClientDriver"
    url="jdbc:derby://localhost:1527/intalk"
    user="intalk"
    password="ckfjsa"
    scope="session" />

<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
   <% if(session.getAttribute("validuser")!=null){ // ha be van jelentkezve
        %>
        <jsp:forward page="main.jsp" />
<%   } %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Bejelentkezés</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <h1>Bejelentkezés</h1>
    <div class="loginbox">
        <div class="inner">
            <form action="checklogin.jsp" method="post">
                <div class="label">
                    Felhasználónév:
                </div>
                <div class="input">
                    <input type="text" name="username" id="username">
                </div>
                <div class="label">
                    Jelszó:
                </div>
                <div class="input">
                    <input type="password" name="password" id="password">
                </div>
                <div class="button">
                    <input type="submit" value="Bejelentkezés" name="login">
                </div>
                <c:if test="${!empty param.errorMsg}">
                    <div class="errorMsg">${param.errorMsg}</div>
                </c:if>
                <div class="label bigger">
                    Még nem regisztrált?
                </div>
                <div class="button bigger">
                    <a href="register.jsp">Kattintson ide</a>
                </div>
            </form>
        </div>
    </div>
</body>

</html>