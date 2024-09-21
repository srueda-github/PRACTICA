<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Datos Ingresados</title>
    <link rel="stylesheet" type="text/css" href="style1.css">

</head>
<body>
    <h1>Datos Ingresados</h1>
    <table border="1">
        <thead>
            <tr>
                <th>id_cliente</th>
                <th>Cedula</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Genero</th>
                <th>Correo electronico</th>
                <th>Poblacion</th>
            </tr>
        </thead>
        <tbody>
            <% try {
                if (conexion != null) {
                    PreparedStatement statement = conexion.prepareStatement("SELECT id_cliente, cedula, nombres, apellidos, genero, correo, poblacion FROM cliente");
                    ResultSet resultSet = statement.executeQuery();
                    while(resultSet.next()) {
            %>
                        <tr>
                            <td><%= resultSet.getString("id_cliente") %></td>
                            <td><%= resultSet.getString("cedula") %></td>
                            <td><%= resultSet.getString("nombres") %></td>
                            <td><%= resultSet.getString("apellidos") %></td>
                            <td><%= resultSet.getString("genero") %></td>
                            <td><%= resultSet.getString("correo") %></td>
                            <td><%= resultSet.getString("poblacion") %></td>
                            <td class="opciones"><a href="editar.jsp?cedula=<%= resultSet.getString("cedula") %>">Editar</a></td>
                            <td class="opciones"><a href="eliminar.jsp?cedula=<%= resultSet.getString("cedula") %>">Eliminar</a></td>
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
                out.println("<tr><td colspan='6'>Error: No se pudieron obtener los datos de la base de datos.</td></tr>");
            }
            %>
        </tbody>
    </table>

    <br></br>
     <form action="index.html" method="post">
        <input type="submit" value="Volver al formulario">
    </form>
  
</body>
</html>
