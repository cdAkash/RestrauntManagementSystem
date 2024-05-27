package foodDelv;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class editProfile
 */
@WebServlet("/editProfile")
public class chngProf extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String username = request.getParameter("name");
		String ph_no = request.getParameter("ph_no");
		String address = request.getParameter("Address");
		String password = request.getParameter("password");
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/minor_proj", "root", "Deathspree20#");
			PreparedStatement pstm = conn.prepareStatement("update user_reg set name = '"+username+"', ph_no = '"+ph_no+"', password = '"+password+"', address = '"+address+"' where email = '"+email+"'");
//			response.getWriter().println(pstm);
			pstm.executeUpdate();
			response.sendRedirect("profile.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
