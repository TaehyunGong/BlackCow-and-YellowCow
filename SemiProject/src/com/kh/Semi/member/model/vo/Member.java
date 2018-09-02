package com.kh.Semi.member.model.vo;

public class Member {
	
	private int member_No;
	private String member_Id;
	private String member_Pwd;
	private String member_Name;
	private String member_Nick;
	private String email;
	private String phone;
	private String tel;
	private String address;
	private String member_Type;
	private String login_Type;
	private String token;
	private String with_Check;
	private String farm_Name;
	private String farm_Size;
	private String farm_Address;
	
	public Member(){}
	
	public Member(int member_No, String member_Id, String member_Pwd, String member_Name, String member_Nick,
			String email, String phone, String tel, String address, String member_Type, String login_Type, String token,
			String with_Check, String farm_Name, String farm_Size, String farm_Address) {
		super();
		this.member_No = member_No;
		this.member_Id = member_Id;
		this.member_Pwd = member_Pwd;
		this.member_Name = member_Name;
		this.member_Nick = member_Nick;
		this.email = email;
		this.phone = phone;
		this.tel = tel;
		this.address = address;
		this.member_Type = member_Type;
		this.login_Type = login_Type;
		this.token = token;
		this.with_Check = with_Check;
		this.farm_Name = farm_Name;
		this.farm_Size = farm_Size;
		this.farm_Address = farm_Address;
	}

	@Override
	public String toString() {
		return "Member [member_No=" + member_No + ", member_Id=" + member_Id + ", member_Pwd=" + member_Pwd
				+ ", member_Name=" + member_Name + ", member_Nick=" + member_Nick + ", email=" + email + ", phone="
				+ phone + ", tel=" + tel + ", address=" + address + ", member_Type=" + member_Type + ", login_Type="
				+ login_Type + ", token=" + token + ", with_Check=" + with_Check + ", farm_Name=" + farm_Name
				+ ", farm_Size=" + farm_Size + ", farm_Address=" + farm_Address + "]";
	}

	public int getMember_No() {
		return member_No;
	}

	public void setMember_No(int member_No) {
		this.member_No = member_No;
	}

	public String getMember_Id() {
		return member_Id;
	}

	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}

	public String getMember_Pwd() {
		return member_Pwd;
	}

	public void setMember_Pwd(String member_Pwd) {
		this.member_Pwd = member_Pwd;
	}

	public String getMember_Name() {
		return member_Name;
	}

	public void setMember_Name(String member_Name) {
		this.member_Name = member_Name;
	}

	public String getMember_Nick() {
		return member_Nick;
	}

	public void setMember_Nick(String member_Nick) {
		this.member_Nick = member_Nick;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMember_Type() {
		return member_Type;
	}

	public void setMember_Type(String member_Type) {
		this.member_Type = member_Type;
	}

	public String getLogin_Type() {
		return login_Type;
	}

	public void setLogin_Type(String login_Type) {
		this.login_Type = login_Type;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getWith_Check() {
		return with_Check;
	}

	public void setWith_Check(String with_Check) {
		this.with_Check = with_Check;
	}

	public String getFarm_Name() {
		return farm_Name;
	}

	public void setFarm_Name(String farm_Name) {
		this.farm_Name = farm_Name;
	}

	public String getFarm_Size() {
		return farm_Size;
	}

	public void setFarm_Size(String farm_Size) {
		this.farm_Size = farm_Size;
	}

	public String getFarm_Address() {
		return farm_Address;
	}

	public void setFarm_Address(String farm_Address) {
		this.farm_Address = farm_Address;
	}
	
	
	
}
