<%-- 
    Document   : logout
    Created on : 2020.11.28., 19:03:16
    Author     : filjan
--%>

<%
  session.setAttribute("validuser", null);
%>
<jsp:forward page="login.jsp"/>