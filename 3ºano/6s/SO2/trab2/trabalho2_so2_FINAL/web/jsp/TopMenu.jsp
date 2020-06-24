<%-- 
    Document   : topMenu
    Created on : Jun 15, 2019, 7:02:41 PM
    Author     : danas
--%>

<%@page import="usables.User"%>
<%@page language="java" contentType="text/html"%>
<!DOCTYPE html>

    <%
        User login = (User) session.getAttribute("login");
        
        %>
        
        <h1>Welcome <%=login.getUsername()%></h1>
        
        <form action="GoToPerfil">
            <input type="submit" value="Perfil" name="submit">
        </form>

