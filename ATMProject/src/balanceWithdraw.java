

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class balanceWithdraw
 */
@WebServlet("/balanceWithdraw")
public class balanceWithdraw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public balanceWithdraw() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String a = session.getAttribute("userAccountNum").toString();
		System.out.println(a);
		
		String inputBal = request.getParameter("balInput");
		System.out.println(inputBal);
			
		String getCurrentBal = currentBal(a);
		String newBal = Integer.toString(Integer.valueOf(getCurrentBal) - Integer.valueOf(inputBal));
		
		boolean statusOfWithdraw = withDraw(newBal,a);
		if(statusOfWithdraw) {
			
			
			response.sendRedirect("transactionStatus.jsp?transactionStatus=success");
			
		}else {
			response.sendRedirect("transactionStatus.jsp?transactionStatus=failed");
		}
		
		
		
//		String userInputBalance = request.getParameter("bal");
//		System.out.println(userInputBalance);
	}

	private boolean withDraw(String newBal,String a) {
		try {
			JdbcConnection obj = new JdbcConnection();
			Connection con = (Connection) obj.getConnection();
			
			/* Connection con = new JdbcConnection().getConnection(); */
			
			String sql = "update `afterkyc` set balance = ? WHERE AccountNum= ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, newBal);
			ps.setString(2, a);
			ps.executeUpdate();
			
			String sql2 = "update `beforekyc` set balance = ? WHERE AccountNum= ?";
			PreparedStatement ps2 = con.prepareStatement(sql2);
			ps2.setString(1, newBal);
			ps2.setString(2, a);
			ps2.executeUpdate();
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		// TODO Auto-generated method stub
	}
	

	private String currentBal(String a) {
		// TODO Auto-generated method stub
		try {
			JdbcConnection obj = new JdbcConnection();
			Connection con = (Connection) obj.getConnection();
			
			/* Connection con = new JdbcConnection().getConnection(); */

			String sql = "select * from `afterkyc`  WHERE AccountNum=" + "'" + a + "'";

			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next() == false)
			{
				System.out.println("error h bhai");
				return null;
			}
			else{

				return rs.getString("balance");
			}
	} catch (Exception e) {
		e.printStackTrace();
		return null;
	}
		
		
		
	}
	
	

}
