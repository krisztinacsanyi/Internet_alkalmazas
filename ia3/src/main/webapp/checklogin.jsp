<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>

<c:choose>
    <c:when test="${(!empty param.login)}">
        <c:choose>
            <c:when test="${(empty param.username) || (empty param.password)}">
                <jsp:forward page="login.jsp">
                    <jsp:param name="errorMsg" value="Felhasználói név és jelszó megadása kötelező"/>
                </jsp:forward>
            </c:when>
            <c:otherwise>
                <sql:query var="success" dataSource="${users}">
                    SELECT * FROM Users where username='${param.username}' and password='${param.password}'
                </sql:query>
                <c:choose>
                    <c:when test="${success.rowCount != 0 }">
                        <% session.setAttribute("validuser", request.getParameter("username")); %>
                        <jsp:forward page="main.jsp"/>
                    </c:when>
                    <c:otherwise>
                        <sql:query var="wrongpw" dataSource="${users}">
                            SELECT * FROM Users where username='${param.username}' and password!='${param.password}'
                        </sql:query>
                        <c:choose>
                            <c:when test="${wrongpw.rowCount != 0 }">
                                <jsp:forward page="login.jsp">
                                    <jsp:param name="errorMsg" value="Helytelen jelszó"/>
                                </jsp:forward>
                            </c:when>
                            <c:otherwise>
                                <jsp:forward page="login.jsp">
                                    <jsp:param name="errorMsg" value="Nem létezik ezzel a névvel felhasználó"/>
                                </jsp:forward>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>

    </c:when>
    <c:otherwise>
        <jsp:forward page="login.jsp">
            <jsp:param name="errorMsg" value="A program használata előtt be kell jelentkezni"/>
        </jsp:forward>
    </c:otherwise>
</c:choose>
