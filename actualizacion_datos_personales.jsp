<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ include file="conexion.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Actualizar Datos Personales</title>
    <style>
        body {
            font-family: 'Comic Sans MS', cursive, sans-serif;
            background-image: url("https://www.shutterstock.com/image-photo/doctor-talking-patient-filling-history-260nw-2311370465.jpg");
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
            max-width: 400px;
            width: 100%;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 6px;
            color: #4169E2; /* Cambia el color de la letra */
            font-size: 20px; /* Cambia el tamaño de la letra */
        }

        input[type="email"],
        input[type="text"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 10px; /* Aumenta el padding */
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 18px; /* Cambia el tamaño de la letra */
            outline: none;
        }

        input[type="email"]:focus,
        input[type="text"]:focus,
        input[type="date"]:focus,
        textarea:focus {
            border-color: #4169E1; /* Cambia el color del borde al enfocar */
        }

        input[type="submit"] {
            background-color: #4169E1; /* Cambia el color de fondo */
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #000080; /* Cambia el color de fondo al pasar el mouse */
        }

        input[type="button"] {
            background-color: #4169E1; /* Cambia el color de fondo */
            color: white;
            border: none;
            cursor: pointer;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 5px;
            margin-top: 20px; /* Ajusta el margen superior */
        }

        input[type="button"]:hover {
            background-color: #000080; /* Cambia el color de fondo al pasar el mouse */
        }
    </style>
</head>
<body>
    <div id="container">
        <h1>Actualizar Datos Personales</h1>

        <%-- Código para procesar la cédula --%>
        <%
        String mensaje = "";
        String cedula = (String) session.getAttribute("cedula"); // Obtener la cédula de la sesión

        // Obtener los valores actualizados de correo y población desde la solicitud
        String correoActualizado = request.getParameter("correo");
        String poblacionActualizada = request.getParameter("poblacion");

        // Verificar si la cédula se ha proporcionado
        if (cedula == null || cedula.isEmpty()) {
            mensaje = "Error: Debes ingresar una cédula.";
        }
        %>

        <!-- Mostrar mensaje de error o formulario de actualización -->
        <%= mensaje %>

        <%-- Mostrar el formulario de actualización si la cédula es válida --%>
        <% if (mensaje == null || mensaje.isEmpty()) { %>
            <form id="updateForm" action="actualizacion.jsp" method="post">
                <input type="hidden" name="cedula" value="<%= cedula %>"> <!-- Pasar la cédula como un campo oculto -->
                <label for="correo">Nuevo Correo:</label>
                <input type="email" id="correo" name="correo" value="<%= (correoActualizado != null) ? correoActualizado : "" %>" required><br><br>
                <label for="poblacion">Nueva Población:</label>
                <input type="text" id="poblacion" name="poblacion" value="<%= (poblacionActualizada != null) ? poblacionActualizada : "" %>" required><br><br>
                <input id="updateButton" type="submit" value="Actualizar">
            </form>
        <% } %>

        <!-- Script para mostrar la alerta después de enviar el formulario -->
        <script>
            // Función para mostrar la alerta después de enviar el formulario
            function mostrarAlerta() {
                alert("Datos actualizados correctamente.");
            }

            // Agregar un event listener para el evento submit del formulario
            document.getElementById("updateForm").addEventListener("submit", mostrarAlerta);
        </script>

        <form id="regresarForm" action="panel_cliente.jsp" method="get">
            <input type="button" value="Regresar" onclick="regresarPanelCliente()">
        </form>

        <script>
            function regresarPanelCliente() {
                document.getElementById("regresarForm").submit();
            }
        </script>
    </div>
</body>
</html>
