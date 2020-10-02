package inhatc.capstone.market.user;

public class UserVO {
	private String id;
	private String name;
	private String pwd;
	private String acc;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getAcc() {
		return acc;
	}
	public void setAcc(String acc) {
		this.acc = acc;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", name=" + name + ", pwd=" + pwd + ", acc=" + acc + "]";
	}
	
}
