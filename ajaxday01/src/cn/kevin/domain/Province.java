package cn.kevin.domain;

public class Province {
	private String name;
	private String zipcode;
    public Province(){
	}
	public Province(String name, String zipcode) {
		super();
		this.name = name;
		this.zipcode = zipcode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
}
