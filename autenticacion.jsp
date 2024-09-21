<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ include file="conexion.jsp" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

try {
    if (conexion != null) {
        PreparedStatement statement = conexion.prepareStatement("SELECT * FROM usuarios WHERE username = ? AND password = ?");
        statement.setString(1, username);
        statement.setString(2, password);
        ResultSet resultSet = statement.executeQuery();
        
        if (resultSet.next()) {
            String userType = resultSet.getString("tipo");
            HttpSession sessionObj = request.getSession();
            session.setAttribute("username", username);
            
            if ("administrador".equals(userType)) {
                response.sendRedirect("panel_admin.jsp");
            } else if ("usuario".equals(userType)) {
                response.sendRedirect("solicitar_cedula.jsp");
            }
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
        
        resultSet.close();
        statement.close();
    } else {
        out.println("Error: La conexión a la base de datos es nula.");
    }
} catch (SQLException e) {
    e.printStackTrace();
    out.println("Error: No se pudo autenticar al usuario.");
}
%>
