<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Solicitar Cita Medica</title>
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
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 600px;
        }

        h1 {
            font-size: 36px;
            margin-bottom: 30px;
            color: #333; /* Azul derivado */
        }

        label {
            font-size: 20px;
            color: #4169E2; /* Azul derivado */
        }

        input[type="date"],
        input[type="text"],
        input[type="time"],
        input[type="submit"],
        #medicoContainer {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #4169E1; /* Azul derivado */
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            outline: none;
        }

        input[type="date"]:focus,
        input[type="text"]:focus,
        input[type="time"]:focus,
        input[type="submit"]:focus,
        #medicoContainer:focus {
            border-color: #0000; 
        }

        #medicoContainer {
            cursor: pointer;
            position: relative;
            background-color: #f9f9f9;
            transition: background-color 0.3s ease;
        }

        #medicoContainer:hover {
            background-color: #e9e9e9;
        }

        #listaMedicos {
            display: none;
            position: absolute;
            width: 100%;
            background-color: #fff;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        #listaMedicos div {
            padding: 12px;
            border-bottom: 1px solid #ccc;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        #listaMedicos div:hover {
            background-color: #f2f2f2;
        }

        input[type="submit"] {
            background-color: #4169E1; /* Azul derivado */
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #000080; /* Azul más oscuro */
        }

        #regresarForm {
            margin-top: 20px;
        }

        input[type="button"] {
           background-color: #4169E1; /* Azul derivado */
           color: white;
           border: none;
           cursor: pointer;
           padding: 12px 20px;
           font-size: 16px;
           border-radius: 5px;
           margin-top: 20px; /* Ajuste el margen superior */
    }

    input[type="button"]:hover {
        background-color: #000080; /* Azul más oscuro */
    }
    </style>
</head>
<body>
    <div id="container">
        <h1>Solicitar Cita Medica</h1>
        <form action="verificar_cedula.jsp" method="post">
            <label for="fecha">Fecha:</label>
            <input type="date" id="fecha" name="fecha" required><br><br>
            <label for="cedula">Cedula:</label>
            <input type="text" id="cedula" name="cedula" required><br><br>
            <label for="eligeMedico">Elige tu medico:</label>
            <div id="medicoContainer" onclick="mostrarMedicos()">
                <span id="medicoSeleccionado">Haz clic para elegir un medico</span>
                <div id="listaMedicos">
                    <% 
                    try {
                        if (conexion != null) {
                            PreparedStatement statement = conexion.prepareStatement("SELECT id_medico, nombre, apellido FROM medico");
                            ResultSet resultSet = statement.executeQuery();
                            while (resultSet.next()) {
                                int idMedico = resultSet.getInt("id_medico");
                                String nombreMedico = resultSet.getString("nombre") + " " + resultSet.getString("apellido");
                    %>
                    <div onclick="seleccionarMedico('<%= idMedico %>', '<%= nombreMedico %>')"><%= nombreMedico %></div>
                    <% 
                            }
                            resultSet.close();
                            statement.close();
                        } else {
                            out.println("Error: La conexión a la base de datos es nula.");
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("Error: No se pudieron obtener los médicos de la base de datos.");
                    }
                    %>
                </div>
            </div>
            <input type="hidden" id="medicoInput" name="medico">
            <label for="hora">Hora:</label>
            <input type="time" id="hora" name="hora" required><br><br>
            <input type="submit" value="Solicitar Cita Medica">
        </form>

        <form id="regresarForm" action="panel_cliente.jsp" method="get">
        <input type="button" value="Regresar" onclick="regresarPanelCliente()">
          </form>
    </div>

    <script>
        function mostrarMedicos() {
            document.getElementById("listaMedicos").style.display = "block";
        }

        function seleccionarMedico(idMedico, nombreMedico) {
            document.getElementById("medicoSeleccionado").textContent = nombreMedico;
            document.getElementById("medicoInput").value = idMedico;
            document.getElementById("listaMedicos").style.display = "none";
        }

        function regresarPanelCliente() {
            document.getElementById("regresarForm").submit();
        }
    </script>
</body>
</html>
