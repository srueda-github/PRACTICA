<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Editar Médicos</title>
    <!-- Estilos CSS -->
    <style>
        body {
            font-family: 'Comic Sans MS', cursive, sans-serif;
            background-image: url("https://wallpapers.com/images/hd/medical-background-cjge7e89adg6ub8x.jpg");
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        #container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 80%; /* Ajustado al ancho del formulario de registro */
            width: 100%;
            text-align: center; /* Centrar el contenido */
        }

        h1 {
            text-align: center;
            color: ##333;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px; /* Añadido margen superior */
            background-color: #f2f2f2; /* Gris claro */
            border: 1px solid #ddd; /* Borde gris */
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #007bff; /* Azul */
            color: white;
        }

        tr:hover {
            background-color: #f5f5f5; /* Gris más claro al pasar el cursor */
        }

        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-top: 5px;
            margin-bottom: 5px;
        }

        .edit-button {
            background-color: #ff0000; /* Rojo */
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease;
}


        #regresarForm input[type="button"] {
            background-color: #007bff; /* Azul */
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        #regresarForm input[type="button"]:hover {
            background-color: #333; 
        }
    </style>
</head>
<body>
    <div id="container">
        <h1>Editar Medicos</h1>
        <table>
            <tr>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Especialidad</th>
                <th>Telefono</th>
                <th>Correo</th>
                <th>Edita</th>
            </tr>
            <%
            try {
                if (conexion != null) {
                    // Consulta SQL para obtener todos los médicos
                    PreparedStatement statement = conexion.prepareStatement("SELECT * FROM medico");
                    ResultSet resultSet = statement.executeQuery();

                    // Mostrar los datos de los médicos en la tabla para editar
                    while(resultSet.next()) {
                        String idMedico = resultSet.getString("id_medico");
                        String nombre = resultSet.getString("nombre");
                        String apellido = resultSet.getString("apellido");
                        String especialidad = resultSet.getString("especialidad");
                        String telefono = resultSet.getString("telefono");
                        String correo = resultSet.getString("correo");
            %>
                        <tr>
                            <td><input type="text" id="nombre_<%= idMedico %>" name="nombre" value="<%= nombre %>"></td>
                            <td><input type="text" id="apellido_<%= idMedico %>" name="apellido" value="<%= apellido %>"></td>
                            <td><input type="text" id="especialidad_<%= idMedico %>" name="especialidad" value="<%= especialidad %>"></td>
                            <td><input type="text" id="telefono_<%= idMedico %>" name="telefono" value="<%= telefono %>"></td>
                            <td><input type="email" id="correo_<%= idMedico %>" name="correo" value="<%= correo %>"></td>
                            <td><button class="edit-button" onclick="guardarCambios('<%= idMedico %>')">Guardar</button></td>
                        </tr>
            <%
                    }
                    // Cerrar la conexión y el statement
                    resultSet.close();
                    statement.close();
                } else {
                    out.println("<tr><td colspan='6'>Error: La conexión a la base de datos es nula.</td></tr>");
                }
            } catch (SQLException e) {
                // Error de SQL
                e.printStackTrace();
                out.println("<tr><td colspan='6'>Error: No se pudieron obtener los datos de los médicos.</td></tr>");
            }
            %>
        </table>
        <div id="mensaje"></div>

        <form id="regresarForm" action="panel_admin.jsp" method="get">
        <input type="button" value="Regresar" onclick="regresarPanelAdmin()">
    </form>
    </div>

    

    <script>
        function guardarCambios(idMedico) {
            var nombre = document.getElementById('nombre_' + idMedico).value;
            var apellido = document.getElementById('apellido_' + idMedico).value;
            var especialidad = document.getElementById('especialidad_' + idMedico).value;
            var telefono = document.getElementById('telefono_' + idMedico).value;
            var correo = document.getElementById('correo_' + idMedico).value;

            // Hacer una solicitud AJAX para guardar los cambios
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "guardar_cambios_medico.jsp", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById('mensaje').innerHTML = xhr.responseText;
                }
            }
            xhr.send("id_medico=" + idMedico + "&nombre=" + nombre + "&apellido=" + apellido + "&especialidad=" + especialidad + "&telefono=" + telefono + "&correo=" + correo);
        }

        function regresarPanelAdmin() {
            document.getElementById("regresarForm").submit();
        }
    </script>
</body>
</html>
