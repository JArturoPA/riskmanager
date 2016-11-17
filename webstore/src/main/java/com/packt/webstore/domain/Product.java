package com.packt.webstore.domain;

import java.math.BigDecimal;

import javax.validation.constraints.*;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.springframework.web.multipart.MultipartFile;

@XmlRootElement
public class Product {
	@Pattern(regexp="P[0-9]+", message="{Pattern.Product.productId.validation}")
	private String productId;
	@Size(min=4, max=50, message="{Size.Product.name.validation}")
	private String name;
	@Min(value=0, message="{Min.Product.unitPrice.validation}")
	@Digits(integer=8, fraction=2, message="{Digits.Product.unitPrice.validation}")
	@NotNull(message="{NotNull.Product.unitPrice.validation}")
	private BigDecimal unitPrice;
	private String description;
	private String manufacturer;
	@NotNull(message="{NotNull.Product.category.validation}")
	private String category;
	@Min(value=0, message="{Min.Product.unitsItStock.validation}")
	private long unitsInStock;
	private long unitsInOrder;
	private boolean discontinued;
	private String condition;
	
	@JsonIgnore
	private MultipartFile productImage;
	private MultipartFile productPDF;
	
	public Product(){
		super();
	}
	
	public Product(String productId, String name, BigDecimal unitPrice){
		this.productId = productId;
		this.name = name;
		this.unitPrice = unitPrice;
	}

	// add setters and getters for all the fields here
	/**
	 * @return the productId
	 */
	public String getProductId() {
		return productId;
	}

	/**
	 * @param productId the productId to set
	 */
	public void setProductId(String productId) {
		this.productId = productId;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the unitPrice
	 */
	public BigDecimal getUnitPrice() {
		return unitPrice;
	}

	/**
	 * @param unitPrice the unitPrice to set
	 */
	public void setUnitPrice(BigDecimal unitPrice) {
		this.unitPrice = unitPrice;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the manufacturer
	 */
	public String getManufacturer() {
		return manufacturer;
	}

	/**
	 * @param manufacturer the manufacturer to set
	 */
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	/**
	 * @return the category
	 */
	public String getCategory() {
		return category;
	}

	/**
	 * @param category the category to set
	 */
	public void setCategory(String category) {
		this.category = category;
	}

	/**
	 * @return the unitsInStock
	 */
	public long getUnitsInStock() {
		return unitsInStock;
	}

	/**
	 * @param unitsInStock the unitsInStock to set
	 */
	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	/**
	 * @return the unitsInOrder
	 */
	public long getUnitsInOrder() {
		return unitsInOrder;
	}

	/**
	 * @param unitsInOrder the unitsInOrder to set
	 */
	public void setUnitsInOrder(long unitsInOrder) {
		this.unitsInOrder = unitsInOrder;
	}

	/**
	 * @return the discontinued
	 */
	public boolean isDiscontinued() {
		return discontinued;
	}

	/**
	 * @param discontinued the discontinued to set
	 */
	public void setDiscontinued(boolean discontinued) {
		this.discontinued = discontinued;
	}

	/**
	 * @return the condition
	 */
	public String getCondition() {
		return condition;
	}

	/**
	 * @param condition the condition to set
	 */
	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	/**
	 * @return the productImage
	 */
	@XmlTransient
	public MultipartFile getProductImage() {
		return productImage;
	}

	/**
	 * @param productImage the productImage to set
	 */
	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	/**
	 * @return the productPDF
	 */
	@XmlTransient
	public MultipartFile getProductPDF() {
		return productPDF;
	}

	/**
	 * @param productPDF the productPDF to set
	 */
	public void setProductPDF(MultipartFile productPDF) {
		this.productPDF = productPDF;
	}

	@Override
	public boolean equals(Object obj){
		if(this == obj) return true;
		
		if(obj == null) return false;
		
		if(getClass() != obj.getClass()) return false;
		
		Product other = (Product) obj;
		if(productId == null){
			if(other.productId == null) 
				return false;
		}else if(!productId.equals(other.productId)){
			return false;
		}
		
		return true;
	}
	
	@Override
	public int hashCode(){
		final int prime = 31;
		int result = 1;
		result = prime*result + ((productId == null) ? 0 : productId.hashCode());
		return result;
	}
	
	@Override
	public String toString(){
		return "Product [productId = " + productId + ", name = " + name + "]";
	}
}
