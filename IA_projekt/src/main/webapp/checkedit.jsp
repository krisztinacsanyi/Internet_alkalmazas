<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- 
    Document   : checkedit
    Created on : 2020.12.02., 9:28:28
    Author     : filjan
--%>

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
<sql:setDataSource 
    var="update"
    driver="org.apache.derby.jdbc.ClientDriver"
    url="jdbc:derby://localhost:1527/intalk"
    user="intalk"
    password="ckfjsa"
    scope="page" />

<c:choose>
    <c:when test="${(empty param.title) || (empty param.description) }">
           <jsp:forward page="edit.jsp">
               <jsp:param name="errorMsg" value="Mindegyik mező kitöltése kötelező!"/>
           </jsp:forward>
    </c:when>
    <c:otherwise>
       <%
         String title=request.getParameter("title");
         String text=request.getParameter("description");
         String username=session.getAttribute("validuser").toString(); %>
         <sql:update var="query" dataSource="${update}">
             UPDATE POSTS
             SET TITLE = '<%=title %>', TEXT='<%=text %>'
             WHERE POST_ID = <%=request.getParameter("post_id") %>
         </sql:update>
         <jsp:forward page="main.jsp">
            <jsp:param name="succsess" value="A post szerkesztése sikeres!"/>
        </jsp:forward>    
    </c:otherwise>      
</c:choose>