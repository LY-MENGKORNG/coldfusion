component accessors="true" {

	/**
	 * Request parameters
	 */
	property struct rc;

	/**
	 * Validation errors
	 */
	property array errors;

	/**
	 * Constructor
	 *
	 * @param	 rc	 Request Context
	 * @return		 Validator
	 */
	public function init(required struct rc) {
		variables.rc = arguments.rc;
		variables.errors = [];
		return this;
	}

	/**
	 * Validation
	 * @return false if validation failed
	 */
	public boolean function fails() {
		if (!structKeyExists(variables.rc, "username")) {
			arrayAppend(variables.errors, "username is missing");
		}

		if (!structKeyExists(variables.rc, "roleId")) {
			arrayAppend(variables.errors, "roleId is missing");
		}
        if (!structKeyExists(variables.rc, "password")) {
			arrayAppend(variables.errors, "password is missing");
		}
		if (!structKeyExists(variables.rc, "email")) {
			arrayAppend(variables.errors, "email is missing");
		}

        return !arrayIsEmpty(variables.errors);
	}

}