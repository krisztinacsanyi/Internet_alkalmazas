<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>

<c:choose>
    <c:when test="${(empty param.username) || (empty param.email) || (empty param.password)}">
        <jsp:forward page="register.jsp">
            <jsp:param name="errorMsg" value="Mindegyik mező kitöltése kötelező"/>
        </jsp:forward>
    </c:when>
    <c:otherwise>
           <% System.out.println("1. pont");%>
           <c:set var="errorUsername" value="false" scope="request"/>
           <c:set var="errorEmail" value="false" scope="request"/>
           <c:set var="errorPw" value="false" scope="request"/>
        <c:if test="${(fn:length(param.username) < 3)}">
            <c:set var="errorUsername" value="Minimum 3 karakter" scope="request"/>
        </c:if>
        <c:if test="${!(fn:contains(param.email, '@'))}">
            <c:set var="errorEmail" value="Valós e-mail cím megadása kötelező" scope="request"/>
        </c:if>
        <c:if test="${(fn:length(param.password) < 6)}">
            <c:set var="errorPw" value="Minimum 6 karakter" scope="request"/>
        </c:if>

        <c:choose>
            <c:when test="${errorUsername!='false'|| errorEmail!='false' || errorPw!='false'}">
                <jsp:forward page="register.jsp"/>
            </c:when>
            <c:otherwise>
                <sql:query var="userExists" dataSource="${users}">
                    SELECT * FROM Users where username='${param.username}'
                </sql:query>
                <c:choose>
                    <c:when test="${userExists.rowCount != 0 }">
                        <c:set var="errorUsername" value="Ez a felhasználónév már foglalt" scope="request"/>
                    </c:when>
                    <c:otherwise>
                        <sql:update var="newUser" dataSource="${users}">
                            INSERT INTO Users (username, email, password)
                            VALUES ('${param.username}', '${param.email}', '${param.password}')
                        </sql:update>
                        <jsp:forward page="login.jsp"/>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>