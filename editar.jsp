<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Editar Clientes</title>
 
    <style>
        body {
            font-family: 'Comic Sans MS', cursive, sans-serif;
            background-image: url("https://www.optime.it/wp-content/uploads/2020/03/medico-al-computer.png");
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
        <h1>Editar Clientes</h1>
        <table>
            <tr>
                <th>Cedula</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Genero</th>
                <th>Correo</th>
                <th>Poblacion</th>
                <th>Edita</th>
            </tr>
            <%
            try {
                if (conexion != null) {
                    PreparedStatement statement = conexion.prepareStatement("SELECT * FROM cliente");
                    ResultSet resultSet = statement.executeQuery();
                    while(resultSet.next()) {
                        String idCliente = resultSet.getString("id_cliente");
                        String cedula = resultSet.getString("cedula");
                        String nombres = resultSet.getString("nombres");
                        String apellidos = resultSet.getString("apellidos");
                        String genero = resultSet.getString("genero");
                        String correo = resultSet.getString("correo");
                        String poblacion = resultSet.getString("poblacion");
            %>
                        <tr>
                            <td><input type="text" id="cedula_<%= idCliente %>" name="cedula" value="<%= cedula %>"></td>
                            <td><input type="text" id="nombres_<%= idCliente %>" name="nombres" value="<%= nombres %>"></td>
                            <td><input type="text" id="apellidos_<%= idCliente %>" name="apellidos" value="<%= apellidos %>"></td>
                            <td><input type="text" id="genero_<%= idCliente %>" name="genero" value="<%= genero %>"></td>
                            <td><input type="email" id="correo_<%= idCliente %>" name="correo" value="<%= correo %>"></td>
                            <td><input type="text" id="poblacion_<%= idCliente %>" name="poblacion" value="<%= poblacion %>"></td>
                            <td><button class="edit-button" onclick="guardarCambios('<%= idCliente %>')">Guardar</button></td>
                        </tr>
            <%
                    }
                    resultSet.close();
                    statement.close();
                } else {
                    out.println("<tr><td colspan='7'>Error: La conexión a la base de datos es nula.</td></tr>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<tr><td colspan='7'>Error: No se pudieron obtener los datos de los clientes.</td></tr>");
            }
            %>
        </table>
        <div id="mensaje"></div>

        <form id="regresarForm" action="panel_admin.jsp" method="get">
            <input type="button" value="Regresar" onclick="regresarRegistroCliente()">
        </form>
    </div>

    <script>
        function guardarCambios(idCliente) {
            var cedula = document.getElementById('cedula_' + idCliente).value;
            var nombres = document.getElementById('nombres_' + idCliente).value;
            var apellidos = document.getElementById('apellidos_' + idCliente).value;
            var genero = document.getElementById('genero_' + idCliente).value;
            var correo = document.getElementById('correo_' + idCliente).value;
            var poblacion = document.getElementById('poblacion_' + idCliente).value;

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "guardar_cambios_cliente.jsp", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById('mensaje').innerHTML = xhr.responseText;
                }
            }
            xhr.send("id_cliente=" + idCliente + "&cedula=" + cedula + "&nombres=" + nombres + "&apellidos=" + apellidos + "&genero=" + genero + "&correo=" + correo + "&poblacion=" + poblacion);
        }

        function regresarRegistroCliente() {
            document.getElementById("regresarForm").submit();
        }
    </script>
</body>
</html>
