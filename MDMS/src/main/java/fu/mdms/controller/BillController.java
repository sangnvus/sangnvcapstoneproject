package fu.mdms.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fu.mdms.dao.BillDao;
import fu.mdms.dao.impl.BillDaoImpl;
import fu.mdms.model.ImportBill;

@Controller
public class BillController {
	@RequestMapping(value = "/listImportBill", method = RequestMethod.GET)
	public String listImportBill(Locale locale, Model model) {
		BillDao billDao = new BillDaoImpl();
		List<ImportBill> importBillList = billDao.getAllImportBills();
		model.addAttribute("importBilltList", importBillList);
		return "listImportBill";
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
}
