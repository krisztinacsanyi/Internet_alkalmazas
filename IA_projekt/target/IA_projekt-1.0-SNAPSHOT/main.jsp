<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
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
    var="users"
    driver="org.apache.derby.jdbc.ClientDriver"
    url="jdbc:derby://localhost:1527/intalk"
    user="intalk"
    password="ckfjsa"
    scope="session" />
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <%
      if(session.getAttribute("validuser")!=null){  
    %>    
    <div class="header">
        <div class="userbox">
            Üdvözöljük, <span><%=session.getAttribute("validuser") %>!</span>            
        </div>
        <div class="button">
            <a href="new.jsp">Új post létrehozása</a>
        </div>
        <div class="button">
            <a href="logout.jsp">Kijelentkezés</a>
        </div>            
    </div>
    <% } %>
<center><div class="succsessrow">${param.succsess}</div></center>
    <h1>Posztok</h1>    
    <sql:query var="post_list" dataSource="${users}">
        SELECT * FROM POSTS WHERE USERNAME='<%=session.getAttribute("validuser")%>'
    </sql:query>
        <div class="recipebox">
            <c:forEach var="post" items="${post_list.rows}">
                    <div class="recipe">
                        <div class="inner">                
                                <h2><c:out value="${post.title}" /></h2>
                                <p><c:out value="${post.text}" /></p>
                                <div class="button">
                                    <form action="edit.jsp">
                                        <input type="hidden" value="${post.post_id}" name="post_id">
                                        <input type="submit" name="${post.post_id}" value="Szerkesztés">
                                    </form>
                                    <form action="delete.jsp" method="POST">
                                        <input type="hidden" value="${post.post_id}" name="post_id">
                                        <input type="submit" name="${post.post_id}" value="Törlés">
                                    </form>
                            </div>
                        </div>
                     </div>
            </c:forEach>      
    </div>
</body>

</html>