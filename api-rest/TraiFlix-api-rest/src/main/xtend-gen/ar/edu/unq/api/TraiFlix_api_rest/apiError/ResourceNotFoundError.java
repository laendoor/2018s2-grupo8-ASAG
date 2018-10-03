package ar.edu.unq.api.TraiFlix_api_rest.apiError;

import ar.edu.unq.api.TraiFlix_api_rest.apiError.ApiError;

@SuppressWarnings("all")
public class ResourceNotFoundError extends ApiError {
  public ResourceNotFoundError() {
    super("ResourceNotFoundError", Integer.valueOf(404), "RESOURCE_NOT_FOUND");
  }
}
