package com.packt.webstore.domain;

public class Customer {
	private String customerId; 
	private String name;
	private String address;
	private int noOfOrdersMade;

	public Customer(){
		super();
	}
	
	public Customer(String customerId, String name, String address, int noOfOrdersMade){
		this.customerId = customerId;
		this.name = name;
		this.address = address;
		this.noOfOrdersMade = noOfOrdersMade;
	}

	/**
	 * @return the customerId
	 */
	public String getCustomerId() {
		return customerId;
	}

	/**
	 * @param customerId the customerId to set
	 */
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
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
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the noOfOrdersMade
	 */
	public int getNoOfOrdersMade() {
		return noOfOrdersMade;
	}

	/**
	 * @param noOfOrdersMade the noOfOrdersMade to set
	 */
	public void setNoOfOrdersMade(int noOfOrdersMade) {
		this.noOfOrdersMade = noOfOrdersMade;
	}
}
