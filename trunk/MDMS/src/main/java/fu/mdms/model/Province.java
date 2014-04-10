package fu.mdms.model;

import java.util.Set;

public class Province {
	private String provinceID;
	private Set<District> district;
	private String provinceName;
	private String provinceType;
	public Province() {
		super();
	}
	public Province(String provinceID, Set<District> district,
			String provinceName, String provinceType) {
		super();
		this.provinceID = provinceID;
		this.district = district;
		this.provinceName = provinceName;
		this.provinceType = provinceType;
	}
	public String getProvinceID() {
		return provinceID;
	}
	public void setProvinceID(String provinceID) {
		this.provinceID = provinceID;
	}
	public Set<District> getDistrict() {
		return district;
	}
	public void setDistrict(Set<District> district) {
		this.district = district;
	}
	public String getProvinceName() {
		return provinceName;
	}
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	public String getProvinceType() {
		return provinceType;
	}
	public void setProvinceType(String provinceType) {
		this.provinceType = provinceType;
	}
	
}
