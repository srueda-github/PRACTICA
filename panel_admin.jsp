<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Control - Administrador</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-image: url('https://i.pinimg.com/550x/01/0e/cb/010ecb0ed85d0418cd93bb84e5aee23f.jpg');
            background-size: cover; /* Para ajustar la imagen de fondo al tamaño de la ventana */
            font-family: 'Montserrat', sans-serif; /* Cambio de fuente */
            text-align: center;
            margin: 0;
            padding: 0;
            overflow-x: hidden; /* Para evitar que la imagen de fondo se duplique horizontalmente */
        }

        h1 {
            margin-top: 50px; /* Espacio superior */
            font-size: 36px; /* Tamaño de fuente más grande */
        }

        .bienvenida {
            margin-top: 20px; /* Espacio superior */
            font-size: 24px; /* Tamaño de fuente más grande */
        }

        #container {
            background-color: rgba(255, 255, 255, 0.7); /* Fondo blanco semi-transparente */
            border: 2px solid #ccc; /* Borde sólido */
            border-radius: 20px; /* Bordes redondeados */
            padding: 20px; /* Espacio interno */
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.3); /* Sombra */
            max-width: 800px; /* Ancho máximo del contenedor */
            margin: 50px auto; /* Centrar horizontalmente */
        }

        ul {
            list-style-type: none;
            padding: 0;
            margin-top: 20px; /* Espacio superior */
        }

        li {
            padding: 20px; /* Aumentar el espacio alrededor de los elementos */
            border-bottom: 1px solid #ccc;
            transition: all 0.3s ease; /* Transición suave al pasar el mouse */
            cursor: pointer;
        }

        li:last-child {
            border-bottom: none;
        }

        a {
            text-decoration: none;
            color: #333;
            font-size: 20px; /* Tamaño de fuente para las opciones */
            display: block; /* Para ocupar todo el ancho disponible */
        }

        a:hover {
            background-color: #f2f2f2;
            transform: scale(1.1); /* Aumentar el tamaño al pasar el mouse */
        }

        #regresarForm {
            margin-top: 20px; /* Espacio superior */
        }

        input[type="button"] {
            background-color: #4CAF50; /* Color de fondo */
            color: white; /* Color de texto */
            padding: 15px 25px; /* Tamaño del botón */
            border: none; /* Borde */
            border-radius: 8px; /* Bordes redondeados */
            cursor: pointer; /* Cursor al pasar el mouse */
            font-size: 16px; /* Tamaño de fuente */
            transition: all 0.3s ease; /* Transición suave */
        }

        input[type="button"]:hover {
            background-color: #45a049; /* Cambio de color al pasar el mouse */
        }
    </style>
</head>
<body>
    <div id="container">
        <h1>Panel de Control - Administrador</h1>
        <p class="bienvenida">Bienvenido</p>
        <p class="bienvenida">Por favor, selecciona una opcion:</p>
        <ul>
            <li><a href="registro_medicos.jsp">Registrar Medico</a></li>
            <li><a href="editar_medicos.jsp">Editar Medico</a></li>
            <li><a href="eliminar_medicos.jsp">Eliminar Medico</a></li>
            <li><a href="mostrar_medicos.jsp">Mostrar Medicos Registrados</a></li>
            <li><a href="insertar.jsp">Registrar Cliente</a></li>
            <li><a href="editar.jsp">Editar Cliente</a></li>
            <li><a href="eliminar.jsp">Eliminar Cliente</a></li>
            <li><a href="mostrar_clientes.jsp">Mostrar Clientes Registrados</a></li>
        </ul>

        <form id="regresarForm" action="index.html" method="get">
            <input type="button" value="Salir" onclick="regresarIndex()">
        </form>
    </div>

    <script>
        function regresarIndex() {
            document.getElementById("regresarForm").submit();
        }
    </script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
