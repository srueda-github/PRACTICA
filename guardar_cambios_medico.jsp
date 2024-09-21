<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>

<%
String idMedico = request.getParameter("id_medico");
String nombre = request.getParameter("nombre");
String apellido = request.getParameter("apellido");
String especialidad = request.getParameter("especialidad");
String telefono = request.getParameter("telefono");
String correo = request.getParameter("correo");

try {
    if (conexion != null) {
        PreparedStatement statement = conexion.prepareStatement("UPDATE medico SET nombre=?, apellido=?, especialidad=?, telefono=?, correo=? WHERE id_medico=?");
        statement.setString(1, nombre);
        statement.setString(2, apellido);
        statement.setString(3, especialidad);
        statement.setString(4, telefono);
        statement.setString(5, correo);
        statement.setString(6, idMedico);

        int filasActualizadas = statement.executeUpdate();
        if (filasActualizadas > 0) {
            out.println("Cambios guardados exitosamente"); // Imprime el mensaje de éxito
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
