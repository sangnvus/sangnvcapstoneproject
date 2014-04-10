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

import fu.mdms.dao.BillDao;
import fu.mdms.dao.ProductDao;
import fu.mdms.dao.SupplierDao;
import fu.mdms.dao.impl.BillDaoImpl;
import fu.mdms.dao.impl.ProductDaoImpl;
import fu.mdms.dao.impl.SupplierDaoImpl;
import fu.mdms.model.ImportBill;
import fu.mdms.model.ImportBillDetail;
import fu.mdms.model.OrderDetail;
import fu.mdms.model.Product;
import fu.mdms.model.Supplier;

@Controller
public class BillController {
	BillDao billDao = new BillDaoImpl();
	@RequestMapping(value = "/store_listImportBill", method = RequestMethod.GET)
	public String store_listImportBill(Locale locale, Model model) {
		List<ImportBill> importBillList = billDao.getAllImportBills();
		model.addAttribute("importBillList", importBillList);
		return "store/store_listImportBill";
	}
	/*@RequestMapping(value = "/searchProduct", method = RequestMethod.GET)
	public String searchDealer(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		String productCode = request.getParameter("maSanPham");
		String productName = request.getParameter("tenSanPham");
		String packageType = request.getParameter("loaiSanPham");
		ProductDao productDao = new ProductDaoImpl();
		List<Product> productList = productDao.searchProduct(productCode,
				productName, packageType);
		model.addAttribute("productList", productList);
		return "listProduct";
	}*/
	@RequestMapping(value = "/store_viewImportBill", method = RequestMethod.GET)
	public String store_viewImportBill(Locale locale, Model model) {
		List<ImportBill> importBillList = billDao.getAllImportBills();
		model.addAttribute("importBilltList", importBillList);
		return "store/store_viewImportBill";
	}
	@RequestMapping(value = "/store_createImportBill", method = RequestMethod.GET)		  
	public String store_createImportBill(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		ProductDao productDao = new ProductDaoImpl();
		List<Product> productList = productDao.getAllProduct();
		model.addAttribute("productList", productList);
		SupplierDao supplierDao = new SupplierDaoImpl();
		List<Supplier> supplierList = supplierDao.getAllSupplier();
		model.addAttribute("supplierList", supplierList);
		return "store/store_createImportBill";
	}
	@RequestMapping(value = "/store_saveImportBill", method = RequestMethod.POST)
	public String store_saveImportBill(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		String supplierID = request.getParameter("supplierID");
		String importDate = request.getParameter("importDate");
		SupplierDao supplierDao = new SupplierDaoImpl();
		Supplier supplier = supplierDao.getSupplier(Integer.parseInt(supplierID));
		ImportBill importBill = new ImportBill(supplier, importDate, 1);
		billDao.createImportBill(importBill);
		int row = Integer.parseInt(request.getParameter("row"));
		System.out.println(row);
		for (int i = 1; i <= row; i++) {
			String productID = request.getParameter("productID" + i);
			int quantity = Integer.parseInt(request
					.getParameter("quantity" + i));
			ProductDao productDao = new ProductDaoImpl();
			Product product = productDao
					.getProduct(Integer.parseInt(productID));
			importBill = billDao.getImportBillByID(billDao.getLastInsertIm());
			System.out.println(importBill.getSupplier().getSupplierName());
			System.out.println(billDao.getLastInsertIm());
			BigDecimal importPrice = new BigDecimal(request.getParameter("importPrice" + i));
			ImportBillDetail importBillDetail = new ImportBillDetail(importBill, product, importPrice, quantity);
			billDao.createImportBillDetail(importBillDetail);
			product.setUnitsInStock(product.getUnitsInStock()+quantity);
			product.setImportPrice(importPrice);
			productDao.editProduct(product);
		}
		System.out.println("==============================================================================================================");
		System.out.println("==============================================================================================================");
		List<ImportBill> importBillList = billDao.getAllImportBills();
		model.addAttribute("importBilltList", importBillList);
		return "store/store_listImportBill";
	}
}
