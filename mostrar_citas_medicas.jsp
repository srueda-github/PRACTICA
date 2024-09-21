<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Citas Médicas</title>
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
        <h1>Citas Médicas Solicitadas</h1>
        <table>
            <tr>
                <th>ID Cita</th>
                <th>Fecha</th>
                <th>Hora</th>
                <th>Médico</th>
                <th>Estado</th>
            </tr>
            <%
            try {
                if (conexion != null) {
                    PreparedStatement statement = conexion.prepareStatement("SELECT * FROM citas_medica");
                    ResultSet resultSet = statement.executeQuery();
                    while(resultSet.next()) {
                        int idCita = resultSet.getInt("id_cita");
                        String fecha = resultSet.getString("fecha");
                        String hora = resultSet.getString("hora");
                        String medico = resultSet.getString("medico");
                        String estado = resultSet.getString("estado");
            %>
                        <tr>
                            <td><%= idCita %></td>
                            <td><%= fecha %></td>
                            <td><%= hora %></td>
                            <td><%= medico %></td>
                            <td><%= estado %></td>
                        </tr>
            <%
                    }
                    resultSet.close();
                    statement.close();
                } else {
                    out.println("<tr><td colspan='5'>Error: La conexión a la base de datos es nula.</td></tr>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<tr><td colspan='5'>Error: No se pudieron obtener los datos de las citas médicas.</td></tr>");
            }
            %>
        </table>
    </div>
    <div class="text-center mt-4">
            <input type="button" value="Regresar" class="btn btn-primary" onclick="regresarPanelCliente()">
        </div>
    </div>

    <form id="regresarForm" action="panel_cliente.jsp" method="get"></form>

    <script>
        function regresarPanelCliente() {
            document.getElementById("regresarForm").submit();
        }
    </script>

</body>
</html>
