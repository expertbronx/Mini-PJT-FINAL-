package com.model2.mvc.service.product.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDao;

@Repository("productDaoImpl")
public class ProductDaoImpl implements ProductDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public ProductDaoImpl(){
		System.out.println(this.getClass());
	}

	public void insertProduct(Product productVO) throws Exception {
		sqlSession.insert("ProductMapper.insertProduct", productVO);
	}

	public Product findProduct(String prodNo) throws Exception {
		return sqlSession.selectOne("ProductMapper.findProduct", prodNo);
	}
	
	public List<Product> getProductList(Search search) throws Exception {
		return  sqlSession.selectList("ProductMapper.getProductList", search);
	}
	
	public List<Product> getTopProduct(Search search) throws Exception {
		return  sqlSession.selectList("ProductMapper.getTopProduct", search);
	}
	
	public void updateProduct(Product productVO) throws Exception {
		sqlSession.update("ProductMapper.updateProduct", productVO);
	}
	
	public void minusQuantity(Product productVO) throws Exception {
		sqlSession.update("ProductMapper.minusQuantity", productVO);
	}
	
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ProductMapper.getTotalCount", search);
	}
	
}
	