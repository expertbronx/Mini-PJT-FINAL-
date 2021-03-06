package com.model2.mvc.service.product;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;


public interface ProductService {
	
	public void insertProduct(Product productVO) throws Exception;
	
	public Product findProduct(String prodName) throws Exception;
	
	public Map<String, Object> getProductList(Search search) throws Exception;
	
	public Map<String, Object> getTopProduct(Search search) throws Exception;
	
	public void updateProduct(Product productVO) throws Exception;
	
	public void minusQuantity(Product productVO) throws Exception;
	
}