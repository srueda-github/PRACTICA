<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Solicitar Cédula</title>
    <style>
        body {
            font-family: 'Indie Flower', cursive; /* Tipo de letra creativo */
            background-image: url('https://www.unitecoprofesional.es/blog/wp-content/uploads/2021/09/como-hacer-una-historia-clinica.jpg'); /* Reemplaza 'tu-imagen-de-fondo.jpg' con la URL de tu imagen de fondo */
            background-size: cover; /* Evita que el fondo se repita o se muestre como collage */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        form {
            background-color: rgba(255, 255, 255, 0.9); /* Fondo del formulario con transparencia */
            padding: 40px; /* Aumenta el padding para hacer el formulario más grande */
            border-radius: 20px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px; /* Ancho máximo del formulario */
        }

        h1 {
            font-size: 36px;
            margin-bottom: 30px;
        }

        label {
            font-size: 20px;
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"] {
            padding: 10px;
            font-size: 16px;
            border-radius: 8px;
            border: 1px solid #ccc;
            width: 100%; /* Cambia el ancho al 100% para adaptarse al contenedor */
            margin-bottom: 20px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 15px 25px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%; /* Cambia el ancho al 100% para adaptarse al contenedor */
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form action="procesar_cedula.jsp" method="post">
        <h1>Confirme su cedula por favor</h1>
        <label for="cedula">Cedula:</label>
        <input type="text" id="cedula" name="cedula" required><br><br>
        <input type="submit" value="Enviar">
    </form>
</body>
</html>
