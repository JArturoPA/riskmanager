package com.packt.webstore.domain.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.packt.webstore.domain.Customer;

@Repository
public class InMemoryCustomerRepository implements CustomerRepository{
	List<Customer> listOfCustomers = new ArrayList<Customer>();
	
	public InMemoryCustomerRepository(){
		Customer customer1 = new Customer("1", "Arturo Pérez", "México, D.F.", 10);
		Customer customer2 = new Customer("2", "Laura Flores", "México, D.F.", 3);
		Customer customer3 = new Customer("3", "Tito Toti", "Jalisco", 1);
		
		listOfCustomers.add(customer1);
		listOfCustomers.add(customer2);
		listOfCustomers.add(customer3);
	}
	public List<Customer> getAllCustomers() {
		return listOfCustomers;
	}

}
