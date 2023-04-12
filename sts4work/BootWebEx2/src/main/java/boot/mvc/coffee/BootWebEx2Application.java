package boot.mvc.coffee;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"boot.*"})
public class BootWebEx2Application {

	public static void main(String[] args) {
		SpringApplication.run(BootWebEx2Application.class, args);
	}

}
