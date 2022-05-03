package com.model2.mvc.web.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping( value="json/addProduct", method=RequestMethod.POST )
	public void insertProduct( @RequestBody Product product ) throws Exception{
	
		System.out.println("/product/insertProduct : POST");
		productService.insertProduct(product);
		
				//"redirect:/user/addUserView.jsp";
	}
	
	@RequestMapping( value="json/findProduct/{prodName}", method=RequestMethod.POST )
	public Product findProduct( @PathVariable String prodName ) throws Exception{
	
		System.out.println("/product/findProduct : POST");
		Product vo = productService.findProduct(prodName);
		
		return vo;

	}
	
	@RequestMapping( value="json/getProductList", method=RequestMethod.POST )
	public Map getProductList( @RequestBody Search search ) throws Exception{
		
		System.out.println("/product/getProductList : POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		return map;

	}
	
	@RequestMapping( value="json/updateProduct", method=RequestMethod.POST )
	public void updateProduct( @RequestBody Product product ) throws Exception{
	
		System.out.println("/product/insertProduct : POST");
		productService.updateProduct(product);
		

	}
	
}