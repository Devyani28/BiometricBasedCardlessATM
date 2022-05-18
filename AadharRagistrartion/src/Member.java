

/**
 *
 * @author Deepak Gupta
 */
public class Member {

    public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	
	public String getAadharNum() {
		return AadharNum;
	}
	public void setAadharNum(String AadharNum) {
		this.AadharNum = AadharNum;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public Member() {
		super();
	}
	private String name, gender, dob, phoneNum, email, state, pincode, AadharNum, photoName;
    public Member(String AadharNum,String name,String gender,String dob,String phoneNum,String email,String state,String pincode,String photoName){
        super();
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.phoneNum = phoneNum;
        this.email = email;
        this.state = state;
        this.pincode = pincode;
        this.AadharNum=AadharNum;
        this.photoName=photoName;
    }
}
