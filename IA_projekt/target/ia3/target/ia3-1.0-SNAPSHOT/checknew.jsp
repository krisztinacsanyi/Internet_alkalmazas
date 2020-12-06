<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<c:choose>
 <c:when test="${(empty param.title) || (empty param.description) }">
        <jsp:forward page="new.jsp">
            <jsp:param name="errorMsg" value="Mindegyik mező kitöltése kötelező!"/>
        </jsp:forward>
 </c:when>
<c:otherwise>
    <% //változók beállítása és az új post felvétele
      String title=request.getParameter("title");
      String text=request.getParameter("description");
      String username=session.getAttribute("validuser").toString(); %>
      
    <sql:update var="newUser" dataSource="${users}">
                            INSERT INTO POSTS (username, text, title)
                            VALUES ('<%=username %>', '<%=text %>', '<%=title %>')
    </sql:update>
    <jsp:forward page="main.jsp">
        <jsp:param name="succsess" value="A post létrehozása sikerült!"/>
    </jsp:forward>    

</c:otherwise>
</c:choose>                            
                            