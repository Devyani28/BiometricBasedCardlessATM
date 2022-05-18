
import java.io.IOException;
import java.sql.*;
/**
 *
 * @author Deepak Gupta
 */
public class JdbcConnection {
    
    private String dburl = "jdbc:mysql://localhost:3306/bankdata";
    private String dbAdharurl = "jdbc:mysql://localhost:3306/aadhardata";
    private String dbuname = "root";
    private String dbPass = "";
    private String dbDriver = "com.mysql.jdbc.Driver";
    
    public void loadDriver() {
    	try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
    }
    public Connection getConnection(){
    	loadDriver();
        Connection conn = null;
        try{
            conn = DriverManager.getConnection(dburl,dbuname,dbPass);
            System.out.println("sucess");
        }catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }
    
    public Connection getAadharConnection(){
    	loadDriver();
        Connection conn = null;
        try{
            conn = DriverManager.getConnection(dbAdharurl,dbuname,dbPass);
            System.out.println("sucess");
        }catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }
    
    public String fetchMobileNum(String AccountNum) throws IOException, ClassNotFoundException {
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection con = getConnection();
    	String result = "Data entered successfully";
    	String sql = "SELECT * FROM `beforekyc` WHERE AccountNum="+"'"+AccountNum+"'";
    	
    	try {
    		PreparedStatement ps = con.prepareStatement(sql);
    		ResultSet rs = ps.executeQuery();
    		String r = rs.getString(4);
    		System.out.println(r);
			return r;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "No Data Found";
			
		}	
    }
}
