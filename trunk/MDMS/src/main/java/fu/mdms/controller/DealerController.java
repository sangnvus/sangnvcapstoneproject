package fu.mdms.controller;

import java.util.List;
import java.util.Locale;
import java.util.concurrent.Delayed;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fu.mdms.dao.AddressDao;
import fu.mdms.dao.DealerDao;
import fu.mdms.dao.UserDao;
import fu.mdms.dao.impl.AddressDaoImpl;
import fu.mdms.dao.impl.DealerDaoImpl;
import fu.mdms.dao.impl.UserDaoImpl;
import fu.mdms.model.Dealer;
import fu.mdms.model.District;
import fu.mdms.model.Province;
import fu.mdms.model.User;

@Controller
public class DealerController {
	AddressDao addressDao = new AddressDaoImpl();
	DealerDao dealerDao = new DealerDaoImpl();
	UserDao userDao = new UserDaoImpl();

	@RequestMapping(value = "/sale_listDealer", method = RequestMethod.GET)
	public String listDealer(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		List<Dealer> dealerList = dealerDao.getAllDealer();
		model.addAttribute("dealerList", dealerList);
		return "sale/sale_listDealer";
	}

	@RequestMapping(value = "/sale_searchDealer", method = RequestMethod.GET)
	public String searchDealer(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		String dealerName = request.getParameter("dealerName");
		String status = request.getParameter("status");
		List<Dealer> dealerList = dealerDao.searchDealer(dealerName, status);
		model.addAttribute("dealerList", dealerList);
		return "sale/sale_listDealer";
	}

	@RequestMapping(value = "/sale_createDealer", method = RequestMethod.GET)
	public String sale_createDealer(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		List<Province> provinceList = addressDao.getAllProvinces();
		model.addAttribute("provinceList", provinceList);
		return "sale/sale_createDealer";
	}

	@RequestMapping(value = "/sale_viewDealerDetail", method = RequestMethod.GET)
	public String sale_viewDealerDetail(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		int dealerID = Integer.parseInt(request.getParameter("dealerID"));
		Dealer dealer = dealerDao.getDealer(dealerID);
		model.addAttribute("dealer", dealer);
		return "sale/sale_viewDealerDetail";
	}

	@RequestMapping(value = "/sale_editDealer", method = RequestMethod.GET)
	public String sale_editDealer(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		int dealerID = Integer.parseInt(request.getParameter("dealerID"));
		Dealer dealer = dealerDao.getDealer(dealerID);
		List<Province> provinceList = addressDao.getAllProvinces();
		List<District> districtList = addressDao.getDistricts(dealer
				.getDistrict().getProvince().getProvinceID());
		model.addAttribute("provinceList", provinceList);
		model.addAttribute("districtList", districtList);
		model.addAttribute("dealer", dealer);
		return "sale/sale_editDealer";
	}

	@RequestMapping(value = "/sale_saveCreateDealer", method = RequestMethod.POST)
	public String sale_saveCreateDealer(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		int userID = Integer.parseInt(request.getParameter("userID"));
		System.out.println(userID);
		String dealerName = request.getParameter("dealerName");
		String homePhone = request.getParameter("homePhone");
		String fax = request.getParameter("fax");
		String email = request.getParameter("email");
		// String districtID = request.getParameter("districtID");
		String address = request.getParameter("address");
		String taxCode = request.getParameter("taxCode");
		String businessLicenseCode = request.getParameter("businessLicence");
		int dealerRank = Integer.parseInt(request.getParameter("rank"));
		String viceGerent = request.getParameter("viceGerent");
		String mobilePhone = request.getParameter("phone");
		String districtID = request.getParameter("district");
		District district = addressDao.getDistrict(districtID);
		User user = userDao.getUser(userID);
		Dealer dealer = new Dealer();
		dealer.setDistrict(district);
		dealer.setUser(user);
		dealer.setDealerName(dealerName);
		dealer.setPhone(homePhone);
		dealer.setFax(fax);
		dealer.setEmail(email);
		dealer.setAddress(address);
		dealer.setTaxCode(taxCode);
		dealer.setBusinessLicenseCode(businessLicenseCode);
		dealer.setDealerRank(dealerRank);
		dealer.setViceGerent(viceGerent);
		dealer.setMobilePhone(mobilePhone);
		dealerDao.createDealer(dealer);
		// String dateOfbirth_ = request.getParameter("dateOfBirth");
		List<Dealer> dealerList = dealerDao.getAllDealer();
		model.addAttribute("dealerList", dealerList);
		return "sale/sale_listDealer";
	}

	@RequestMapping(value = "/sale_saveEditDealer", method = RequestMethod.POST)
	public String sale_saveEditDealer(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		int userID = Integer.parseInt(request.getParameter("userID"));
		System.out.println(userID);
		String dealerName = request.getParameter("dealerName");
		String homePhone = request.getParameter("homePhone");
		String fax = request.getParameter("fax");
		String email = request.getParameter("email");
		// String districtID = request.getParameter("districtID");
		String status = request.getParameter("status");
		String address = request.getParameter("address");
		String taxCode = request.getParameter("taxCode");
		String businessLicenseCode = request.getParameter("businessLicence");
		int dealerRank = Integer.parseInt(request.getParameter("rank"));
		String viceGerent = request.getParameter("viceGerent");
		String mobilePhone = request.getParameter("phone");

		String districtID = request.getParameter("district");
		District district = addressDao.getDistrict(districtID);
		User user = userDao.getUser(userID);
		Dealer dealer = new Dealer();
		dealer.setDistrict(district);
		dealer.setUser(user);
		dealer.setDealerName(dealerName);
		dealer.setPhone(homePhone);
		if (status == "0") {
			dealer.setStatus(false);
		}
		if (status == "1") {
			dealer.setStatus(true);
		}
		dealer.setFax(fax);
		dealer.setEmail(email);
		dealer.setAddress(address);
		dealer.setTaxCode(taxCode);
		dealer.setBusinessLicenseCode(businessLicenseCode);
		dealer.setDealerRank(dealerRank);
		dealer.setViceGerent(viceGerent);
		dealer.setMobilePhone(mobilePhone);
		dealerDao.createDealer(dealer);
		// String dateOfbirth_ = request.getParameter("dateOfBirth");
		List<Dealer> dealerList = dealerDao.getAllDealer();
		model.addAttribute("dealerList", dealerList);
		return "sale/sale_listDealer";
	}

	@RequestMapping(value = "/sale_deleteDealer", method = RequestMethod.GET)
	public String sale_deleteDealer(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		int dealerID = Integer.parseInt(request.getParameter("dealerID"));
		Dealer dealer = dealerDao.getDealer(dealerID);
		dealer.setStatus(true);
		dealerDao.editDealer(dealer);
		List<Dealer> dealerList = dealerDao.getAllDealer();
		model.addAttribute("dealerList", dealerList);
		return "sale/sale_listDealer";
	}

	@RequestMapping(value = "/sale_activeDealer", method = RequestMethod.GET)
	public String admin_activeUser(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		int dealerID = Integer.parseInt(request.getParameter("dealerID"));
		Dealer dealer = dealerDao.getDealer(dealerID);
		dealer.setStatus(false);
		dealerDao.editDealer(dealer);
		List<Dealer> dealerList = dealerDao.getAllDealer();
		model.addAttribute("dealerList", dealerList);
		return "sale/sale_listDealer";

	}
}
