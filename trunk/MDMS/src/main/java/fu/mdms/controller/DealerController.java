package fu.mdms.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fu.mdms.dao.AddressDao;
import fu.mdms.dao.DealerDao;
import fu.mdms.dao.impl.AddressDaoImpl;
import fu.mdms.dao.impl.DealerDaoImpl;
import fu.mdms.model.Dealer;
import fu.mdms.model.Province;

@Controller
public class DealerController {

	@RequestMapping(value = "/listDealer", method = RequestMethod.GET)
	public String listDealer(Locale locale, Model model) {
		DealerDao dealerDao = new DealerDaoImpl();
		List<Dealer> dealerList = dealerDao.getAllDealer();
		model.addAttribute("dealerList", dealerList);
		return "listDealer";
	}

	@RequestMapping(value = "/testListDealer", method = RequestMethod.GET)
	public String testListDealer(Locale locale, Model model) {
		DealerDao dealerDao = new DealerDaoImpl();
		List<Dealer> dealerList = dealerDao.getAllDealer();
		model.addAttribute("dealerList", dealerList);
		return "testListDealer";
	}

	@RequestMapping(value = "/searchDealer", method = RequestMethod.GET)
	public String searchDealer(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		String dealerName = request.getParameter("tenDaiLy");
		String status = request.getParameter("trangThai");
		DealerDao dealerDao = new DealerDaoImpl();
		List<Dealer> dealerList = dealerDao.searchDealer(dealerName, status);
		model.addAttribute("dealerList", dealerList);
		return "listDealer";
	}

	@RequestMapping(value = "/createDealer", method = RequestMethod.GET)
	public String createUser(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		AddressDao addressDao = new AddressDaoImpl();
		List<Province> provinceList = addressDao.getAllProvinces();
		model.addAttribute("provinceList", provinceList);
		return "createDealer";
	}
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		//AddressDao addressDao = new AddressImplDao();
		//List<Province> provinceList = addressDao.getAllProvinces();
		//model.addAttribute("provinceList", provinceList);
		return "testReload";
	}
}
