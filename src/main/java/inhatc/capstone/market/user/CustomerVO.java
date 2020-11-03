package inhatc.capstone.market.user;

public class CustomerVO {
	private String id;
	private int mk_number;
	private String address;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getMk_number() {
		return mk_number;
	}
	public void setMk_number(int mk_number) {
		this.mk_number = mk_number;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "CustomerVO [id=" + id + ", mk_number=" + mk_number + ", address=" + address + "]";
	}
	
	
}
