package hello;

import org.springframework.web.bind.annotation.*;

@RestController
public class HelloController {

	@RequestMapping("/")
	public String index() {
		return "Hello World!";
	}
	
}
