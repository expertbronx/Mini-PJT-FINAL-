package com.model2.mvc.web.product;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserService;



@Controller
@RequestMapping("/product/")
public class ProductController {
	
		private static final String FILE_SERVER_PATH = "C:\\workspace찐\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles";
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductController(){
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
	
	@RequestMapping(value = "goIndex", method = RequestMethod.GET)
	public String goIndex(  ) throws Exception {
		return "forward:/main.jsp";
}
	
	@RequestMapping(value = "addProductView", method = RequestMethod.GET)
		public String addProduct(  ) throws Exception {

	return "forward:/product/addProductView.jsp";
}
	
	@RequestMapping(value = "addProduct", method = RequestMethod.POST)
	public String addProduct( @ModelAttribute("pvo") Product product,
											  @RequestParam("fileInfo")  MultipartFile file,
													  Model model
													 ) throws Exception {
	
	if(!file.getOriginalFilename().isEmpty()) {
		file.transferTo(new File(FILE_SERVER_PATH, file.getOriginalFilename()));
		model.addAttribute("msg", "File uploaded successfully.");
	}else {
		model.addAttribute("msg", "Please select a valid mediaFile..");
	}
	product.setFileName(file.getOriginalFilename());
	productService.insertProduct(product);
	return "forward:/product/addProduct.jsp";
}
	
	@RequestMapping(value = "getProduct", method = RequestMethod.GET)
		public String getProduct( @RequestParam("prodNo")  String prodNo,
												 @RequestParam("currentPage") int currentPage,
															Model model,
															HttpServletRequest request,
															HttpServletResponse response) throws Exception {
	
		///////////////////////////////////역겨운 쿠키 코드///////////////////////////////////////////////////////////////////////////////////////////////
		String keep = "/";
		keep += request.getParameter("prodNo");

		Cookie[] cookies = request.getCookies();
		// 쿠키에 값이 있다면
		for(int i = 0; i<cookies.length; i++){
			String name = cookies[i].getName(); // 쿠키 이름
			String value = cookies[i].getValue(); // 쿠키 값 
				if(name.equals("history")){
			Cookie cookie = new Cookie("history", value + keep);
			response.addCookie(cookie);
				}else{
			Cookie cookie = new Cookie("history", "dddd/"+request.getParameter("prodNo"));
			response.addCookie(cookie);
			}
				System.out.println(cookies[i].getName() + cookies[i].getValue());
		}
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

			Product product = productService.findProduct(prodNo);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("vo", product);
		return "forward:/product/getProduct.jsp";
}
	
	
	@RequestMapping(value = "listProduct")
		public String listProduct( @ModelAttribute("search") Search search,
														@RequestParam("menu") String menu,
														HttpServletRequest request,
														Model model)  throws Exception {
		
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("map", map);
		model.addAttribute("searchVO", search);
		model.addAttribute("menu", menu);
		model.addAttribute("resultPage", resultPage);
		System.out.println("테스트 메뉴"+menu);
		return "forward:/product/listProduct.jsp";
	}
	
	@RequestMapping(value = "main")
	public String main( @ModelAttribute("search") Search search,
													HttpServletRequest request,
													Model model)  throws Exception {
	
	
	if(search.getCurrentPage() ==0 ){
		search.setCurrentPage(1);
	}
	search.setPageSize(pageSize);

	// Business logic 수행
	Map<String , Object> map=productService.getTopProduct(search);
	
	//System.out.println(map[0].Product.prodNo);

	model.addAttribute("map", map);
	return "forward:/main.jsp";
}
	
	@RequestMapping(value = "updateProductView", method = RequestMethod.GET)
		public String updateProductView( @RequestParam("prodNo") String prodNo,
															   @RequestParam("menu") String menu,
															    Model model) throws Exception {
		model.addAttribute("productVO", productService.findProduct(prodNo));
		model.addAttribute("menu", menu);
		return "forward:/product/updateProductView2.jsp";
	}
	
	@RequestMapping(value = "updateProduct", method = RequestMethod.POST)
		public String updateProduct( @ModelAttribute("product") Product product,
														@RequestParam("fileInfo")  MultipartFile file,
																	Model model ) throws Exception {
		
		if(!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(FILE_SERVER_PATH, file.getOriginalFilename()));
			model.addAttribute("msg", "File uploaded successfully.");
		}else {
			model.addAttribute("msg", "Please select a valid mediaFile..");
		}
		
		product.setFileName(file.getOriginalFilename());
		
		productService.updateProduct(product);
		product = productService.findProduct(Integer.toString(product.getProdNo()));
		
		model.addAttribute("vo", product);
		
		return "forward:/product/getProduct.jsp";
	}

	
}













