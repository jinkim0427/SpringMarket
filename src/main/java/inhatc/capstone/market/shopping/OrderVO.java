package inhatc.capstone.market.shopping;

public class OrderVO {
	private int od_number;
	private String id;
	private int mk_number;
	private String od_time;
	private String od_pickup;
	private String od_status;
	//private String od_payment;
	private int od_totalpay;
	
	public int getOd_number() {
		return od_number;
	}
	public void setOd_number(int od_number) {
		this.od_number = od_number;
	}
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
	public String getOd_time() {
		return od_time;
	}
	public void setOd_time(String od_time) {
		this.od_time = od_time;
	}
	public String getOd_pickup() {
		return od_pickup;
	}
	public void setOd_pickup(String od_pickup) {
		this.od_pickup = od_pickup;
	}
	public String getOd_status() {
		return od_status;
	}
	public void setOd_status(String od_status) {
		this.od_status = od_status;
	}

	/*
	 * public String getOd_payment() { return od_payment; } public void
	 * setOd_payment(String od_payment) { this.od_payment = od_payment; }
	 */
	public int getOd_totalpay() {
		return od_totalpay;
	}
	public void setOd_totalpay(int od_totalpay) {
		this.od_totalpay = od_totalpay;
	}
}
