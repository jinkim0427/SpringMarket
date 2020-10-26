package inhatc.capstone.market.shopping;

public class ShoppingCartVO {
	private String id;
	private int pd_number;
	private int sc_amount;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPd_number() {
		return pd_number;
	}
	public void setPd_number(int pd_number) {
		this.pd_number = pd_number;
	}
	public int getSc_amount() {
		return sc_amount;
	}
	public void setSc_amount(int sc_amount) {
		this.sc_amount = sc_amount;
	}
}
