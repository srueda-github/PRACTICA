<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<%@ include file="conexion.jsp" %>

<%
// Obtener los parámetros del formulario
String newUsername = request.getParameter("new_username");
String newPassword = request.getParameter("new_password");
String userType = request.getParameter("user_type");

try {
    // Verificar si la conexión a la base de datos es válida
    if (conexion != null) {
        // Preparar la consulta SQL para insertar el nuevo usuario
        PreparedStatement statement = conexion.prepareStatement("INSERT INTO usuarios (username, password, tipo) VALUES (?, ?, ?)");
        statement.setString(1, newUsername);
        statement.setString(2, newPassword);
        statement.setString(3, userType);

        // Ejecutar la consulta
        int filasInsertadas = statement.executeUpdate();
        statement.close();

        if (filasInsertadas > 0) {
            // Si se insertó correctamente, mostrar un mensaje de éxito
%>
            <script type="text/javascript">
                alert("Usuario registrado correctamente.");
                window.location.href = "index.html"; // 
            </script>
<%
        } else {
            // Si no se insertó correctamente, mostrar un mensaje de error
%>
            <script type="text/javascript">
                alert("Error al registrar usuario. Por favor, inténtelo de nuevo.");
                window.location.href = "insertar.jsp"; // Redirigir a la página de registro de clientes
            </script>
<%
        }
    } else {
        // Si la conexión a la base de datos es nula, mostrar un mensaje de error
%>
        <script type="text/javascript">
            alert("Error de conexión a la base de datos. Por favor, inténtelo de nuevo más tarde.");
            window.location.href = "insertar.jsp"; // Redirigir a la página de registro de clientes
        </script>
<%
    }
} catch (SQLException e) {
    // Si ocurre un error SQL, mostrar un mensaje de error
    e.printStackTrace();
%>
    <script type="text/javascript">
        alert("Error de SQL. Por favor, inténtelo de nuevo.");
        window.location.href = "insertar.jsp"; // Redirigir a la página de registro de clientes
    </script>
<%
}
%>
