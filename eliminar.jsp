<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Eliminar Clientes</title>
 
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
        <h1>Eliminar Clientes</h1>
        <% 
        String mensaje = null;
        String idCliente = request.getParameter("id_cliente");
        if (idCliente != null) {
            try {
                if (conexion != null) {
                    PreparedStatement statement = conexion.prepareStatement("DELETE FROM cliente WHERE id_cliente = ?");
                    statement.setString(1, idCliente);

                    int filasEliminadas = statement.executeUpdate();
                    if (filasEliminadas > 0) {
                        mensaje = "Cliente eliminado correctamente.";
                    } else {
                        mensaje = "No se pudo eliminar el cliente.";
                    }
                    statement.close();
                } else {
                    mensaje = "Error: La conexión a la base de datos es nula.";
                }
            } catch (SQLException e) {
                e.printStackTrace();
                mensaje = "Error: No se pudo eliminar el cliente.";
            }
        }
        %>
        <%-- Mostrar mensaje de alerta --%>
        <% if (mensaje != null) { %>
            <script type="text/javascript">
                alert("<%= mensaje %>");
                window.location.replace("eliminar.jsp"); // Redirige a la misma página
            </script>
        <% } %>
        
        <table>
            <tr>
                <th>ID Cliente</th>
                <th>Cedula</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Genero</th>
                <th>Correo</th>
                <th>Población</th>
                <th>Elige</th>
            </tr>
            <% 
            try {
                if (conexion != null) {
                    PreparedStatement statement = conexion.prepareStatement("SELECT * FROM cliente");
                    ResultSet resultSet = statement.executeQuery();
                    while (resultSet.next()) {
            %>
                        <tr>
                            <td><%= resultSet.getString("id_cliente") %></td>
                            <td><%= resultSet.getString("cedula") %></td>
                            <td><%= resultSet.getString("nombres") %></td>
                            <td><%= resultSet.getString("apellidos") %></td>
                            <td><%= resultSet.getString("genero") %></td>
                            <td><%= resultSet.getString("correo") %></td>
                            <td><%= resultSet.getString("poblacion") %></td>
                            <td>
                                <form action="eliminar.jsp" method="post">
                                    <input type="hidden" name="id_cliente" value="<%= resultSet.getString("id_cliente") %>">
                                    <input type="submit" value="Eliminar" class="edit-button">
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
        </table>

        <form id="regresarForm" action="panel_admin.jsp" method="get">
            <input type="button" value="Regresar" onclick="regresarPanelAdmin()" class="edit-button">
        </form>
    </div>

    <script>
        function regresarPanelAdmin() {
            document.getElementById("regresarForm").submit();
        }
    </script>
</body>
</html>
