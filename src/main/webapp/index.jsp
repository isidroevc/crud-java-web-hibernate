<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="com.isidroevc.hibernate.repository.AlumnoRepository"%>
<%@ page import="com.isidroevc.hibernate.entity.Alumno"%>
<%@ page import="com.isidroevc.artifacts.IAuthenticator"%>
<%@ page import="com.isidroevc.artifacts.HttpSessionAuthenticator"%>
<%
IAuthenticator authenticator = new HttpSessionAuthenticator();
if (!authenticator.hasAccess(request, response)) {
  response.sendRedirect("http://localhost:8080/crud-java-web-hibernate/login.jsp");
}
  AlumnoRepository alumnoRepository = new AlumnoRepository();
  List<Alumno> alumnos = alumnoRepository.listAllAlumnos();
  pageContext.setAttribute("alumnos", alumnos);
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Lista de alumnos</title>
  

  <br>
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

<body>
  <h1> Lista de alumnos </h1>
  <a href="./login">Logout</a>
  <div class="form-container" style="margin-top: 100px;">
    <form action="alumnos" method="POST">
      <label for="numeroDeControl">Número de control</label>
      <input type="text" name="numeroDeControl">
      <br>
      <label for="nombre">Nombre</label>
      <input type="text" name="nombre">
      <br>
      <label for="curso">Curso</label>
      <input type="text" name="curso">
      <br>
      <label for="semestre">Semestre</label>
      <input type="number" name="semestre">
      <input type="submit" value="Registrar">
      <br>
    </form>
  </div>
  <div>
    <table border="1px">
      <thead>
        <th>No. Control</th>
        <th>Nombre</th>
        <th>Curso</th>
        <th>Semestre</th>
      </thead>
      <tbody>
        <c:forEach items="${alumnos}" var="alumno">
          <tr>
            <td><c:out value="${alumno.numeroDeControl}"/></td>
            <td><c:out value="${alumno.nombre}"/></td> 
            <td><c:out value="${alumno.curso}"/></td>
            <td><c:out value="${alumno.semestre}"/></td>
            <td> <a href="edit.jsp?id=<c:out value="${alumno.id}"/>">Edit</a></td>  
            <td> <a href="delete?id=<c:out value="${alumno.id}"/>">Delete</a></td>  
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</body>
</html>