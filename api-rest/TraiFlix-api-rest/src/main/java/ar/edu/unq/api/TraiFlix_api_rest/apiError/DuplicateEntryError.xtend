package ar.edu.unq.api.TraiFlix_api_rest.apiError

class DuplicateEntryError extends ApiError{
	
	new() {
		super("DuplicateEntryError", 409, "RESOURCE_ALREADY_EXISTS")
	}
	
}