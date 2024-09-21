<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>

<%
String mensaje = null;

// Obtener los datos del formulario
String fecha = request.getParameter("fecha");
String hora = request.getParameter("hora");
String cedula = request.getParameter("cedula");
String idMedico = request.getParameter("medico");

if (fecha != null && hora != null && cedula != null && idMedico != null) {
    try {
        // Verificar si la conexión a la base de datos es válida
        if (conexion != null) {
            // Verificar si la cédula del cliente existe en la base de datos
            PreparedStatement verificaCedula = conexion.prepareStatement("SELECT id_cliente FROM cliente WHERE cedula = ?");
            verificaCedula.setString(1, cedula);
            ResultSet rs = verificaCedula.executeQuery();
            if (!rs.next()) {
                mensaje = "Error: La cédula proporcionada no corresponde a ningún cliente registrado.";
            } else {
                int idCliente = rs.getInt("id_cliente");
                // Preparar la declaración SQL para insertar la cita médica
                PreparedStatement statement = conexion.prepareStatement("INSERT INTO cita_medica (id_cliente, fecha, hora, id_medico) VALUES (?, ?, ?, ?)");
                statement.setInt(1, idCliente);
                statement.setString(2, fecha);
                statement.setString(3, hora); // Utiliza la hora obtenida del formulario
                statement.setString(4, idMedico);

                // Ejecutar la inserción y obtener el número de filas afectadas
                int filasInsertadas = statement.executeUpdate();
                if (filasInsertadas > 0) {
                    mensaje = "Cita médica solicitada correctamente.";
                } else {
                    mensaje = "Error: No se pudo solicitar la cita médica.";
                }
                statement.close();
            }
            verificaCedula.close();
        } else {
            mensaje = "Error: La conexión a la base de datos es nula.";
        }
    } catch (SQLException e) {
        e.printStackTrace();
        mensaje = "Error: No se pudo solicitar la cita médica. Detalle del error: " + e.getMessage();
    }
} else {
    mensaje = "Error: Debes seleccionar una fecha, ingresar una hora, una cédula y elegir un médico para solicitar la cita.";
}
%>

<% if (mensaje != null) { %>
    <script type="text/javascript">
        alert("<%= mensaje %>");
        window.location.href = "solicitar_cita_medica.jsp"; // Redirige a la página de solicitud de cita médica
    </script>
<% } %>
