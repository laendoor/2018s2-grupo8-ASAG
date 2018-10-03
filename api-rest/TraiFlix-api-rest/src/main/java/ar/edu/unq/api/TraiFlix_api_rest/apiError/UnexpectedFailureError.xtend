package ar.edu.unq.api.TraiFlix_api_rest.apiError

class UnexpectedFailureError extends ApiError{
	
	new() {
		super("UnexpectedFailureError", 500, "UNEXPECTED_FAILURE")
	}
	
}