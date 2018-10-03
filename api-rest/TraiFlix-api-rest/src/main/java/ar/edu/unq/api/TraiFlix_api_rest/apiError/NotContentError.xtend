package ar.edu.unq.api.TraiFlix_api_rest.apiError

class NotContentError extends ApiError{
	
	new() {
		super("NotContentError", 204, "NOT_CONTENT")
	}
	
}