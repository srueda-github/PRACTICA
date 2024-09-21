<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Solicitar Cita Laboratorio</title>
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
            color: #555;
            font-size: 18px; /* Letra más grande */
        }

        input[type="date"],
        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px; /* Aumenta el padding */
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 18px; /* Letra más grande */
            outline: none;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div id="container">
        <h1>Solicitar Cita Laboratorio</h1>
        <form action="verificar_cedula_lab.jsp" method="post">
            <label for="fecha" style="color: #4169E1; font-size: 20px;">Fecha:</label> <!-- Cambia el color y el tamaño de la letra -->
            <input type="date" id="fecha" name="fecha" required><br><br>
            <label for="cedula" style="color: #4169E1; font-size: 20px;">Cedula:</label> <!-- Cambia el color y el tamaño de la letra -->
            <input type="text" id="cedula" name="cedula" required><br><br>
            <label for="descripcion" style="color: #4169E1; font-size: 20px;">Descripcion:</label><br> <!-- Cambia el color y el tamaño de la letra -->
            <textarea id="descripcion" name="descripcion" rows="4" cols="50" required></textarea><br><br>
            <input type="submit" value="Solicitar Cita Laboratorio">  
        </form>

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
