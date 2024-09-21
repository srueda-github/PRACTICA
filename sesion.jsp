<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*" %>

<%
// Obtener la sesión actual
HttpSession session = request.getSession(false);

if (session != null) {
    // Cerrar sesión
    session.invalidate();
    response.sendRedirect("login.jsp");
} else {
    out.println("No hay ninguna sesión activa.");
}
%>
