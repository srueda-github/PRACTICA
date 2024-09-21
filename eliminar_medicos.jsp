<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Eliminar Médicos</title>
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
            max-width: 100%;
            width: 100%;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            margin-top: 20px;
            width: 100%;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        td {
            background-color: #f9f9f9;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
            padding: 8px 16px;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
            padding: 8px 16px;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div id="container" class="container-fluid">
        <h1>Eliminar Médicos</h1>

        <% 
        String mensaje = null;
        String idMedico = request.getParameter("id_medico");

        if (idMedico != null) {
            try {
                Integer.parseInt(idMedico); // Validar ID

                if (conexion != null) {
                    PreparedStatement statement = conexion.prepareStatement("DELETE FROM medico WHERE id_medico = ?");
                    statement.setString(1, idMedico);

                    int filasEliminadas = statement.executeUpdate();
                    if (filasEliminadas > 0) {
                        mensaje = "Médico eliminado correctamente.";
                    } else {
                        mensaje = "No se pudo eliminar el médico. ID no encontrado.";
                    }
                    statement.close();
                } else {
                    mensaje = "Error: La conexión a la base de datos es nula.";
                }
            } catch (NumberFormatException e) {
                mensaje = "Error: ID de médico inválido.";
            } catch (SQLException e) {
                e.printStackTrace();
                mensaje = "Error: No se pudo eliminar el médico.";
            }
        }
        %>

        <%-- Mostrar mensaje si hay alguno --%>
        <% if (mensaje != null) { %>
            <div class="alert alert-info" role="alert">
                <%= mensaje %>
            </div>
        <% } %>

        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead class="table-primary">
                    <tr>
                        <th>ID Médico</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Especialidad</th>
                        <th>Teléfono</th>
                        <th>Correo</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    try {
                        if (conexion != null) {
                            PreparedStatement statement = conexion.prepareStatement("SELECT * FROM medico");
                            ResultSet resultSet = statement.executeQuery();
                            while (resultSet.next()) {
                    %>
                                <tr>
                                    <td><%= resultSet.getString("id_medico") %></td>
                                    <td><%= resultSet.getString("nombre") %></td>
                                    <td><%= resultSet.getString("apellido") %></td>
                                    <td><%= resultSet.getString("especialidad") %></td>
                                    <td><%= resultSet.getString("telefono") %></td>
                                    <td><%= resultSet.getString("correo") %></td>
                                    <td>
                                        <form action="eliminar_medicos.jsp" method="post">
                                            <input type="hidden" name="id_medico" value="<%= resultSet.getString("id_medico") %>">
                                            <input type="submit" value="Eliminar" class="btn btn-danger">
                                        </form>
                                    </td>
                                </tr>
                    <% 
                            }
                            resultSet.close();
                            statement.close();
                        } else {
                            out.println("Error: La conexión a la base de datos es nula.");
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("Error: No se pudieron obtener los datos de la base de datos.");
                    }
                    %>
                </tbody>
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
