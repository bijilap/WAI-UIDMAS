package wai.api.logoutFromApi;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.connectToDb;

/**
 * Servlet implementation class LogoutFromApi
 */
public class LogoutFromApi extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Connection con ;
	private static connectToDb cToDb ;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LogoutFromApi() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		cToDb = new connectToDb();
		con = cToDb.dbconnect();
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		if(con!=null){
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String loggedOut = "Logged Out succesfully";
		if (session.getAttribute("APIUsername") == null) {
			loggedOut = "No one is logged in";
		} else {
			session.removeAttribute("APIUsername");
		}
		Date currentDate = new Date();
		Timestamp currentTimestamp = new Timestamp(currentDate.getTime());
		try {			
			String hostAddress = request.getRemoteAddr();
			String hostName = request.getRemoteHost();
			String loginTime = session.getAttribute("APIUserLoginTime")
					.toString();
			String queryForUsage = "UPDATE db2admin.API_USAGE SET LOGOUT_TIME=? where HOST_ADDRESS=? AND HOST_NAME=? AND LOGIN_TIME=?";
			PreparedStatement psForUsage = con.prepareStatement(queryForUsage);
			psForUsage.setTimestamp(1, currentTimestamp);
			psForUsage.setString(2, hostAddress);
			psForUsage.setString(3, hostName);
			psForUsage.setString(4, loginTime);
			psForUsage.executeUpdate();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		session.invalidate();
		response.getWriter().write(loggedOut);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
