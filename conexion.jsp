<%@ page import="java.sql.*" %>

<%
String url ="jdbc:mysql://localhost:3306/eps";
String usuario = "root";
String contrasenia = "12345";
Connection conexion = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conexion = DriverManager.getConnection(url, usuario, contrasenia);
    session.setAttribute("conexion", conexion);
    
    // Mensaje de confirmación si la conexión se establece con exito
    //out.println("Conexión establecida correctamente.");
} catch(ClassNotFoundException e){
    out.println("Error: No se encontró el controlador JDBC.");
    e.printStackTrace();
} catch(SQLException e){
    out.println("Error: No se pudo conectar a la base de datos.");
    e.printStackTrace();
} catch(Exception e){
    out.println("Error inesperado.");
    e.printStackTrace();
}
%>
