package fu.mdms.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fu.mdms.dao.CategoryDao;
import fu.mdms.dao.ProductDao;
import fu.mdms.dao.impl.CategoryImpl;
import fu.mdms.dao.impl.ProductDaoImpl;
import fu.mdms.model.Category;
import fu.mdms.model.Product;
@Controller
public class ProductController {
	@RequestMapping(value = "/admin_listProduct", method = RequestMethod.GET)
	public String listProduct(Locale locale, Model model) {
		ProductDao productDao = new ProductDaoImpl();
		CategoryDao categoryDao = new CategoryImpl();
		List<Category> categoryList = categoryDao.getAllCategory();
		List<Product> productList = productDao.getAllProduct();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("productList", productList);
		return "admin_listProduct";
	}

	@RequestMapping(value = "/admin_searchProduct", method = RequestMethod.GET)
	public String searchProduct(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		String productCode = request.getParameter("productCode");
		String productName = request.getParameter("productName");
		String categoryID_ = request.getParameter("categoryID").trim();
		int categoryID = Integer.parseInt(categoryID_);
		ProductDao productDao = new ProductDaoImpl();
		CategoryDao categoryDao = new CategoryImpl();		
		
		List<Category> categoryList = categoryDao.getAllCategory();
		List<Product> productList = productDao.searchProduct(productCode, productName, categoryID);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("productList", productList);
		return "admin_listProduct";
/*		}
		else {
			List<Category> categoryList = categoryDao.getAllCategory();
			List<Product> productList = productDao.getAllProduct();
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("productList", productList);
			return "listProduct";
		}*/
	}
	/*@RequestMapping(value = "/searchProduct", method = RequestMethod.GET)
	public String searchDealer(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		String productCode = request.getParameter("maSanPham");
		String productName = request.getParameter("tenSanPham");
		String packageType = request.getParameter("loaiSanPham");
		ProductDao productDao = new ProductDaoImpl();
		List<Product> productList = productDao.searchProduct1(productCode);
		model.addAttribute("productList", productList);
		return "listProduct";
	}
*/
}
