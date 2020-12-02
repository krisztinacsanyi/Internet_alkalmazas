<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>JSP Page</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="header">
        <div class="userbox">
            Üdvözöljük, <span><!--Ide lehet írni a nevét--></span>
        </div>
        <div class="button">
            <a href="main.jsp">Vissza a főoldalra</a>
        </div> 
        <div class="button">
            <a href="logout.jsp">Kijelentkezés</a>
        </div>
    </div>
    <h1>Blogposzt szerkesztése</h1>

    <form action="checknew.jsp" method="POST">
    <div class="recipebox">
        <div class="recipe">
            <div class="inner">
                <div class="input">
                    <input type="text" name="title" id="title" placeholder="Cím">
                </div>
                <h3>Szöveg</h3>
                <textarea name="description" id="description" rows="10" placeholder="Írja ide a leírást">

                </textarea>
                <div class="errorMsg">${param.errorMsg}</div>
                <div class="button bigger">
                    <input type="submit" name="create_post" value="Létrehozás">
                </div>                
            </div>            
        </div>        
    </div>
    </form>
</body>

</html>