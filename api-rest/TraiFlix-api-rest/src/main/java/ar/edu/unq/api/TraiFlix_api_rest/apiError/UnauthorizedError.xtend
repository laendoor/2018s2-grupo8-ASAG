package ar.edu.unq.api.TraiFlix_api_rest.apiError

class UnauthorizedError extends ApiError{
	
	new() {
		super("UnauthorizedError", 401, "USER_NOT_AUTHORIZED")
	}
	
}