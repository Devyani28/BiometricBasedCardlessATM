


import java.io.IOException;
import java.sql.*;
/**
 *
 * @author Deepak Gupta
 */
public class JdbcConnection {
    
    private String dburl = "jdbc:mysql://localhost:3306/aadhardata";
    private String dbuname = "root";
    private String dbPass = "";
    private String dbDriver = "com.mysql.jdbc.Driver";
    
    public void loadDriver(String driver) {
    	try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    public Connection getConnection(){
    	loadDriver(dbDriver);
        Connection conn = null;
        try{
            conn = DriverManager.getConnection(dburl,dbuname,dbPass);
            System.out.println("sucess");
        }catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }
    
    public String insert(Member member) throws IOException {
//    	loadDriver(dbDriver);
    	Connection con = getConnection();
    	String result = "Data entered successfully";
    	String sql = "insert into useraadhardata(`AadharNum`,`Name`,`Gender`,`DOB`,`PhoneNo`,`email`,`state`,`pincode`,`PhotoPath`) values(?,?,?,?,?,?,?,?,?)";
    	try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, member.getAadharNum());
			ps.setString(2, member.getName());
			ps.setString(3, member.getGender());
			ps.setString(4, member.getDob());
			ps.setString(5, member.getPhoneNum());
			ps.setString(6, member.getEmail());
			ps.setString(7, member.getState());
			ps.setString(8, member.getPincode());
			ps.setString(9, member.getPhotoName());
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result="Data Not Entered";
			e.printStackTrace();
		}
    	
		return result;
    	
    }
    
    
}
