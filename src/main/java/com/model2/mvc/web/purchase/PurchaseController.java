package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;


@Controller
@RequestMapping("/purchase/")
public class PurchaseController {
	
	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	@Autowired
	@Qualifier("productServiceImpl")	
	private ProductService productService;
	//setter Method 구현 않음
		
	public PurchaseController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value = "addPurchaseView", method = RequestMethod.GET)
	public String addPurchaseView( @RequestParam("prodNo") String prodNo, 
														@RequestParam("currentPage") int currentPage,
																Model model ) throws Exception {
		
	model.addAttribute("prodInfo", productService.findProduct(prodNo));
	model.addAttribute("currentPage", currentPage);
	return "forward:/purchase/addPurchaseView.jsp";
}
	
	@RequestMapping(value = "addPurchase", method = RequestMethod.POST)
	public String addPurchase( @ModelAttribute("pvo") Purchase purchase,
														 @RequestParam("prodNo") String prodNo,
														 @RequestParam("currentPage") int currentPage,
														 HttpSession session,
														 HttpServletRequest request,
														 Model model ) throws Exception {
	
		session = request.getSession();
		purchase.setBuyer((User)session.getAttribute("user"));
		purchase.setPurchaseProd(productService.findProduct(prodNo));
		purchase.getPurchaseProd().setQuantity(purchase.getPurchaseProd().getQuantity()-1);
		purchaseService.addPurchase(purchase);
		productService.minusQuantity(purchase.getPurchaseProd());
		model.addAttribute("currentPage", currentPage);
		
	return "forward:/purchase/addPurchase.jsp";
}
	
	@RequestMapping(value = "getPurchase", method = RequestMethod.GET)
	public String getPurchase(	 @RequestParam("prodNo") String prodNo,
															@RequestParam("tranNo") int tranNo,
															Model model ) throws Exception {
		
		model.addAttribute("vo", productService.findProduct(prodNo));
		model.addAttribute("pvo", purchaseService.getPurchase(tranNo));
		
	return "forward:/purchase/getPurchaseView.jsp";
	
	}
	
	
	@RequestMapping(value = "listPurchase")
	public String listProduct( @ModelAttribute("search") Search search,
													HttpSession session,
													HttpServletRequest request,
													Model model)  throws Exception {
	
	User user = (User)session.getAttribute("user");
	
	if(search.getCurrentPage() ==0 ){
		search.setCurrentPage(1);
	}
	search.setPageSize(pageSize);

	// Business logic 수행
	Map<String , Object> map=purchaseService.getPurchaseList(search, user.getUserId());
	Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
	System.out.println(resultPage);
	
	model.addAttribute("list", map.get("list"));
	model.addAttribute("resultPage", resultPage);
	model.addAttribute("search", search);
	
	return "forward:/purchase/listPurchase.jsp";
}
	
	@RequestMapping(value = "listTransaction")
	public String listProduct( 		@ModelAttribute("search") Search search,
													HttpServletRequest request,
													Model model)  throws Exception {
	
	if(search.getCurrentPage() ==0 ){
		search.setCurrentPage(1);
	}
	search.setPageSize(pageSize);

	// Business logic 수행
	Map<String , Object> map=purchaseService.getSaleList(search);
	Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
	System.out.println(resultPage);
	
	model.addAttribute("list", map.get("list"));
	model.addAttribute("resultPage", resultPage);
	model.addAttribute("search", search);
	
	return "forward:/purchase/listTransaction.jsp";
}
	
	@RequestMapping(value = "updatePurchase", method = RequestMethod.GET)
	public String updatePurchase(	@ModelAttribute("vo") Purchase vo,
															@RequestParam("tranNo") int tranNo,
															Model model ) throws Exception {
		
		vo = purchaseService.getPurchase(tranNo);
		model.addAttribute("vo", vo);
		
	return "forward:/purchase/updatePurchaseView.jsp";
	
	}
	
	@RequestMapping(value = "updatePurchaseView")
	public String updatePurchaseView(	@ModelAttribute("vo") Purchase vo,
																		Model model ) throws Exception {
		
		purchaseService.updatePurchase(vo);
		vo = purchaseService.getPurchase(vo.getTranNo());
		model.addAttribute("vo", vo);
		
	return "forward:/purchase/updatePurchase.jsp";
	
	}
	
	@RequestMapping(value = "updateTranCode", method = RequestMethod.GET)
	public String updateTranCode(	@ModelAttribute("vo") Purchase vo,
																@RequestParam("tranNo") int tranNo,
																@RequestParam("tranCode") String tranCode,
																		Model model ) throws Exception {
			
		vo = purchaseService.getPurchase(tranNo);
		if ( vo.getTranCode().equals("002")) {
		vo.setTranCode("003");
		}else if( vo.getTranCode().equals("003")) {
			vo.setTranCode("004");
		}
		purchaseService.updateTranCode(vo);
		
	return "redirect:/purchase/listTransaction";
	
	}
	
	@RequestMapping(value = "updateTranCodeUser", method = RequestMethod.GET)
	public String updateTranCodeUser(	@ModelAttribute("vo") Purchase vo,
																@RequestParam("tranNo") int tranNo,
																@RequestParam("tranCode") String tranCode,
																		Model model ) throws Exception {
			
		vo = purchaseService.getPurchase(tranNo);
		if ( vo.getTranCode().equals("002")) {
		vo.setTranCode("003");
		}else if( vo.getTranCode().equals("003")) {
			vo.setTranCode("004");
		}
		purchaseService.updateTranCode(vo);
		
	return "redirect:/purchase/listPurchase";
	
	}
	
	
}













