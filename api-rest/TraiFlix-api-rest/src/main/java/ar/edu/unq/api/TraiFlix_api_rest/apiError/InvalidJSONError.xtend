package ar.edu.unq.api.TraiFlix_api_rest.apiError

class InvalidJSONError extends ApiError{
	
	new() {
		super("InvalidJSONError", 400, "BAD_REQUEST")
	}
	
}