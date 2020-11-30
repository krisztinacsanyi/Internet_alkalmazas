<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : delete
    Created on : 2020.11.30., 19:22:18
    Author     : filjan
--%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<sql:setDataSource 
    var="posts"
    driver="org.apache.derby.jdbc.ClientDriver"
    url="jdbc:derby://localhost:1527/intalk"
    user="intalk"
    password="ckfjsa"
    scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<sql:update var="delete" dataSource="${posts}">
    DELETE FROM POSTS
    WHERE POST_ID = <%= request.getParameter("post_id")%>
</sql:update>               

<jsp:forward page="main.jsp">
    <jsp:param name="succsess" value="Sikeres törlés!"/>
</jsp:forward>    