package wai.api.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.connectToDb;

/**
 * Servlet implementation class LoginToWaiApi
 */
public class LoginToWaiApi extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Connection con;
	private static connectToDb cToDb;

	public LoginToWaiApi() {

	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		try {
			cToDb = new connectToDb();
			con = cToDb.dbconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException s) {
				// do nothing
				s.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();

		PrintWriter out = response.getWriter();
		boolean loginStatus = false;
		String loginSuccessful = "Logged in succesfully";
		String loginUnsuccessful = "Invalid Credentials";
		try {
			String query = "SELECT API_USERNAME FROM db2admin.API_LOGIN WHERE LCASE(API_USERNAME)=? AND API_PASSWORD=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, username.toLowerCase());
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				session = request.getSession();
				session.setAttribute("APIUsername", "true");
				loginStatus = true;
			}
		} catch (Exception e) {
			loginStatus = false;
			e.printStackTrace();
		}
		if (loginStatus == true) {

			String hostAddress = request.getRemoteAddr();
			String hostName = request.getRemoteHost();
			Date currentDate = new Date();
			Timestamp currentTimestamp = new Timestamp(currentDate.getTime());
			session.setAttribute("APIUserLoginTime", currentTimestamp);
			String sessionID = request.getSession().getId().toString();
			try {

				String queryForUsage = "INSERT INTO db2admin.API_USAGE (API_USERNAME , API_PASSWORD , "
						+ "HOST_ADDRESS , HOST_NAME , LOGIN_TIME , SESSION_ID ) "
						+ "VALUES (?,?,?,?,?,?)";
				PreparedStatement psForUsage = con
						.prepareStatement(queryForUsage);
				psForUsage.setString(1, username);
				psForUsage.setString(2, password);
				psForUsage.setString(3, hostAddress);
				psForUsage.setString(4, hostName);
				psForUsage.setTimestamp(5, currentTimestamp);
				psForUsage.setString(6, sessionID);
				psForUsage.executeUpdate();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

			out.write(loginSuccessful);
		} else {
			out.write(loginUnsuccessful);
		}
		out.close();
	}

}
