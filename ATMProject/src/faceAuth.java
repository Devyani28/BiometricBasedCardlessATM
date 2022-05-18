

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.net.ssl.SSLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

/**
 * Servlet implementation class faceAuth
 */
@WebServlet("/faceAuth")
public class faceAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static int CONNECT_TIME_OUT = 30000;
    private final static int READ_OUT_TIME = 50000;
    private static String boundaryString = getBoundary();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public faceAuth() {
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
		
		HttpSession session = request.getSession();
		
		String AccountNumUser = session.getAttribute("userAccountNum").toString();
		
		
		String nameImg = getimgName(AccountNumUser);
		String str = request.getParameter("ImageData");
		
        byte[] imagedata = DatatypeConverter.parseBase64Binary(str.substring(str.indexOf(",") + 1));
        BufferedImage bufferedImage = ImageIO.read(new ByteArrayInputStream(imagedata));
        ImageIO.write(bufferedImage, "png", new File("C:/Program Files/Apache Software Foundation/Tomcat 9.0_Tomcat9Temp/webapps/img/FaceAuth/"+nameImg));
     
		String imageInAadhar = "C:/Program Files/Apache Software Foundation/Tomcat 9.0_Tomcat9Temp/webapps/img/"+nameImg;

		String imageCapture = "C:/Program Files/Apache Software Foundation/Tomcat 9.0_Tomcat9Temp/webapps/img/FaceAuth/"+nameImg;
		
		boolean checkFace = faceCompare(imageInAadhar,imageCapture);
		
		if(checkFace) {
			response.sendRedirect("/ATMProject/mainMenu.jsp");
		}else {
			response.sendRedirect("/ATMProject/index.jsp?status=faceAuthFailed");
		}
	}

	private String getimgName(String accountNumUser) {
		// TODO Auto-generated method stub
		try {
			JdbcConnection obj = new JdbcConnection();
			Connection con = (Connection) obj.getConnection();
			
			/* Connection con = new JdbcConnection().getConnection(); */

			String sql = "select * from `afterkyc`  WHERE AccountNum=" + "'" + accountNumUser + "'";

			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next() == false)
			{
				System.out.println("error h bhai");
				return null;
			}
			else{

				return rs.getString("Photo");
			}
	} catch (Exception e) {
		e.printStackTrace();
		return null;
	}
		
	}

	private boolean faceCompare(String imageInAadhar, String imageCapture) {
		// TODO Auto-generated method stub
		File file = new File(imageInAadhar);
		File file1 = new File(imageCapture);
		byte[] buff = getBytesFromFile(file);
		byte[] buff1 = getBytesFromFile(file1);
		String url = "https://api-us.faceplusplus.com/facepp/v3/compare";
        HashMap<String, String> map = new HashMap<>();
        HashMap<String, byte[]> byteMap = new HashMap<>();
        map.put("api_key", "j677V-fL6mB9z_kYHkmYSDE7SHT69jdS");
        map.put("api_secret", "wrBGiJGyaGBcoeawulx-Ta6htzUJhAJc");
        byteMap.put("image_file1", buff);
        byteMap.put("image_file2", buff1);
        try{
            byte[] bacd = post(url, map, byteMap);
            String str = new String(bacd);
            double percentage = Double.parseDouble(str.substring(93, 99));
            System.out.println(str.substring(93, 99));
            if(percentage>80.00) {
            	System.out.println(str.substring(93, 99));
            	return true;
            }
           //{"request_id":"1652081166,8e7b64e9-832c-492d-aaaa-1297b3981c79","time_used":925,"confidence":73.251,"thresholds":{"1e-3":62.327,"1e-4":69.101,"1e-5":73.975},"faces1":[{"face_token":"ba795717894845478019cf640552ba23","face_rectangle":{"top":996,"left":724,"width":985,"height":985}}],"faces2":[{"face_token":"046452fb4924b82f623e168fd9298ca4","face_rectangle":{"top":1407,"left":883,"width":762,"height":762}}],"image_id1":"q7bS0BKPKiKedV2alaB6eQ==","image_id2":"+DEgEkkVWkpKjzyPI4sM8Q=="}
        }catch (Exception e) {
        	e.printStackTrace();
        	return false;
		}
        return false;
		
	}
	
	protected static byte[] post(String url, HashMap<String, String> map, HashMap<String, byte[]> fileMap) throws Exception {
        HttpURLConnection conne;
        URL url1 = new URL(url);
        conne = (HttpURLConnection) url1.openConnection();
        conne.setDoOutput(true);
        conne.setUseCaches(false);
        conne.setRequestMethod("POST");
        conne.setConnectTimeout(CONNECT_TIME_OUT);
        conne.setReadTimeout(READ_OUT_TIME);
        conne.setRequestProperty("accept", "*/*");
        conne.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundaryString);
        conne.setRequestProperty("connection", "Keep-Alive");
        conne.setRequestProperty("user-agent", "Mozilla/4.0 (compatible;MSIE 6.0;Windows NT 5.1;SV1)");
        DataOutputStream obos = new DataOutputStream(conne.getOutputStream());
        Iterator iter = map.entrySet().iterator();
        while(iter.hasNext()){
            Map.Entry<String, String> entry = (Map.Entry) iter.next();
            String key = entry.getKey();
            String value = entry.getValue();
            obos.writeBytes("--" + boundaryString + "\r\n");
            obos.writeBytes("Content-Disposition: form-data; name=\"" + key
                    + "\"\r\n");
            obos.writeBytes("\r\n");
            obos.writeBytes(value + "\r\n");
        }
        if(fileMap != null && fileMap.size() > 0){
            Iterator fileIter = fileMap.entrySet().iterator();
            while(fileIter.hasNext()){
                Map.Entry<String, byte[]> fileEntry = (Map.Entry<String, byte[]>) fileIter.next();
                obos.writeBytes("--" + boundaryString + "\r\n");
                obos.writeBytes("Content-Disposition: form-data; name=\"" + fileEntry.getKey()
                        + "\"; filename=\"" + encode(" ") + "\"\r\n");
                obos.writeBytes("\r\n");
                obos.write(fileEntry.getValue());
                obos.writeBytes("\r\n");
            }
        }
        obos.writeBytes("--" + boundaryString + "--" + "\r\n");
        obos.writeBytes("\r\n");
        obos.flush();
        obos.close();
        InputStream ins = null;
        int code = conne.getResponseCode();
        try{
            if(code == 200){
                ins = conne.getInputStream();
            }else{
                ins = conne.getErrorStream();
            }
        }catch (SSLException e){
            e.printStackTrace();
            return new byte[0];
        }
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        byte[] buff = new byte[4096];
        int len;
        while((len = ins.read(buff)) != -1){
            baos.write(buff, 0, len);
        }
        byte[] bytes = baos.toByteArray();
        ins.close();
        return bytes;
    }
    private static String getBoundary() {
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for(int i = 0; i < 32; ++i) {
            sb.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-".charAt(random.nextInt("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_".length())));
        }
        return sb.toString();
    }
    private static String encode(String value) throws Exception{
        return URLEncoder.encode(value, "UTF-8");
    }
    
    public static byte[] getBytesFromFile(File f) {
        if (f == null) {
            return null;
        }
        try {
            FileInputStream stream = new FileInputStream(f);
            ByteArrayOutputStream out = new ByteArrayOutputStream(1000);
            byte[] b = new byte[1000];
            int n;
            while ((n = stream.read(b)) != -1)
                out.write(b, 0, n);
            stream.close();
            out.close();
            return out.toByteArray();
        } catch (IOException e) {
        }
        return null;
    }

}
