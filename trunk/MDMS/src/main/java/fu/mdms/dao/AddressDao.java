package fu.mdms.dao;

import java.util.List;

import fu.mdms.model.District;
import fu.mdms.model.Province;


public interface AddressDao {

	public List<Province> getAllProvinces();
	public List<District> getDistricts(String provinceID);
	public District getDistrict(String districtID);
}
