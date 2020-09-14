<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="com.isidroevc.hibernate.repository.LeadRepository"%>
<%@ page import="com.isidroevc.hibernate.entity.Lead"%>
<%
  LeadRepository leadRepository = new LeadRepository();
  List<Lead> leads = leadRepository.listAllLeads();
    pageContext.setAttribute("leads", leads);
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Leads Sheet</title>
  <h1> Leads List </h1>
  <div class="form-container">
    <form action="leads" method="POST">
      <label for="firstName">First Name</label>
      <input type="text" name="firstName">

      <label for="lastName">Last Name</label>
      <input type="text" name="lastName">

      <label for="age">Age</label>
      <input type="number" name="age">
      <input type="submit" value="Registrar">
    </form>
  </div>
  <style>
    td { 
    padding: 10px;
  }

  table { 
    border-spacing: 10px;
    border-collapse: separate;
}
  </style>
</head>
<div>
  <table border="1px">
    <thead>
      <th>ID</th>
      <th>First Name</th>
      <th>Last Name</th>
      <th>Age</th>
    </thead>
    <tbody>
      <c:forEach items="${leads}" var="lead">
        <tr>
          <td><c:out value="${lead.id}"/></td>
          <td><c:out value="${lead.firstName}"/></td> 
          <td><c:out value="${lead.lastName}"/></td>
          <td><c:out value="${lead.age}"/></td>
          <td> <a href="edit.jsp?id=<c:out value="${lead.id}"/>">Edit</a></td>  
          <td> <a href="delete?id=<c:out value="${lead.id}"/>">Delete</a></td>  
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
<body>
  
</body>
</html>