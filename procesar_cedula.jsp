<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ include file="conexion.jsp" %>

<%
String cedula = request.getParameter("cedula");

// Verificar si se proporcionó una cédula válida
if (cedula != null && !cedula.isEmpty()) {
    HttpSession sessionObj = request.getSession();
    sessionObj.setAttribute("cedula", cedula);
    response.sendRedirect("panel_cliente.jsp");
} else {
    // Redirigir con un mensaje de error si no se proporcionó una cédula válida
    response.sendRedirect("actualizacion_datos_personales.jsp?error=cédula");
}
%>
