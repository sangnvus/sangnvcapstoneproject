package fu.mdms.controller;

import java.io.IOException;
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
import fu.mdms.dao.UserDao;
import fu.mdms.dao.impl.AddressDaoImpl;
import fu.mdms.dao.impl.UserDaoImpl;
import fu.mdms.model.District;
import fu.mdms.model.Province;
import fu.mdms.model.User;
import fu.mdms.model.UserRole;

@Controller
public class UserController {
	UserDao userDao = new UserDaoImpl();

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
			return "admin_listUser";
		} else if (user.getUserRole().getRoleID() == 2) {
			session.setAttribute("user", user);
			System.out.println("aaaaaaaaaaaaa");
			return "salesman";

		} else if (user.getUserRole().getRoleID() == 3) {
			session.setAttribute("user", user);
			return "salesman";
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
		// HttpSession session = request.getSession(false);
		// UserDao userDao = new UserDaoImpl();
		// User user = (User) session.getAttribute("user");
		// System.out.println(user.getUserName());
		List<UserRole> userRoleList = userDao.getUserRole();
		List<User> userList = userDao.getAllUser();
		model.addAttribute("userList", userList);
		model.addAttribute("userRoleList", userRoleList);
		return "admin_listUser";
	}

	@RequestMapping(value = "/admin_searchUser", method = RequestMethod.POST)
	public String admin_searchUser(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		// UserRole userRole = new UserRole();
		int userID = Integer.parseInt(request.getParameter("userID").trim());
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
		return "admin_listUser";
	}

	@RequestMapping(value = "/admin_createUser", method = RequestMethod.POST)
	public String admin_createUser(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		AddressDao addressDao = new AddressDaoImpl();
		List<UserRole> userRoleList = userDao.getUserRole();
		int userID = Integer.parseInt(request.getParameter("userID").trim());
		List<Province> provinceList = addressDao.getAllProvinces();

		// List<District> districtList = addressDao.getDistricts(provinceID);
		model.addAttribute("provinceList", provinceList);
		model.addAttribute("userRoleList", userRoleList);
		User user = userDao.getUser(userID);
		model.addAttribute("user", user);
		return "admin_createUser";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/changeCity", method = RequestMethod.GET)
	public String changeCity(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		/*
		 * String provinceID = request.getParameter("provinceID"); AddressDao
		 * addressDao = new AddressImplDao(); List<District> districtList =
		 * addressDao.getDistricts(provinceID); JSONObject json = new
		 * JSONObject(); for (District district : districtList) {
		 * json.put(district.getDistrictID(), district.getDistrictName()); }
		 * response.setContentType("application/json"); try {
		 * response.getWriter().write(json.toString()); } catch (IOException e)
		 * { e.printStackTrace(); }
		 */
		return null;
	}

	@RequestMapping(value = "/admin_saveUser", method = RequestMethod.POST)
	public String admin_saveUser(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		AddressDao addressDao = new AddressDaoImpl();
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
		String districtID = "001";
		District district = addressDao.getDistrict(districtID);
		UserRole userRole = userDao.getUserRoleByID(Integer.parseInt(roleID));
		User user = new User();
		user.setUserRole(userRole);
		user.setDistrict(district);
		user.setUserName(userName);
		user.setPassword(password);
		user.setFullName(fullName);
		user.setPhone(phone);
		user.setEmail(email);
		user.setAddress(address);
		user.setDateOfBirth(dateOfBirth);
		userDao.addUser(user);

		model.addAttribute("provinceList", provinceList);
		List<User> userList = userDao.getAllUser();
		model.addAttribute("userList", userList);
		// model.addAttribute("user", user);
		return "admin_listUser";
	}

	@RequestMapping(value = "/admin_editUser", method = RequestMethod.GET)
	public String admin_editUser(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		AddressDao addressDao = new AddressDaoImpl();
		List<UserRole> userRoleList = userDao.getUserRole();
		int userID = Integer.parseInt(request.getParameter("userID").trim());
		List<Province> provinceList = addressDao.getAllProvinces();
		// List<District> districtList = addressDao.getDistricts(provinceID);
		model.addAttribute("provinceList", provinceList);
		model.addAttribute("userRoleList", userRoleList);
		User user = userDao.getUser(userID);
		model.addAttribute("user", user);
		return "admin_editUser";
	}

	@RequestMapping(value = "/testUser", method = RequestMethod.GET)
	public String test(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		// UserRole userRole = new UserRole();
		return "test";
	}
	/*
	 * @RequestMapping(value = "/edit", method = RequestMethod.GET) public
	 * String edit(HttpServletRequest request, HttpServletResponse response,
	 * Locale locale, Model model) { String userID =
	 * request.getParameter("userID"); User user =
	 * userDao.getUser(Integer.parseInt(userID)); model.addAttribute("user",
	 * user); List<UserRole> userRole = userDao.getUserRole();
	 * model.addAttribute("roleList", userRole); return "edit"; }
	 * 
	 * @RequestMapping(value = "/create", method = RequestMethod.GET) public
	 * String create(Locale locale, Model model) { List<UserRole> userRole =
	 * userDao.getUserRole(); model.addAttribute("roleList", userRole); return
	 * "create"; }
	 * 
	 * @RequestMapping(value = "/delete", method = RequestMethod.GET) public
	 * String delete(HttpServletRequest request, HttpServletResponse response,
	 * Locale locale, Model model) { String userID =
	 * request.getParameter("userID"); userDao.delete(Integer.parseInt(userID));
	 * model.addAttribute("userID", userID); return "delete"; }
	 * 
	 * @RequestMapping(value = "/createUser", method = RequestMethod.POST)
	 * public String createUser(HttpServletRequest request, HttpServletResponse
	 * response, Locale locale, Model model) { String userName =
	 * request.getParameter("userName"); String fullName =
	 * request.getParameter("fullName"); String age =
	 * request.getParameter("age"); String address =
	 * request.getParameter("address"); String phone =
	 * request.getParameter("phone"); String email =
	 * request.getParameter("email"); String roleID =
	 * request.getParameter("role"); User user = new User(); UserRole userRole =
	 * userDao.getUserRoleByID(Integer.parseInt(roleID));
	 * user.setUserName(userName); user.setPassword("12345678");
	 * user.setFullName(fullName); user.setAge(Integer.parseInt(age));
	 * user.setAddress(address); user.setPhone(phone); user.setEmail(email);
	 * user.setUserRole(userRole); userDao.add(user);
	 * model.addAttribute("userName", userName); return "add"; }
	 * 
	 * @RequestMapping(value = "/editUser", method = RequestMethod.POST) public
	 * String editUser(HttpServletRequest request, HttpServletResponse response,
	 * Locale locale, Model model) { String userID =
	 * request.getParameter("userID"); String userName =
	 * request.getParameter("userName"); String password =
	 * request.getParameter("password"); String fullName =
	 * request.getParameter("fullName"); String age =
	 * request.getParameter("age"); String address =
	 * request.getParameter("address"); String phone =
	 * request.getParameter("phone"); String email =
	 * request.getParameter("email"); String roleID =
	 * request.getParameter("role"); User user = new User(); UserRole userRole =
	 * userDao.getUserRoleByID(Integer.parseInt(roleID));
	 * user.setUserID(Integer.parseInt(userID)); user.setUserName(userName);
	 * user.setPassword(password); user.setFullName(fullName);
	 * user.setAge(Integer.parseInt(age)); user.setAddress(address);
	 * user.setPhone(phone); user.setEmail(email); user.setUserRole(userRole);
	 * userDao.edit(user); model.addAttribute("userName", userName); return
	 * "editUser"; }
	 */
}
