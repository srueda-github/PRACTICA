<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Registro de Médicos</title>
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
            font-size: 18px;
        }

        input[type="text"],
        input[type="email"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #4169E1;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 18px;
            outline: none;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="submit"]:focus {
            border-color: #0000; 
        }

        input[type="submit"] {
            background-color: #4169E1;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #000080;
        }

        input[type="button"] {
           background-color: #4169E1;
           color: white;
           border: none;
           cursor: pointer;
           padding: 12px 20px;
           font-size: 16px;
           border-radius: 5px;
           margin-top: 20px;
        }

        input[type="button"]:hover {
            background-color: #000080;
        }
    </style>
</head>
<body>
    <div id="container">
        <h1>Registro de Medicos</h1>
        <form action="guardar_medico.jsp" method="post">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required><br><br>
            
            <label for="apellido">Apellido:</label>
            <input type="text" id="apellido" name="apellido" required><br><br>
            
            <label for="especialidad">Especialidad:</label>
            <input type="text" id="especialidad" name="especialidad" required><br><br>
            
            <label for="telefono">Telefono:</label>
            <input type="text" id="telefono" name="telefono" required><br><br>
            
            <label for="correo">Correo:</label>
            <input type="email" id="correo" name="correo" required><br><br>
            
            <input type="submit" value="Registrar">
        </form>

        <form id="regresarForm" action="panel_admin.jsp" method="get">
            <input type="button" value="Regresar" onclick="regresarPanelAdmin()">
        </form>
    </div>

    <script>
        function regresarPanelAdmin() {
            document.getElementById("regresarForm").submit();
        }
    </script>
    
</body>
</html>
