package ar.edu.unq.api.TraiFlix_api_rest.apiError

class InvalidURLError extends ApiError{
	
	new() {
		super("InvalidURLError", 404, "RESOURCE_NOT_FOUND")
	}
	
}