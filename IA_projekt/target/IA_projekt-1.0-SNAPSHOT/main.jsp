<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    Boolean user_posts=false;
    if(request.getParameter("filter_user")==null){ // alapértelmezetten az összes postot megjelenítjük
             user_posts=false;
    }else{ // ha rákattint a saját posztok megjelenítésére akkor a user_posts igaz
        user_posts=true;
    }
    if(session.getAttribute("validuser")==null){ // ha nincs bejelentkezve visszairányítjuk
        %>
        <jsp:forward page="login.jsp">
            <jsp:param name="errorMsg" value="Kérjük jelentkezzen be!"/>
        </jsp:forward>
<%   } %>
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
    <c:set var="current_user" value="<%=session.getAttribute("validuser")%>" />    
    <div class="header">
        <div class="userbox">
            Üdvözöljük, <span><%=session.getAttribute("validuser") %>!</span>            
        </div>
        <div class="button">
            <form action="main.jsp" method="POST">
                <input type="hidden" name="filter_user" value="igen">
                <input type="submit" name="filter_user_submit" value="Saját posztok" style="background-color: darkgreen !important;">
            </form>
            <form action="main.jsp" method="POST">
                <input type="hidden" name="filter_all" value="true">
                <input type="submit" name="filter_all_submit" value="Összes poszt" style="background-color: darkgreen !important;">
            </form>
        </div>
        <div class="button">
            <a href="new.jsp">Új post létrehozása</a>
        </div>
        <div class="button">
            <a href="logout.jsp">Kijelentkezés</a>
        </div>            
    </div>
    <% } %>
<center><div class="succsessrow">${param.succsess}</div></center> <!-- Bejelentkezett felhasználó megjelenítése --->
    <h1>Posztok</h1>
    <% if(user_posts){ // ha szűrjük a userekre akkor más az sql mint amikor nem szűrjük %>
    <sql:query var="post_list" dataSource="${users}">
        SELECT * FROM POSTS WHERE USERNAME='<%=session.getAttribute("validuser")%>'
    </sql:query>
    <% }else{ %>  
    <sql:query var="post_list" dataSource="${users}">
        SELECT * FROM POSTS WHERE 1=1
    </sql:query>
    <% } %>    
        <div class="recipebox">
            <c:forEach var="post" items="${post_list.rows}"> <!-- Végigmegyünk a lekérdezés eredményén -->
                    <div class="recipe">
                        <div class="inner">                
                                <h2><c:out value="${post.title}" /></h2>
                                <p><c:out value="${post.text}" /></p>
                                <c:if test="${current_user == post.username || current_user=='admin'}"> <!-- ha a user postolta
                                                                                                        vagy admin a felhasználó, megjelenítjük a szerkesztés és törlést -->                                
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
                                </c:if>
                        </div>
                     </div>
            </c:forEach>      
    </div>
</body>

</html>