package ar.edu.unq.api.TraiFlix_api_rest.apiError

class BadRequestError extends ApiError{
	
	new() {
		super("BadRequestError", 400, "BAD_REQUEST");
	}
	
}