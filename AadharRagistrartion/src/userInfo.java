

import java.beans.XMLEncoder;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class userInfo
 */
@WebServlet("/userInfo")
public class userInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		String uname = request.getParameter("uname");
		
		String aadharNum = generateRandom();
		System.out.println(aadharNum);
		
		
		String gender = request.getParameter("gender");
		String dob = request.getParameter("dob");
		String phoneNum = request.getParameter("phoneNum");
		String uEmail = request.getParameter("uemail");
		String pincode = request.getParameter("pincode");
		String state = request.getParameter("state");
		Member member = new Member(aadharNum,uname,gender,dob,phoneNum,uEmail,state,pincode,uname+".png");
		try {
			FileOutputStream aadarFile = new FileOutputStream(new File(request.getServletContext().getRealPath("/").replace("\\","/")+"aadhar.xml")); 
			XMLEncoder aadharXmlFile = new XMLEncoder(aadarFile);
			aadharXmlFile.writeObject(member);
			aadharXmlFile.close();
			aadarFile.close();
			System.out.println("Xml file genrated");
			/* response.sendRedirect("FaceCapture.jsp?name="+uname); */
			response.sendRedirect("opencv.jsp?name="+uname);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static String generateRandom() {
	    Random random = new Random();
	    StringBuilder sb = new StringBuilder();

	    // first not 0 digit
	    sb.append(random.nextInt(9) + 1);

	    // rest of 11 digits
	    for (int i = 0; i < 11; i++) {
	        sb.append(random.nextInt(10));
	    }

	    return sb.toString();
	}

}
