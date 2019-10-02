<%-- 
    Document   : logout
    Created on : Nov 27, 2018, 9:20:41 PM
    Author     : mark_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
session.invalidate();
response.sendRedirect("../index.jsp");
%>

