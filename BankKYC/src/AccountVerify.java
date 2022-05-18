

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;
import com.otp.SendOTP;

/**
 * Servlet implementation class AccountVerify
 */
@WebServlet("/AccountVerify")
public class AccountVerify extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String otpM ="";
	String AccountNum="";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountVerify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AccountNum =request.getParameter("user");
		 
		  SendOTP o = new SendOTP(); 
		  String userPhoneNum =null;
		  System.out.println(AccountNum);
//		  Map map=new HashMap();
		  boolean status=false;
			try {
				JdbcConnection obj = new JdbcConnection();
				Connection con = obj.getConnection();
				String sql = "SELECT * FROM `beforekyc` WHERE AccountNum = '"+AccountNum+"'";
				
				Statement statement = (Statement) con.createStatement();
				 
				ResultSet results = statement.executeQuery(sql);
				status=results.next();
				System.out.println(status);
				//if result.next is false means no data found
	    		userPhoneNum = results.getString(4);
	    		
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				
				System.out.println("Data Not Found");
				response.setContentType("text/plain");  
				  response.setCharacterEncoding("UTF-8"); 
				  response.getWriter().write("404");
			}
			

				 if(status) {
					 otpM = o.OTPmsg(userPhoneNum);
					  response.setContentType("text/plain");  
					  response.setCharacterEncoding("UTF-8"); 
					  response.getWriter().write(userPhoneNum);
				 }
			
		  
		
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String firstNum = request.getParameter("otpFstDigit");
		String secNum = request.getParameter("otpSecDigit");
		String thirdNum = request.getParameter("otpThrDigit");
		String forthNum = request.getParameter("otpFourDigit");
		String fifthNum = request.getParameter("otpFifthDigit");
		String sixNum = request.getParameter("otpSixDigit");
		System.out.println();
		
		String OTPuserInput = firstNum.concat(secNum).concat(thirdNum).concat(forthNum).concat(fifthNum).concat(sixNum);
		
		if(otpM.equals(OTPuserInput)) {
			
			HttpSession session = request.getSession();
			
			session.setAttribute("userAccountNum", AccountNum);
			
			response.sendRedirect("IDProof.jsp");
		}else
			response.sendRedirect("verification.jsp?status=failedOtp");
		
	}

}
