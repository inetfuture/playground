package hello;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;

@EnableAutoConfiguration
public class Application implements CommandLineRunner {

	@Autowired
	private CustomerRepository repository;
	
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

	public void run(String... args) throws Exception {
		repository.deleteAll();
		
		repository.save(new Customer("Aaron", "Wang"));
		repository.save(new Customer("Charles", "Petzold"));
		
		System.out.println("Customers found with findAll():");
		for (Customer customer : repository.findAll()) {
			System.out.println(customer);
		}
		System.out.println();
		
		System.out.println("Customers found with findByFirstName('Aaron'):");
		System.out.println(repository.findByFirstName("Aaron"));
	}
	
}
