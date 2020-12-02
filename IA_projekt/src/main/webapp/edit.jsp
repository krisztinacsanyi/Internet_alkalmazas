<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : delete
    Created on : 2020.11.30., 19:22:18
    Author     : filjan
--%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    if(session.getAttribute("validuser")==null){
        %>
        <jsp:forward page="login.jsp">
            <jsp:param name="errorMsg" value="Kérjük jelentkezzen be!"/>
        </jsp:forward>
<%   } 
%>
<sql:setDataSource 
    var="posts"
    driver="org.apache.derby.jdbc.ClientDriver"
    url="jdbc:derby://localhost:1527/intalk"
    user="intalk"
    password="ckfjsa"
    scope="session" />

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="style.css">
</head>

            


<body>
    <div class="header">
        <div class="userbox">
            Üdvözöljük, <span><%=session.getAttribute("validuser") %>!</span>            
        </div>
        <div class="button">
            <a href="new.jsp">Új post létrehozása</a>
        </div>
        <div class="succsessMsg">${param.succsess}</div>
        <div class="button">
            <a href="main.jsp">Vissza a főoldalra</a>
        </div> 
        <div class="button">
            <a href="logout.jsp">Kijelentkezés</a>
        </div>            
    </div>
    <h1>Recept szerkesztése</h1>
    <div class="recipebox">
        <div class="recipe">
            <div class="inner">
                <sql:query var="query" dataSource="${posts}">
                    SELECT * FROM POSTS
                    WHERE POST_ID = <%= request.getParameter("post_id")%>
                </sql:query>   
                <c:forEach var="post" items="${query.rows}">
                    <form action="checkedit.jsp" method="POST">
                        <div class="input">
                            <input type="hidden" name="post_id" value="<%=request.getParameter("post_id") %>">
                            <input type="text" name="title" id="title" value="<c:out value="${post.title}" />">
                        </div>
                        <h3>Szöveg:</h3>
                        <textarea name="description" id="description" rows="10">
                            <c:out value="${post.text}" />
                        </textarea>
                        <div class="errorMsg">${param.errorMsg}</div>
                        <div class="button bigger">
                            <input type="submit" value="Módosítások mentése" name="edit_submit"/>
                        </div>
                    </form>
                </c:forEach>
            </div>
        </div>
    </div>
</body>

</html>