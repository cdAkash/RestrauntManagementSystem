package foodDelv;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class chkpasswd
 */
@WebServlet("/chkpasswd")
public class chkpasswd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String username = request.getParameter("email");
		String passwd = request.getParameter("password");
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/minor_proj", "root", "Deathspree20#");
			Statement stm = conn.createStatement();
			String query = "select password from user_reg where ";
			query = query.concat("email = '"+username+"'");
			ResultSet rs = stm.executeQuery(query);
			if (rs.next()) {
				String up = rs.getString(1);
				if (up.equals(passwd)) {
					Cookie ck = new Cookie("name", username);
					ck.setMaxAge(60*60*12);
					response.addCookie(ck);
					response.sendRedirect("afterLogin.jsp");
				} else {
					response.sendRedirect("loginPage.html");
				}
			} else {
				response.sendRedirect("loginPage.html");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
