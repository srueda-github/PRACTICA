<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<%@ include file="conexion.jsp" %>

<%
String nombre = request.getParameter("nombre");
String apellido = request.getParameter("apellido");
String especialidad = request.getParameter("especialidad");
String telefono = request.getParameter("telefono");
String correo = request.getParameter("correo");

try {
    if (conexion != null) {
        // Preparar la consulta SQL para insertar un nuevo médico
        PreparedStatement statement = conexion.prepareStatement("INSERT INTO medico (nombre, apellido, especialidad, telefono, correo) VALUES (?, ?, ?, ?, ?)");
        
        // Establecer los parámetros de la consulta
        statement.setString(1, nombre);
        statement.setString(2, apellido);
        statement.setString(3, especialidad);
        statement.setString(4, telefono);
        statement.setString(5, correo);
        
        // Ejecutar la consulta
        int filasInsertadas = statement.executeUpdate();
        
        if (filasInsertadas > 0) {
            // La inserción fue exitosa
%>
            <script type="text/javascript">
                alert("Registro exitoso");
                window.location.href = "registro_medicos.jsp"; // Redirigir al formulario de registro de médicos
            </script>
<%
        } else {
            // Ocurrió un error durante la inserción
%>
            <script type="text/javascript">
                alert("Error en el registro. Por favor, inténtelo de nuevo.");
            </script>
<%
        }
        
        // Cerrar la conexión y el statement
        statement.close();
    } else {
        // La conexión a la base de datos es nula
%>
        <script type="text/javascript">
            alert("Error de conexión a la base de datos. Por favor, inténtelo de nuevo más tarde.");
        </script>
<%
    }
} catch (SQLException e) {
    // Error de SQL
    e.printStackTrace();
%>
    <script type="text/javascript">
        alert("Error de SQL. Por favor, inténtelo de nuevo.");
    </script>
<%
}
%>
