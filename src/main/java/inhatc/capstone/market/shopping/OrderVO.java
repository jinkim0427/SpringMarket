package inhatc.capstone.market.shopping;

public class OrderVO {
	private int od_number;
	private String id;
	private int mk_number;
	private String od_time;
	private String od_pickup;
	private String od_status;
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
}
