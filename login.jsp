<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
    
</head>
<body>
    <h1>Iniciar Sesión</h1>
    <form action="autenticacion.jsp" method="post">
        <label for="username">Usuario:</label>
        <input type="text" id="username" name="username" required><br><br>
        
        <label for="password">Contraseña:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <input type="submit" value="Iniciar Sesión">
        <input type="hidden" name="cedula" value="<%= request.getParameter("cedula") %>">
    </form>

    <!-- Script para mostrar mensaje de alerta y redirigir a index.html -->
    <% if (request.getParameter("error") != null && request.getParameter("error").equals("1")) { %>
    <script>
        alert("Usuario o contrasena incorrectos. Por favor, intentalo de nuevo o contacte con el Administrador.");
        window.location.href = "index.html";
    </script>
    <% } %>
</body>
</html>
