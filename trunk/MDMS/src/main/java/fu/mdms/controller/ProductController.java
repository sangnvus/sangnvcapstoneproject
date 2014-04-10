package fu.mdms.controller;

import java.math.BigDecimal;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fu.mdms.dao.CategoryDao;
import fu.mdms.dao.ProducerDao;
import fu.mdms.dao.ProductDao;
import fu.mdms.dao.SupplierDao;
import fu.mdms.dao.impl.CategoryImpl;
import fu.mdms.dao.impl.ProducerDaoImpl;
import fu.mdms.dao.impl.ProductDaoImpl;
import fu.mdms.dao.impl.SupplierDaoImpl;
import fu.mdms.model.Category;
import fu.mdms.model.Producer;
import fu.mdms.model.Product;
import fu.mdms.model.Supplier;

@Controller
public class ProductController {
	private ProductDao productDao = new ProductDaoImpl();

	@RequestMapping(value = "/admin_listProduct", method = RequestMethod.GET)
	public String listProduct(Locale locale, Model model) {
		ProductDao productDao = new ProductDaoImpl();
		CategoryDao categoryDao = new CategoryImpl();
		List<Category> categoryList = categoryDao.getAllCategory();
		List<Product> productList = productDao.getAllProduct();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("productList", productList);
		return "admin/admin_listProduct";
	}

	@RequestMapping(value = "/store_listProduct", method = RequestMethod.GET)
	public String store_listProduct(Locale locale, Model model) {
		ProductDao productDao = new ProductDaoImpl();
		CategoryDao categoryDao = new CategoryImpl();
		List<Category> categoryList = categoryDao.getAllCategory();
		List<Product> productList = productDao.getAllProduct();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("productList", productList);
		return "store/store_listProduct";
	}
	
	@RequestMapping(value = "/sale_listProduct", method = RequestMethod.GET)
	public String sale_listProduct(Locale locale, Model model) {
		ProductDao productDao = new ProductDaoImpl();
		CategoryDao categoryDao = new CategoryImpl();
		List<Category> categoryList = categoryDao.getAllCategory();
		List<Product> productList = productDao.getAllProduct();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("productList", productList);
		return "sale/sale_listProduct";
	}

	@RequestMapping(value = "/admin_searchProduct", method = RequestMethod.GET)
	public String searchProduct(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		String productCode = request.getParameter("productCode");
		String productName = request.getParameter("productName");
		String categoryID_ = request.getParameter("categoryID").trim();
		System.out.println(productName);
		int categoryID = Integer.parseInt(categoryID_);
		ProductDao productDao = new ProductDaoImpl();
		CategoryDao categoryDao = new CategoryImpl();

		List<Category> categoryList = categoryDao.getAllCategory();
		List<Product> productList = productDao.searchProduct(productCode,
				productName, categoryID);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("productList", productList);
		return "admin/admin_listProduct";

	}

	@RequestMapping(value = "/store_searchProduct", method = RequestMethod.GET)
	public String store_searchProduct(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		String productCode = request.getParameter("productCode");
		String productName = request.getParameter("productName");
		String categoryID_ = request.getParameter("categoryID").trim();
		System.out.println(productName);
		int categoryID = Integer.parseInt(categoryID_);
		ProductDao productDao = new ProductDaoImpl();
		CategoryDao categoryDao = new CategoryImpl();

		List<Category> categoryList = categoryDao.getAllCategory();
		List<Product> productList = productDao.searchProduct(productCode,
				productName, categoryID);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("productList", productList);
		return "store/store_listProduct";
	}

	@RequestMapping(value = "/sale_searchProduct", method = RequestMethod.GET)
	public String sale_searchProduct(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		String productCode = request.getParameter("productCode");
		String productName = request.getParameter("productName");
		String categoryID_ = request.getParameter("categoryID").trim();
		System.out.println(productName);
		int categoryID = Integer.parseInt(categoryID_);
		ProductDao productDao = new ProductDaoImpl();
		CategoryDao categoryDao = new CategoryImpl();

		List<Category> categoryList = categoryDao.getAllCategory();
		List<Product> productList = productDao.searchProduct(productCode,
				productName, categoryID);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("productList", productList);
		return "sale/sale_listProduct";
	}
	
	@RequestMapping(value = "/store_editProduct", method = RequestMethod.GET)
	public String admin_editUser(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		int productID = Integer.parseInt(request.getParameter("productID"));
		Product product = productDao.getProduct(productID);
		SupplierDao supplierDao = new SupplierDaoImpl();
		CategoryDao categoryDao = new CategoryImpl();
		ProducerDao producerDao = new ProducerDaoImpl();
		List<Supplier> supplierList = supplierDao.getAllSupplier();
		List<Category> categoryList = categoryDao.getAllCategory();
		System.out.println(categoryList.get(0).getCategoryID());
		List<Producer> producerList = producerDao.getAllProducer();
		model.addAttribute("supplierList", supplierList);
		model.addAttribute("categoryList", categoryList);

		model.addAttribute("producerList", producerList);
		model.addAttribute("product", product); // dong nay la truyen 1 cai
												// product len giao dien edit
		return "store/store_editProduct";
	}

	@RequestMapping(value = "/store_saveEditProduct", method = RequestMethod.POST)
	public String store_saveEditProduct(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		System.out.println("hehe");
		SupplierDao supplierDao = new SupplierDaoImpl();
		CategoryDao categoryDao = new CategoryImpl();
		ProducerDao producerDao = new ProducerDaoImpl();
		int productID = Integer.parseInt(request.getParameter("productID"));
		// System.out.println(productID);
		String msp = request.getParameter("msp");
		String tsp = request.getParameter("tsp");
		String kdg = request.getParameter("kdg");
		// String categoryID = request.getParameter("category");
		String supplierID = request.getParameter("supplier");
		String producerID = request.getParameter("producer");
		String gn = request.getParameter("gn");
		String gx = request.getParameter("gx");
		String mtsp = request.getParameter("mtsp");
		int categoryID = 1;
		Category lsp = categoryDao.getCategory(categoryID);
		Supplier ncc = supplierDao.getSupplier(Integer.parseInt(supplierID));
		Producer nsx = producerDao.getProducer(Integer.parseInt(producerID));

		// System.out.println(lsp.getCategoryID());
		// System.out.println(ncc.getSupplierName());
		// System.out.println(nsx.getProducerName());
		Product product = productDao.getProduct(productID);
		product.setCategory(lsp);
		product.setProductID(productID);
		product.setProductCode(msp);
		product.setProductName(tsp);
		product.setPackagedType(kdg);
		product.setCategory(lsp);
		product.setSupplier(ncc);
		product.setProducer(nsx);
		product.setUnitsInStock(0);
		product.setUnitsOnOrders(0);
		product.setImportPrice(new BigDecimal(gn));
		product.setExportPrice(new BigDecimal(gx));
		product.setDescription(mtsp);
		product.setDeleted(false);
		// System.out.println("here");
		productDao.editProduct(product);

		List<Product> productList = productDao.getAllProduct();
		model.addAttribute("productList", productList);

		return "store/store_listProduct";
	}

	@RequestMapping(value = "/store_createProduct", method = RequestMethod.GET)
	public String createProduct(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		SupplierDao supplierDao = new SupplierDaoImpl();
		CategoryDao categoryDao = new CategoryImpl();
		ProducerDao producerDao = new ProducerDaoImpl();
		List<Supplier> supplierList = supplierDao.getAllSupplier();
		List<Category> categoryList = categoryDao.getAllCategory();
		List<Producer> producerList = producerDao.getAllProducer();
		model.addAttribute("supplierList", supplierList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("producerList", producerList);
		// int productID =
		// Integer.parseInt(request.getParameter("productID").trim());
		// Product product = productDao.getProduct(productID);
		// model.addAttribute("product", product);
		return "store/store_createProduct";
	}

	@RequestMapping(value = "/store_saveProduct", method = RequestMethod.GET)
	public String store_saveProduct(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		SupplierDao supplierDao = new SupplierDaoImpl();
		CategoryDao categoryDao = new CategoryImpl();
		ProducerDao producerDao = new ProducerDaoImpl();
		String msp = request.getParameter("msp");
		String tsp = request.getParameter("tsp");
		String kdg = request.getParameter("kdg");
		String categoryID = request.getParameter("category");
		String supplierID = request.getParameter("supplier");
		String producerID = request.getParameter("producer");
		String gn = request.getParameter("gn");
		String gx = request.getParameter("gx");
		String mtsp = request.getParameter("mtsp");

		Category lsp = categoryDao.getCategory(Integer.parseInt(categoryID));
		Supplier ncc = supplierDao.getSupplier(Integer.parseInt(supplierID));
		Producer nsx = producerDao.getProducer(Integer.parseInt(producerID));
		System.out.println(lsp.getCategoryName());
		System.out.println(ncc.getSupplierName());
		System.out.println(nsx.getProducerName());
		Product product = new Product();
		product.setProductCode(msp);
		product.setProductName(tsp);
		product.setPackagedType(kdg);
		product.setCategory(lsp);
		product.setSupplier(ncc);
		product.setProducer(nsx);
		product.setUnitsInStock(0);
		product.setUnitsOnOrders(0);
		product.setImportPrice(new BigDecimal(gn));
		product.setExportPrice(new BigDecimal(gx));
		product.setDescription(mtsp);
		product.setDeleted(false);
		// System.out.println("here");
		productDao.createProduct(product);

		List<Product> productList = productDao.getAllProduct();
		model.addAttribute("productList", productList);

		return "store/store_listProduct";
	}

	@RequestMapping(value = "/store_deleteProduct", method = RequestMethod.GET)
	public String store_deleteProduct(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		int productID = Integer.parseInt(request.getParameter("productID"));
		// AddressDao addressDao = new AddressDaoImpl();
		// String districtID = "001";
		// District district = addressDao.getDistrict(districtID);
		// UserRole userRole =
		// userDao.getUserRoleByID(Integer.parseInt(roleID));
		Product product = productDao.getProduct(productID);
		product.setDeleted(true);
		productDao.editProduct(product);
		List<Product> productList = productDao.getAllProduct();

		model.addAttribute("productList", productList);
		return "store/store_listProduct";

	}

	@RequestMapping(value = "/store_viewProduct", method = RequestMethod.GET)
	public String admin_viewProduct(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		int productID = Integer.parseInt(request.getParameter("productID"));
		Product product = productDao.getProduct(productID);
		SupplierDao supplierDao = new SupplierDaoImpl();
		CategoryDao categoryDao = new CategoryImpl();
		ProducerDao producerDao = new ProducerDaoImpl();
		List<Supplier> supplierList = supplierDao.getAllSupplier();
		List<Category> categoryList = categoryDao.getAllCategory();
		List<Producer> producerList = producerDao.getAllProducer();
		model.addAttribute("supplierList", supplierList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("producerList", producerList);
		model.addAttribute("product", product); // dong nay la truyen 1 cai
												// product len giao dien edit
		return "store/store_viewProduct";
	}
}
