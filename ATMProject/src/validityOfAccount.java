

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.otp.SendOTP;

/**
 * Servlet implementation class validityOfAccount
 */
@WebServlet("/validityOfAccount")
public class validityOfAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String otp="";
	String accNo = "";
	String userPhoneNum = "";
	boolean status = false;
	boolean kycDone = false;
	int count=0;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public validityOfAccount() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		accNo=request.getParameter("accNo");
		System.out.println(accNo+" and count: "+count);
		
		
		
		//check here in before kyc
		status = checkAccountExists(accNo);
		
		boolean isAccountActive = checkAccountStatus(accNo);

			
			SendOTP o = new SendOTP();
			
			if(status) {
				//check here for kyc done or not
				kycDone = checkKycDone(accNo);
				if(kycDone) {
					if(isAccountActive) {
						System.out.println(!isAccountActive);
						response.setContentType("text/plain");  
						response.setCharacterEncoding("UTF-8"); 
						response.getWriter().write("AccountBlock");
					}else {
						
						otp = o.OTPmsg(userPhoneNum);
						response.setContentType("text/plain");  
						response.setCharacterEncoding("UTF-8"); 
						response.getWriter().write(userPhoneNum);
					}
					
				}else {
					response.setContentType("text/plain");  
					response.setCharacterEncoding("UTF-8"); 
					response.getWriter().write("kycKra");
				}
			}else {
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8"); 
				response.getWriter().write("404");
			}
		
		
		
	}

	private boolean checkAccountStatus(String accNo2) {
		// TODO Auto-generated method stub
		JdbcConnection obj = new JdbcConnection();
		Connection con = (Connection) obj.getConnection();
		
		String sql = "SELECT * FROM `beforekyc` WHERE AccountNum = '"+accNo+"'";

		try {
			
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
				System.out.println(rs.getString("isBlock"));
			if(rs.getString("isBlock").equals("1")) {
				
				return true;
			}
			else {
				System.out.println("try wala false"+rs.getString("isBlock"));
				return false;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Exception wala false");
			return false;
		}
		
	}

	private boolean checkKycDone(String accNo) {

		boolean kycCheck = false;
		try {
			JdbcConnection obj = new JdbcConnection();
			Connection con = (Connection) obj.getConnection();
			String sql = "SELECT * FROM `afterkyc` WHERE AccountNum = '"+accNo+"'";
			
			Statement statement = (Statement) con.createStatement();
			 
			ResultSet results = statement.executeQuery(sql);
			kycCheck = results.next();
//			System.out.println("kyc done h bhai" + status);
			//if result.next is false means no data found
    		userPhoneNum = results.getString("MobileNo");
    		System.out.println(userPhoneNum + " ye num h");
    		
    		return kycCheck;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			System.out.println("kyc krra phle");
			return false;
			/*
			 * response.setContentType("text/plain");
			 * response.setCharacterEncoding("UTF-8"); response.getWriter().write("404");
			 */
		}
		
	}

	private boolean checkAccountExists(String accNo) {

		boolean acountFound = false;
		try {
			JdbcConnection obj = new JdbcConnection();
			Connection con = (Connection) obj.getConnection();
			
			
			
			String sql = "SELECT * FROM `beforekyc` WHERE AccountNum = '"+accNo+"'";
			
			Statement statement = (Statement) con.createStatement();
			 
			ResultSet results = statement.executeQuery(sql);
			acountFound = results.next();
			System.out.println("bhai aacount mil gya");
			
    		
    		return acountFound;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			System.out.println("bhai aacount hi nhii h tera to");
			return false;
			/*
			 * response.setContentType("text/plain");
			 * response.setCharacterEncoding("UTF-8"); response.getWriter().write("404");
			 */
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		count++;
		String firstNum = request.getParameter("otpFstDigit");
		String secNum = request.getParameter("otpSecDigit");
		String thirdNum = request.getParameter("otpThrDigit");
		String forthNum = request.getParameter("otpFourDigit");
		String fifthNum = request.getParameter("otpFifthDigit");
		String sixNum = request.getParameter("otpSixDigit");
		
		
		String OTPuserInput = firstNum.concat(secNum).concat(thirdNum).concat(forthNum).concat(fifthNum).concat(sixNum);
		
		if(otp.equals(OTPuserInput)) {
			HttpSession session = request.getSession();
			
			session.setAttribute("userAccountNum", accNo);
						
			response.sendRedirect("faceAuth.jsp");
		}else {
			if(count<2) {
				response.sendRedirect("/ATMProject/index.jsp?status=failedOtp");
				System.out.println("count: "+count);
			}else {
				response.sendRedirect("/ATMProject/index.jsp?status=2");
				accountBlock(accNo);
			}
		}
			
		
	}

	private void accountBlock(String accNo2) {
		
		JdbcConnection obj = new JdbcConnection();
		Connection con = (Connection) obj.getConnection();
		
		String sql = "update `beforekyc` set isBlock = ? WHERE AccountNum= ?";
		try {
			
			
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "1");
			ps.setString(2, accNo2);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("yhaa problem h accountBlock method m");
		}
		
	}

}
