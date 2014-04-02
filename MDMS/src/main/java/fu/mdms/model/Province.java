package fu.mdms.model;

import java.util.Set;

public class Province {
	private String provinceId;
	private Set<District> district;
	private String provinceName;
	private String provinceType;
	public Province() {
		super();
	}
	public Province(String provinceId, Set<District> district,
			String provinceName, String provinceType) {
		super();
		this.provinceId = provinceId;
		this.district = district;
		this.provinceName = provinceName;
		this.provinceType = provinceType;
	}
	public String getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(String provinceId) {
		this.provinceId = provinceId;
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
