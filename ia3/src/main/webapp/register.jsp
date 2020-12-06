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
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Regisztráció</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <h1>Regisztráció</h1>
    <div class="registerbox">
        <div class="inner">
            <form action="checkreg.jsp" method="post" name="register">
                <div class="label">
                    Felhasználónév
                </div>
                <div class="input">
                    <input type="text" name="username" id="username">
                </div>
                <c:if test="${!errorUsername.isEmpty()}">
                    <div class="errorMsg">
                        <c:out value="${requestScope.errorUsername}"/>
                    </div>
                </c:if>
                <div class="label">
                    E-mail cím
                </div>
                <div class="input">
                    <input type="text" name="email" id="email">
                </div>
                <c:if test="${!errorEmail.isEmpty()}">
                    <div class="errorMsg">
                        <c:out value="${requestScope.errorEmail}"/>
                    </div>
                </c:if>
                <div class="label">
                    Jelszó:
                </div>
                <div class="input">
                    <input type="password" name="password" id="password">
                </div>
                <c:if test="${!errorPw.isEmpty()}">
                    <div class="errorMsg">
                        <c:out value="${requestScope.errorPw}"/>
                    </div>
                </c:if>
                <c:if test="${!empty param.errorMsg}">
                    <div class="errorMsg">${param.errorMsg}</div>
                </c:if>
                <div class="button">
                    <input type="submit" value="Regisztráció" name="register">
                </div>
                <div class="label bigger">
                    Már regisztrált?
                </div>
                <div class="button bigger">
                    <a href="login.jsp">Jelentkezzen be</a>
                </div>
            </form>
        </div>
    </div>
</body>

</html>