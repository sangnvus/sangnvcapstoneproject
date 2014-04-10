package fu.mdms.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fu.mdms.dao.AddressDao;
import fu.mdms.dao.DealerDao;
import fu.mdms.dao.OrderDao;
import fu.mdms.dao.UserDao;
import fu.mdms.dao.impl.AddressDaoImpl;
import fu.mdms.dao.impl.DealerDaoImpl;
import fu.mdms.dao.impl.OrderDaoImpl;
import fu.mdms.dao.impl.UserDaoImpl;
import fu.mdms.model.Dealer;
import fu.mdms.model.District;
import fu.mdms.model.Order;
import fu.mdms.model.Province;
import fu.mdms.model.User;
import fu.mdms.model.UserRole;

@Controller
public class UserController {
	UserDao userDao = new UserDaoImpl();
	OrderDao orderDao = new OrderDaoImpl();
	DealerDao dealerDao = new DealerDaoImpl();
	AddressDao addressDao = new AddressDaoImpl();

	/*
	 * private static final Logger logger = LoggerFactory
	 * .getLogger(HomeController.class);
	 *//**
	 * Simply selects the home view to render by returning its name.
	 */
	/*
	 * 
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * home(Locale locale, Model model) { return "login"; }
	 */

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model,
			HttpSession session) {
		String userName = request.getParameter("userName");
		String password = request.getParameter("passWord");
		User user = userDao.login(userName, password);
		System.out.println(user.getUserName());
		if (user.getUserRole().getRoleID() == 1) {
			System.out.println("ddddd");
			List<User> userList = userDao.getAllUser();
			List<UserRole> userRoleList = userDao.getUserRole();
			model.addAttribute("userRoleList", userRoleList);
			model.addAttribute("userList", userList);
			session.setAttribute("user", user);
			return "admin/admin_listUser";
		} else if (user.getUserRole().getRoleID() == 2) {
			List<Dealer> dealerList = dealerDao.getAllDealer();
			model.addAttribute("dealerList", dealerList);
			session.setAttribute("user", user);
			return "sale/sale_listDealer";

		} else if (user.getUserRole().getRoleID() == 3) {
			session.setAttribute("user", user);
			List<Order> orderList = orderDao.searchOrder("", "1");
			model.addAttribute("orderList", orderList);
			return "store/store_listOrder";
		} else if (user.getUserID() == 0) {
			return "fail";
		}
		session.setAttribute("user", user);
		return "fail";
	}

	@RequestMapping(value = "/admin_listUser", method = RequestMethod.GET)
	public String admin_listUser(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model)
			throws IOException {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		List<UserRole> userRoleList = userDao.getUserRole();
		List<User> userList = userDao.getAllUser();
		model.addAttribute("userList", userList);
		model.addAttribute("userRoleList", userRoleList);
		return "admin/admin_listUser";
	}

	@RequestMapping(value = "/admin_searchUser", method = RequestMethod.POST)
	public String admin_searchUser(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		int userID = Integer.parseInt(request.getParameter("userID"));
		int roleName = Integer
				.parseInt(request.getParameter("roleName").trim());
		String userName = request.getParameter("userName");
		String status = request.getParameter("status");
		User user = userDao.getUser(userID);
		List<UserRole> userRoleList = userDao.getUserRole();
		List<User> userList = userDao.getUser(roleName, userName, status);
		model.addAttribute("user", user);
		model.addAttribute("userRoleList", userRoleList);
		model.addAttribute("userList", userList);
		return "admin/admin_listUser";
	}

	@RequestMapping(value = "/admin_createUser", method = RequestMethod.POST)
	public String admin_createUser(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		List<UserRole> userRoleList = userDao.getUserRole();
		List<Province> provinceList = addressDao.getAllProvinces();
		// List<District> districtList = addressDao.getDistricts(provinceID);
		model.addAttribute("provinceList", provinceList);
		model.addAttribute("userRoleList", userRoleList);
		return "admin/admin_createUser";
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @param locale
	 * @param model
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/changeCity", method = RequestMethod.GET)
	public String changeCity(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		String provinceID = request.getParameter("province");
		List<District> districtList = addressDao.getDistricts(provinceID);
		JSONObject json = new JSONObject();
		for (District district : districtList) {
			json.put(district.getDistrictID(), district.getDistrictName());
		}
		response.setContentType("application/json");
		try {
			response.getWriter().write(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

	@RequestMapping(value = "/admin_saveCreateUser", method = RequestMethod.POST)
	public String admin_saveCreateUser(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		try {
			request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		List<Province> provinceList = addressDao.getAllProvinces();

		// List<District> districtList = addressDao.getDistricts(provinceID);
		String userName = request.getParameter("userName");
		String fullName = request.getParameter("fullName");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String roleID = request.getParameter("roleID");
		String dateOfbirth_ = request.getParameter("dateOfBirth");
		String password = "12345678";
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date dateOfBirth = null;

		try {
			dateOfBirth = (Date) formatter.parse(dateOfbirth_);

		} catch (ParseException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
		String districtID = request.getParameter("district");
		District district = addressDao.getDistrict(districtID);
		UserRole userRole = userDao.getUserRoleByID(Integer.parseInt(roleID));
		boolean gender1 = false;
		if (gender.equalsIgnoreCase("Nu")) {
			gender1 = true;
		}
		User user = new User();
		user.setUserRole(userRole);
		user.setDistrict(district);
		user.setUserName(userName);
		user.setPassword(password);
		user.setFullName(fullName);
		user.setPhone(phone);
		user.setGender(gender1);
		user.setEmail(email);
		user.setAddress(address);
		user.setDateOfBirth(dateOfBirth);
		userDao.create(user);

		model.addAttribute("provinceList", provinceList);
		List<User> userList = userDao.getAllUser();
		model.addAttribute("userList", userList);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		// model.addAttribute("user", user);
		return "admin/admin_listUser";
	}

	@RequestMapping(value = "/admin_editUser", method = RequestMethod.GET)
	public String admin_editUser(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		List<UserRole> userRoleList = userDao.getUserRole();
		int userID = Integer.parseInt(request.getParameter("userID").trim());
		List<Province> provinceList = addressDao.getAllProvinces();
		User user = userDao.getUser(userID);
		List<District> districtList = addressDao.getDistricts(user
				.getDistrict().getProvince().getProvinceID());
		model.addAttribute("provinceList", provinceList);
		model.addAttribute("districtList", districtList);
		model.addAttribute("userRoleList", userRoleList);
		model.addAttribute("user", user);
		return "admin/admin_editUser";
	}

	@RequestMapping(value = "/admin_saveEditUser", method = RequestMethod.POST)
	public String admin_saveEditUser(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		try {
			request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		int userID = Integer.parseInt(request.getParameter("userID"));
		String userName = request.getParameter("userName");
		String fullName = request.getParameter("fullName");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String roleID = request.getParameter("roleID");
		String dateOfbirth_ = request.getParameter("dateOfBirth");
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date dateOfBirth = null;

		try {
			dateOfBirth = (Date) formatter.parse(dateOfbirth_);

		} catch (ParseException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
		String districtID = request.getParameter("district");
		District district = addressDao.getDistrict(districtID);
		UserRole userRole = userDao.getUserRoleByID(Integer.parseInt(roleID));
		User user = userDao.getUser(userID);
		user.setUserRole(userRole);
		user.setDistrict(district);
		user.setUserName(userName);
		user.setFullName(fullName);
		if (gender.equalsIgnoreCase("Nam")) {
			user.setGender(false);
		} else {
			user.setGender(true);
		}
		user.setPhone(phone);
		user.setEmail(email);
		user.setAddress(address);
		user.setDateOfBirth(dateOfBirth);
		userDao.editUser(user);

		List<User> userList = userDao.getAllUser();
		model.addAttribute("userList", userList);
		// model.addAttribute("user", user);
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return "admin/admin_listUser";
	}

	@RequestMapping(value = "/changeUserInformation", method = RequestMethod.GET)
	public String changeUserInformation(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		int userID = Integer.parseInt(request.getParameter("userID"));
		List<Province> provinceList = addressDao.getAllProvinces();
		User user = userDao.getUser(userID);
		List<District> districtList = addressDao.getDistricts(user
				.getDistrict().getProvince().getProvinceID());
		model.addAttribute("provinceList", provinceList);
		model.addAttribute("districtList", districtList);
		model.addAttribute("user", user);
		return "user/userEditInformation";
	}

	@RequestMapping(value = "/saveChangeUserInformation", method = RequestMethod.POST)
	public String saveChangeUserInformation(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}

		int userID = Integer.parseInt(request.getParameter("userID"));
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String districtID = request.getParameter("district");
		District district = addressDao.getDistrict(districtID);
		User user = userDao.getUser(userID);
		user.setDistrict(district);
		user.setPhone(phone);
		user.setEmail(email);
		user.setAddress(address);
		userDao.editUser(user);
		if (user.getUserRole().getRoleID() == 1) {
			List<User> userList = userDao.getAllUser();
			List<UserRole> userRoleList = userDao.getUserRole();
			model.addAttribute("userRoleList", userRoleList);
			model.addAttribute("userList", userList);
			return "admin/admin_listUser";
		} else if (user.getUserRole().getRoleID() == 2) {
			List<Dealer> dealerList = dealerDao.getAllDealer();
			model.addAttribute("dealerList", dealerList);
			return "sale/sale_listDealer";

		} else if (user.getUserRole().getRoleID() == 3) {
			List<Order> orderList = orderDao.getAllOrder();
			model.addAttribute("orderList", orderList);
			return "store/store_listOrder";
		}
		// model.addAttribute("user", user);
		return "home";
	}

	@RequestMapping(value = "/admin_deleteUser", method = RequestMethod.GET)
	public String admin_deleteUser(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		int userID = Integer.parseInt(request.getParameter("userID"));
		User user = userDao.getUser(userID);
		user.setDeleted(true);
		userDao.editUser(user);
		List<User> userList = userDao.getAllUser();
		List<UserRole> userRoleList = userDao.getUserRole();
		model.addAttribute("userRoleList", userRoleList);
		model.addAttribute("userList", userList);
		return "admin/admin_listUser";

	}

	@RequestMapping(value = "/admin_activeUser", method = RequestMethod.GET)
	public String admin_activeUser(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		int userID = Integer.parseInt(request.getParameter("userID"));
		User user = userDao.getUser(userID);
		user.setDeleted(false);
		userDao.editUser(user);
		List<User> userList = userDao.getAllUser();
		List<UserRole> userRoleList = userDao.getUserRole();
		model.addAttribute("userRoleList", userRoleList);
		model.addAttribute("userList", userList);
		return "admin/admin_listUser";

	}

	@RequestMapping(value = "/admin_resetPassword", method = RequestMethod.GET)
	public String admin_resetPassword(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		int userID = Integer.parseInt(request.getParameter("userID"));
		AddressDao addressDao = new AddressDaoImpl();
		List<UserRole> userRoleList = userDao.getUserRole();
		List<Province> provinceList = addressDao.getAllProvinces();
		User user = userDao.getUser(userID);
		List<District> districtList = addressDao.getDistricts(user
				.getDistrict().getProvince().getProvinceID());
		model.addAttribute("provinceList", provinceList);
		model.addAttribute("districtList", districtList);
		model.addAttribute("userRoleList", userRoleList);
		model.addAttribute("user", user);
		user.setPassword("12345678");
		userDao.editUser(user);
		return "admin/admin_editUser";

	}
	@RequestMapping(value = "/userChangePassword", method = RequestMethod.GET)
	public String userChangePassword(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		int userID = Integer.parseInt(request.getParameter("userID"));
		List<Province> provinceList = addressDao.getAllProvinces();
		User user = userDao.getUser(userID);
		List<District> districtList = addressDao.getDistricts(user
				.getDistrict().getProvince().getProvinceID());
		model.addAttribute("provinceList", provinceList);
		model.addAttribute("districtList", districtList);
		model.addAttribute("user", user);
		return "user/userChangePassword";
	}
	

}
