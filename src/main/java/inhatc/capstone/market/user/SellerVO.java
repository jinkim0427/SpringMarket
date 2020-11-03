package inhatc.capstone.market.user;

public class SellerVO {
	private int seller_number;
	private String id;
	
	public int getSeller_number() {
		return seller_number;
	}
	public void setSeller_number(int seller_number) {
		this.seller_number = seller_number;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "SellerVO [seller_number=" + seller_number + ", id=" + id + "]";
	}
	
}
