<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Mostrar Clientes Registrados</title>
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
            max-width: 80%;
            width: 100%;
            text-align: center;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            background-color: #f2f2f2;
            border: 1px solid #ddd;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
    <div id="container">
        <h1>Clientes Registrados</h1>
        <table>
            <tr>
                <th>Cedula</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Genero</th>
                <th>Correo</th>
                <th>Poblacion</th>
            </tr>
            <%
            try {
                if (conexion != null) {
                    PreparedStatement statement = conexion.prepareStatement("SELECT * FROM cliente");
                    ResultSet resultSet = statement.executeQuery();
                    while(resultSet.next()) {
                        String cedula = resultSet.getString("cedula");
                        String nombres = resultSet.getString("nombres");
                        String apellidos = resultSet.getString("apellidos");
                        String genero = resultSet.getString("genero");
                        String correo = resultSet.getString("correo");
                        String poblacion = resultSet.getString("poblacion");
            %>
                        <tr>
                            <td><%= cedula %></td>
                            <td><%= nombres %></td>
                            <td><%= apellidos %></td>
                            <td><%= genero %></td>
                            <td><%= correo %></td>
                            <td><%= poblacion %></td>
                        </tr>
            <%
                    }
                    resultSet.close();
                    statement.close();
                } else {
                    out.println("<tr><td colspan='6'>Error: La conexión a la base de datos es nula.</td></tr>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<tr><td colspan='6'>Error: No se pudieron obtener los datos de los clientes.</td></tr>");
            }
            %>
        </table>
    </div>
   <div class="text-center mt-4">
            <input type="button" value="Regresar" class="btn btn-primary" onclick="regresarPanelAdmin()">
        </div>
    </div>

    <form id="regresarForm" action="panel_admin.jsp" method="get"></form>

    <script>
        function regresarPanelAdmin() {
            document.getElementById("regresarForm").submit();
        }
    </script> 
</body>
</html>
