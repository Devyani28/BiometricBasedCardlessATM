

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class kycProcess
 */
@WebServlet("/kycProcess")
public class kycProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String OTPNum="";
	String PanNum = "";
	String phoneNum="";
	String AadharNum="";
	String AccountNum = "";
	String kycStatusMsg = "";
	String[] aadharInfo = new String[4];
	String[] bankInfo = new String[5];
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public kycProcess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		AadharNum = request.getParameter("aadhar");
		PanNum = request.getParameter("pan");
		
		
		try {
			if(isAadharNumValid(AadharNum))
			{
				phoneNum = getPhoneNum(AadharNum);
				OTPNum = com.otp.SendOTP.OTPmsg(phoneNum);
				response.setContentType("text/plain");  
				response.setCharacterEncoding("UTF-8"); 
				response.getWriter().write(phoneNum);
			}
			else {
				response.setContentType("text/plain");  
				response.setCharacterEncoding("UTF-8"); 
				response.getWriter().write("false");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private String getPhoneNum(String aadharNum) throws ClassNotFoundException, SQLException {
		
		JdbcConnection obj = new JdbcConnection();
		Connection conn = obj.getAadharConnection();
    	String sql = "SELECT * FROM `useraadhardata` WHERE AadharNum="+"'"+aadharNum+"'";
    	PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		return rs.getString("PhoneNo");
		
		
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
		
		Cookie[] cookie = request.getCookies();
		for(Cookie c:cookie) {
			if(c.getName().equals("userAccountNum"))
				AccountNum = c.getValue();
				
		}
		
		String OTPuserInput = firstNum.concat(secNum).concat(thirdNum).concat(forthNum).concat(fifthNum).concat(sixNum);
		
		if(OTPNum.equals(OTPuserInput)) {
			try {
				getAadharInfo();
				getBankInfo();
//				printbothinfo();
				if(isMatched())
				{
					addDataToAfterkycDB();
					response.sendRedirect("kycPage.jsp?kycStatus="+kycStatusMsg);
				}
				else
				{
					response.sendRedirect("kycPage.jsp?kycStatus="+kycStatusMsg);
				}
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		}else
			response.sendRedirect("IDProof.jsp");
		
	}
//
//	private void printbothinfo() {
//		// TODO Auto-generated method stub
//		for(int i=0;i<aadharInfo.length;i++)
//			System.out.print(aadharInfo[i]+" ");
//		
//		for(int i=0;i<bankInfo.length;i++)
//			System.out.print(bankInfo[i]+" ");
//	}

	private void addDataToAfterkycDB() throws Exception{
		String result="";
		JdbcConnection obj = new JdbcConnection();
		Connection conn = obj.getConnection();
		
    	String sql = "insert into afterkyc(`AccountNum`,`AccountHolder`,`DOB`,`Balance`,`Address`,`AadharNum`,`PanNum`,`MobileNo`,`Photo`) values(?,?,?,?,?,?,?,?,?)";
    	try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, AccountNum);
			ps.setString(2, aadharInfo[0]);
			ps.setString(3, aadharInfo[1]);
			ps.setString(4, bankInfo[3]);
			ps.setString(5, bankInfo[4]);
			ps.setString(6, AadharNum);
			ps.setString(7, PanNum);
			ps.setString(8, bankInfo[2]);
			ps.setString(9, aadharInfo[3]);
			
			ps.executeUpdate();
			result = "Data entered successfully";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result="Data Not Entered";
			e.printStackTrace();
		}
    	
		
	}

	private void getBankInfo() throws Exception{
	
		JdbcConnection obj = new JdbcConnection();
		Connection conn = obj.getConnection();
		String sql = "SELECT * FROM `beforekyc` WHERE AccountNum="+"'"+AccountNum+"'";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		bankInfo[0] = rs.getString("AccountHolder");
		bankInfo[1] = rs.getString("DOB");
		bankInfo[2] =  rs.getString("MobileNo");
		bankInfo[3] = rs.getString("Balance");
		bankInfo[4] =  rs.getString("Address");
	}

	private void getAadharInfo() throws Exception{
		// TODO Auto-generated method stub
		JdbcConnection obj = new JdbcConnection();
		Connection conn = obj.getAadharConnection();
		String sql = "SELECT * FROM `useraadhardata` WHERE AadharNum="+"'"+AadharNum+"'";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		
		aadharInfo[0]= rs.getString("Name");
		aadharInfo[1] =  rs.getString("DOB");
		aadharInfo[2] = rs.getString("PhoneNo");
		aadharInfo[3] = rs.getString("PhotoPath");
		
	}

	private boolean isMatched() {
		if(aadharInfo.length==0 || bankInfo.length==0)
			return false;
		
		if(aadharInfo[0].equals(bankInfo[0])) {
			if(aadharInfo[1].equals(bankInfo[1])) {
				if(aadharInfo[2].equals(bankInfo[2])) {
					kycStatusMsg = "Your KYC is Completed Thank You!";
					return true;
				}else {
					kycStatusMsg = "Aadhar PhoneNo and Account PhoneNo is not matched";
					return false;
				}
			}else {
				kycStatusMsg = "Aadhar DOB and Account DOB is not matched";
				return false;
			}
		}else {
			kycStatusMsg = "Aadhar name "+aadharInfo[0]+" and Account name "+bankInfo[0]+" is not matched";
			return false;
		}
	}

	private boolean isAadharNumValid(String aadharNum) throws ClassNotFoundException, SQLException {
		JdbcConnection obj = new JdbcConnection();
		Connection conn = obj.getAadharConnection();
    	String sql = "SELECT * FROM `useraadhardata` WHERE AadharNum="+"'"+aadharNum+"'";
    	PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		boolean status=rs.next();
		return status;
	}

}
