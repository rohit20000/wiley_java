package StringClasses;

import java.util.Arrays;
import java.util.List;

public class StringFormat {
	public static void main(String[] args) {
		
		String title = "Java Developer";
		float salary = 2000.3999f;
		//System.out.format("%s has %.3f USD salary%n", title, salary);
		
		// Left justification
		List<String> techStack = Arrays.asList(
				"Essential Java",
				"Head First Java",
				"Java Design Patterns"
				);
		
		for(String book: techStack) {
			System.out.format("%-40s - In Stock%n", book);
		}
	}
}
