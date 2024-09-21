<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>

<%
String idCliente = request.getParameter("id_cliente");
String cedula = request.getParameter("cedula");
String nombres = request.getParameter("nombres");
String apellidos = request.getParameter("apellidos");
String genero = request.getParameter("genero");
String correo = request.getParameter("correo");
String poblacion = request.getParameter("poblacion");

try {
    if (conexion != null) {
        PreparedStatement statement = conexion.prepareStatement("UPDATE cliente SET cedula=?, nombres=?, apellidos=?, genero=?, correo=?, poblacion=? WHERE id_cliente=?");
        statement.setString(1, cedula);
        statement.setString(2, nombres);
        statement.setString(3, apellidos);
        statement.setString(4, genero);
        statement.setString(5, correo);
        statement.setString(6, poblacion);
        statement.setString(7, idCliente);

        int filasActualizadas = statement.executeUpdate();
        if (filasActualizadas > 0) {
            out.println("Cambios guardados exitosamente"); // Imprime el mensaje de éxito
            // Actualiza la página para mostrar los cambios
            out.println("<script>window.location.href = 'editar.jsp';</script>");
        } else {
            out.println("Error al guardar cambios. Inténtelo de nuevo."); // Imprime el mensaje de error
        }
        statement.close();
    } else {
        out.println("Error: La conexión a la base de datos es nula.");
    }
} catch (SQLException e) {
    e.printStackTrace();
    out.println("Error de SQL. Inténtelo de nuevo.");
}
%>
