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
 * Servlet implementation class sgnupProf
 */
@WebServlet("/sgnupProf")
public class sgnupProf extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String name = request.getParameter("fname");
		String email = request.getParameter("email");
		String ph_no = request.getParameter("ph_num");
		String password = request.getParameter("passwd");
		String addr = request.getParameter("addr");
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/minor_proj", "root", "Deathspree20#");
			pstm = conn.prepareStatement("insert into user_reg values ('"+name+"', '"+email+"', '"+ph_no+"', '"+password+"', '"+addr+"')");
			pstm.executeUpdate();
			response.sendRedirect("loginPage.html");
		} catch(Exception e) {
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
