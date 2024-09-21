<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ include file="conexion.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
// Obtener la cédula del cliente desde la sesión
String cedulaCliente = (String) session.getAttribute("cedula");

// Obtener los nuevos datos del formulario
String nuevoCorreo = request.getParameter("correo");
String nuevaPoblacion = request.getParameter("poblacion");

// Verificar si se ha proporcionado una cédula válida
if (cedulaCliente != null && !cedulaCliente.isEmpty()) {
    try {
        // Verificar si la conexión a la base de datos es válida
        if (conexion != null) {
            // Actualizar los datos del cliente en la base de datos
            PreparedStatement actualizaCliente = conexion.prepareStatement("UPDATE cliente SET correo = ?, poblacion = ? WHERE cedula = ?");
            actualizaCliente.setString(1, nuevoCorreo);
            actualizaCliente.setString(2, nuevaPoblacion);
            actualizaCliente.setString(3, cedulaCliente);
            int filasActualizadas = actualizaCliente.executeUpdate();

            // Cerrar la conexión y el statement
            actualizaCliente.close();
            conexion.close();

            // Redirigir a actualizacion_datos_personales.jsp después de actualizar
            if (filasActualizadas > 0) {
                response.sendRedirect("actualizacion_datos_personales.jsp");
            } else {
                // Si no se actualizan correctamente, muestra un mensaje de error
                out.println("<script>alert('Error: No se pudieron actualizar los datos.'); window.location.href='actualizacion_datos_personales.jsp';</script>");
            }
        } else {
            // Si la conexión a la base de datos es nula, muestra un mensaje de error
            out.println("<script>alert('Error: La conexión a la base de datos es nula.'); window.location.href='actualizacion_datos_personales.jsp';</script>");
        }
    } catch (SQLException e) {
        // Si hay un error SQL, muestra un mensaje de error con el detalle del error
        out.println("<script>alert('Error: No se pudo actualizar los datos. Detalle del error: " + e.getMessage() + "'); window.location.href='actualizacion_datos_personales.jsp';</script>");
    }
} else {
    // Si no se proporciona una cédula válida, muestra un mensaje de error
    out.println("<script>alert('Error: No se proporcionó una cédula válida.'); window.location.href='actualizacion_datos_personales.jsp';</script>");
}
%>
