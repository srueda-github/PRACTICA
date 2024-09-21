<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>

<%
String mensaje = null;

// Obtener los datos del formulario
String fecha = request.getParameter("fecha");
String cedula = request.getParameter("cedula");
String descripcion = request.getParameter("descripcion");

if (fecha != null && cedula != null && descripcion != null) {
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
                // Preparar la declaración SQL para insertar la solicitud de cita al laboratorio
                PreparedStatement statement = conexion.prepareStatement("INSERT INTO solicitud_lab (id_cliente, descripcion, fecha) VALUES (?, ?, ?)");
                statement.setInt(1, idCliente);
                statement.setString(2, descripcion);
                statement.setString(3, fecha);

                // Ejecutar la inserción y obtener el número de filas afectadas
                int filasInsertadas = statement.executeUpdate();
                if (filasInsertadas > 0) {
                    mensaje = "Solicitud de cita al laboratorio realizada correctamente.";
                } else {
                    mensaje = "Error: No se pudo realizar la solicitud de cita al laboratorio.";
                }
                statement.close();
            }
            verificaCedula.close();
        } else {
            mensaje = "Error: La conexión a la base de datos es nula.";
        }
    } catch (SQLException e) {
        e.printStackTrace();
        mensaje = "Error: No se pudo realizar la solicitud de cita al laboratorio. Detalle del error: " + e.getMessage();
    }
} else {
    mensaje = "Error: Debes seleccionar una fecha, ingresar una cédula y describir la solicitud para realizar la cita al laboratorio.";
}
%>

<script type="text/javascript">
    alert("<%= mensaje %>");
    window.location.href = "solicitar_cita_laboratorio.jsp"; // Redirige a la página de solicitud de cita al laboratorio
</script>
