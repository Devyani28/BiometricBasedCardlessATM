

import java.beans.XMLDecoder;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ragister
 */
@MultipartConfig
@WebServlet("/Ragister")
public class Ragister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ragister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		
		try {
			
			FileInputStream aadarFile = new FileInputStream(new File(request.getServletContext().getRealPath("/").replace("\\","/")+"aadhar.xml")); 
			XMLDecoder aadharXmlFile = new XMLDecoder(aadarFile);
			Member m = (Member) aadharXmlFile.readObject();
			aadharXmlFile.close();
			aadarFile.close();
			
			String name = m.getName();
			out.println("<h1>"+name+"</h1>");
			
					
			JdbcConnection jcon = new JdbcConnection();
			
			String result = jcon.insert(m);
			out.println(result);
//			File source = new File("");
//			File dis = new File("");
//			
//			FileUtils.copyDirectory(source,dis);
//			
			
			response.sendRedirect("AadharGentrate.jsp?name="+name);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
