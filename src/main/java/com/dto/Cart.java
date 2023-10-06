package com.dto;



public class Cart {
	private String productId; //상품 아이디
	private Integer CartCnt; //장바구니에 담은 수
	
	
	public Cart(String productId, Integer CartCnt) {
		this.productId = productId;
		this.CartCnt = CartCnt;
	}
	
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public Integer getCartCnt() {
		return CartCnt;
	}

	public void setCartCnt(Integer cartCnt) {
		CartCnt = cartCnt;
	}
	
	
	@Override
	public String toString() {
		return "Cart [productId=" + productId + ", CartCnt=" + CartCnt + "]";
	}



}
