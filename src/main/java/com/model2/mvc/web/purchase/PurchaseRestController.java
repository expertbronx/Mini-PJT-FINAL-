package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {
	
	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	//setter Method 구현 않음
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public PurchaseRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	// 포스트맨으로 단위 테스트 완료
	@RequestMapping( value="json/addPurchaseView/{prodNo}", method=RequestMethod.GET )
	public String insertProduct( @PathVariable String prodNo ) throws Exception{
	
		System.out.println("/product/addPurchaseView : POST");
		productService.findProduct(prodNo);
		
				//"redirect:/user/addUserView.jsp";
		return "스트링 리턴이지롱";
	}
	
	@RequestMapping( value="json/getPurchase/{prodNo}/{tranNo}", method=RequestMethod.POST )
	public Purchase findProduct( @PathVariable String prodNo,
												@PathVariable int tranNo) throws Exception{
		
		System.out.println("/product/findProduct : POST");
		Purchase vo = purchaseService.getPurchase(tranNo);;
		vo.setPurchaseProd(productService.findProduct(prodNo));
		
		return vo;

	}
	
	@RequestMapping( value="json/listPurchase", method=RequestMethod.POST )
	public Map getProductList( @RequestBody Search search,
													HttpServletRequest request,
													HttpSession session ) throws Exception{
		
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		// Business logic 수행
		Map<String , Object> map=purchaseService.getPurchaseList(search, "user02");
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		
		return map;

	}
	
	@RequestMapping( value="json/updatePurchase/{tranNo}", method=RequestMethod.POST )
	public Purchase updatePurchase( @RequestBody Purchase purchase,
													      @PathVariable int tranNo  ) throws Exception{
	
		System.out.println("/purchase/updatePurchase : POST");
		purchase = purchaseService.getPurchase(tranNo);
		
		return purchase;
	}
	
	@RequestMapping( value="json/updatePurchaseView", method=RequestMethod.POST )
	public Purchase updatePurchaseView( @RequestBody Purchase purchase ) throws Exception{
	
		System.out.println("/purchase/updatePurchaseView : POST");
		purchaseService.updatePurchase(purchase);
		purchase = purchaseService.getPurchase(purchase.getTranNo());
		return purchase;
	}
	
	@RequestMapping( value="json/updateTranCode/{prodNo}/{tranCode}", method=RequestMethod.POST )
	public Purchase updateTranCode( @RequestBody Purchase purchase,
														   @PathVariable int prodNo,
														   @PathVariable String tranCode) throws Exception{
	
		System.out.println("/purchase/updateTranCode : POST");
		purchase = purchaseService.findTranInfo(prodNo);
		if ( purchase.getTranCode().equals("002")) {
			purchase.setTranCode("003");
		}else if( purchase.getTranCode().equals("003")) {
			purchase.setTranCode("004");
		}
		purchaseService.updateTranCode(purchase);
		
		return purchase;
	}
	
}