package tranlam.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import tranlam.model.Contract;

public class ContractValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		return Contract.class.equals(arg0);
	}

	@Override
	public void validate(Object object, Errors errors) {
		Contract contract = (Contract) object;
		if (contract.getNameContract().trim().length() == 0) {
			errors.rejectValue("nameContract", "contract.nameContract");
		}
		if (contract.getSubsidize() == 0) {
			errors.rejectValue("subsidize", "contract.subsidize");
		}
		if (contract.getInsurrance() == 0) {
			errors.rejectValue("insurrance", "contract.insurrance");
		}
	}

}
