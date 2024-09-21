<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>

<%
String cedula = request.getParameter("cedula");
String nombres = request.getParameter("nombres");
String apellidos = request.getParameter("apellidos");
String genero = request.getParameter("genero");
String correo = request.getParameter("correo");
String poblacion = request.getParameter("poblacion");

try {
    if (conexion != null) {
        PreparedStatement statement = conexion.prepareStatement("UPDATE cliente SET nombres = ?, apellidos = ?, genero = ?, correo = ?, poblacion = ? WHERE cedula = ?");
        statement.setString(1, nombres);
        statement.setString(2, apellidos);
        statement.setString(3, genero);
        statement.setString(4, correo);
        statement.setString(5, poblacion);
        statement.setString(6, cedula);

        int filasActualizadas = statement.executeUpdate();
        if (filasActualizadas > 0) {
            response.sendRedirect("mostrar.jsp"); // Redirigir a la página principal
        } else {
            out.println("No se pudo actualizar el cliente.");
        }
        statement.close();
    } else {
        out.println("Error: La conexión a la base de datos es nula.");
    }
} catch (SQLException e) {
    e.printStackTrace();
    out.println("Error: No se pudo actualizar el cliente.");
}
%>
