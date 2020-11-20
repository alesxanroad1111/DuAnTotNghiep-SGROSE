package tranlam.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import tranlam.model.Record;

public class RecordValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		return Record.class.equals(arg0);
	}

	@Override
	public void validate(Object object, Errors errors) {
		Record record = (Record) object;
		if (record.getReason().trim().length() == 0) {
			errors.rejectValue("reason", "record.reason");
		}
	}

}
