<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="com.isidroevc.hibernate.repository.LeadRepository"%>
<%@ page import="com.isidroevc.hibernate.entity.Lead"%>
<%
  LeadRepository leadRepository = new LeadRepository();
  String idText = request.getParameter("id");
  Lead lead = leadRepository.getLead(Long.parseLong(idText));
  pageContext.setAttribute("lead", lead);
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Leads Sheet</title>
  <h1> Leads List </h1>
  <div class="form-container">
    <form action="leads-update" method="POST">
      <input type="hidden" name="id" value="${lead.id}">
      <label for="firstName">First Name</label>
      <input type="text" value="${lead.firstName}" name="firstName">

      <label for="lastName">Last Name</label>
      <input type="text" value="${lead.lastName}" name="lastName">

      <label for="age">Age</label>
      <input type="number" value="${lead.age}"name="age">
      <input type="submit" value="Actualizar">
    </form>
  </div>
</head>
<div>
</div>
<body>
  
</body>
</html>