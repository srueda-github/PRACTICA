<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
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
        // Verificar si la cedula ya existe en la base de datos
        PreparedStatement checkStatement = conexion.prepareStatement("SELECT COUNT(*) FROM cliente WHERE cedula = ?");
        checkStatement.setString(1, cedula);
        ResultSet resultSet = checkStatement.executeQuery();
        resultSet.next();
        int count = resultSet.getInt(1);
        resultSet.close();
        checkStatement.close();

        if (count > 0) {
            // Si la cedula ya existe, mostrar un mensaje de alerta
%>
            <script type="text/javascript">
                alert("La cédula ya existe en la base de datos.");
                window.location.href = "insertar.jsp"; // Redirigir al formulario de registro
            </script>
<%
        } else {
            // Si la cedula no existe, realizar la inserción
            PreparedStatement statement = conexion.prepareStatement("INSERT INTO cliente (cedula, nombres, apellidos, genero, correo, poblacion) VALUES (?, ?, ?, ?, ?, ?)");
            statement.setString(1, cedula);
            statement.setString(2, nombres);
            statement.setString(3, apellidos);
            statement.setString(4, genero);
            statement.setString(5, correo);
            statement.setString(6, poblacion);

            int filasInsertadas = statement.executeUpdate();
            statement.close();

            if (filasInsertadas > 0) {
                // La inserción fue exitosa
%>
                <script type="text/javascript">
                    alert("Registro exitoso");
                    window.location.href = "insertar.jsp"; // Redirigir al formulario de registro
                </script>
<%
            } else {
                // Ocurrió un error durante la inserción
%>
                <script type="text/javascript">
                    alert("Error en el registro. Por favor, inténtelo de nuevo.");
                    window.location.href = "insertar.jsp"; // Redirigir al formulario de registro
                </script>
<%
            }
        }
    } else {
        // La conexión a la base de datos es nula
%>
        <script type="text/javascript">
            alert("Error de conexión a la base de datos. Por favor, inténtelo de nuevo más tarde.");
            window.location.href = "insertar.jsp"; // Redirigir al formulario de registro
        </script>
<%
    }
} catch (SQLException e) {
    // Error de SQL
    e.printStackTrace();
%>
    <script type="text/javascript">
        alert("Error de SQL: <%= e.getMessage() %>");
        window.location.href = "insertar.jsp"; // Redirigir al formulario de registro
    </script>
<%
}
%>
