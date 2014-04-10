package fu.mdms.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fu.mdms.dao.AddressDao;
import fu.mdms.dao.SupplierDao;
import fu.mdms.dao.impl.AddressDaoImpl;
import fu.mdms.dao.impl.SupplierDaoImpl;
import fu.mdms.model.Dealer;
import fu.mdms.model.District;
import fu.mdms.model.Province;
import fu.mdms.model.Supplier;
import fu.mdms.model.User;
import fu.mdms.model.UserRole;

@Controller
public class SupplierController {

	AddressDao addressDao = new AddressDaoImpl();
	SupplierDao supplierDao = new SupplierDaoImpl();

	@RequestMapping(value = "/store_listSupplier", method = RequestMethod.GET)
	public String store_listSupplier(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		List<Supplier> supplierList = supplierDao.getAllSupplier();
		model.addAttribute("supplierList", supplierList);
		return "store/store_listSupplier";
	}

	@RequestMapping(value = "/store_searchSupplier", method = RequestMethod.POST)
	public String store_searchSupplier(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		String supplierName = request.getParameter("supplierName");
		List<Supplier> supplierList = supplierDao.searchSupplier(supplierName);
		model.addAttribute("supplierList", supplierList);
		return "store/store_listSupplier";
	}

	@RequestMapping(value = "/store_createSupplier", method = RequestMethod.POST)
	public String store_createSupplier(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		List<Province> provinceList = addressDao.getAllProvinces();
		model.addAttribute("provinceList", provinceList);
		return "store/store_createSupplier";
	}

	@RequestMapping(value = "/store_viewSupplier", method = RequestMethod.GET)
	public String store_viewSupplier(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		int supplierID = Integer.parseInt(request.getParameter("supplierID"));
		Supplier supplier = supplierDao.getSupplier(supplierID);
		model.addAttribute("supplier", supplier);
		return "store/store_viewSupplier";
	}

	@RequestMapping(value = "/store_editSupplier", method = RequestMethod.GET)
	public String store_editSupplier(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		int supplierID = Integer.parseInt(request.getParameter("supplierID"));
		Supplier supplier = supplierDao.getSupplier(supplierID);
		List<Province> provinceList = addressDao.getAllProvinces();
		List<District> districtList = addressDao.getDistricts(supplier
				.getDistrict().getProvince().getProvinceID());
		model.addAttribute("provinceList", provinceList);
		model.addAttribute("districtList", districtList);
		model.addAttribute("supplier", supplier);
		return "store/store_editSupplier";
	}

	@RequestMapping(value = "/store_saveCreateSupplier", method = RequestMethod.POST)
	public String store_saveCreateSupplier(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		String supplierName = request.getParameter("supplierName");
		String taxCode = request.getParameter("taxCode");
		String businessLicenseCode = request.getParameter("businessLicence");
		String homePhone = request.getParameter("homePhone");
		String fax = request.getParameter("fax");
		String email = request.getParameter("email");
		// String districtID = request.getParameter("districtID");
		String address = request.getParameter("address");
		String districtID = request.getParameter("district");
		District district = addressDao.getDistrict(districtID);
		Supplier supplier = new Supplier();
		supplier.setDistrict(district);
		supplier.setSupplierName(supplierName);
		supplier.setPhone(homePhone);
		supplier.setFax(fax);
		supplier.setEmail(email);
		supplier.setAddress(address);
		supplier.setTax(taxCode);
		supplier.setBusinessLicenseCode(businessLicenseCode);
		supplierDao.createSupplier(supplier);
		// String dateOfbirth_ = request.getParameter("dateOfBirth");
		List<Supplier> supplierList = supplierDao.getAllSupplier();
		model.addAttribute("supplierList", supplierList);
		return "store/store_listSupplier";
	}

	@RequestMapping(value = "/store_saveEditSupplier", method = RequestMethod.POST)
	public String store_saveEditSupplier(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		int supplierID = Integer.parseInt(request.getParameter("supplierID"));
		String supplierName = request.getParameter("supplierName");
		String taxCode = request.getParameter("taxCode");
		String businessLicenseCode = request.getParameter("businessLicence");
		String homePhone = request.getParameter("homePhone");
		String fax = request.getParameter("fax");
		String email = request.getParameter("email");
		// String districtID = request.getParameter("districtID");
		String address = request.getParameter("address");
		String districtID = request.getParameter("district");
		District district = addressDao.getDistrict(districtID);
		Supplier supplier = supplierDao.getSupplier(supplierID);
		supplier.setDistrict(district);
		supplier.setSupplierName(supplierName);
		supplier.setPhone(homePhone);
		supplier.setFax(fax);
		supplier.setEmail(email);
		supplier.setAddress(address);
		supplier.setTax(taxCode);
		supplier.setBusinessLicenseCode(businessLicenseCode);
		supplierDao.editSupplier(supplier);
		// String dateOfbirth_ = request.getParameter("dateOfBirth");
		List<Supplier> supplierList = supplierDao.getAllSupplier();
		model.addAttribute("supplierList", supplierList);
		return "store/store_listSupplier";
	}

	@RequestMapping(value = "/store_deleteSupplier", method = RequestMethod.GET)
	public String store_deleteSupplier(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		int supplierID = Integer.parseInt(request.getParameter("supplierID"));
		Supplier supplier = supplierDao.getSupplier(supplierID);
		supplier.setDeleted(true);
		supplierDao.editSupplier(supplier);
		// String dateOfbirth_ = request.getParameter("dateOfBirth");
		List<Supplier> supplierList = supplierDao.getAllSupplier();
		model.addAttribute("supplierList", supplierList);
		return "store/store_listSupplier";
	}
}
