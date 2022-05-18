

import java.awt.image.BufferedImage;
import java.beans.XMLDecoder;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

/**
 * Servlet implementation class NewServlet
 */
@WebServlet("/NewServlet")
public class NewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = request.getParameter("ImageData");
		
		FileInputStream aadarFile = new FileInputStream(new File(request.getServletContext().getRealPath("/").replace("\\","/")+"aadhar.xml")); 
		XMLDecoder aadharXmlFile = new XMLDecoder(aadarFile);
		Member m = (Member) aadharXmlFile.readObject();
		aadharXmlFile.close();
		aadarFile.close();
		
		String name = m.getName();
		
        byte[] imagedata = DatatypeConverter.parseBase64Binary(str.substring(str.indexOf(",") + 1));
        BufferedImage bufferedImage = ImageIO.read(new ByteArrayInputStream(imagedata));
//        ImageIO.write(bufferedImage, "png", new File(request.getServletContext().getRealPath("/").replace("\\","/")+"/"+name+".png"));
        
        ImageIO.write(bufferedImage, "png", new File("C:/Program Files/Apache Software Foundation/Tomcat 9.0_Tomcat9Temp/webapps/img/"+name+".png"));
        
        response.sendRedirect("fingure.jsp");
	}

}
