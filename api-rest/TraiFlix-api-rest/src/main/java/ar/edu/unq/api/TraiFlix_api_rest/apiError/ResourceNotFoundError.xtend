package ar.edu.unq.api.TraiFlix_api_rest.apiError

class ResourceNotFoundError extends ApiError{
	
	new() {
		super("ResourceNotFoundError", 404, "RESOURCE_NOT_FOUND")
	}
	
}