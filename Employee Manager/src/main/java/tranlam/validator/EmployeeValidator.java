package tranlam.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import tranlam.model.*;

public class EmployeeValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		return Employee.class.equals(arg0);
	}

	@Override
	public void validate(Object object, Errors errors) {
		Employee empl = (Employee) object;
		
		if (empl.getNameEmployee().trim().length() == 0) {
			errors.rejectValue("nameEmployee", "employee.nameEmployee");
		}
		if (empl.getEmail().trim().length() == 0) {
			errors.rejectValue("email", "employee.email");
		}
		if (empl.getAddress().trim().length() == 0) {
			errors.rejectValue("address", "employee.address");
		}
		if (empl.getNumberPhone().trim().length() == 0) {
			errors.rejectValue("numberPhone", "employee.numberPhone");
		} else if (empl.getNumberPhone().indexOf(" ") > 0) {
			errors.rejectValue("numberPhone", "message.spacebar");
		}
		if (empl.getGender() == 0) {
			errors.rejectValue("gender", "employee.gender");
		}
		if (empl.getPhoto().trim().length() == 0) {
			errors.rejectValue("photo", "employee.photo");
		} else if (!empl.getPhoto().endsWith(".jpg") && !empl.getPhoto().endsWith(".png")) {
			errors.rejectValue("photo", "employee.photo.format");
		}

	}

}
