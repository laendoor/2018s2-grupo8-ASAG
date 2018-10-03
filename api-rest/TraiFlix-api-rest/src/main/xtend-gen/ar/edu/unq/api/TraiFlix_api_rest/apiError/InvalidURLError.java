package ar.edu.unq.api.TraiFlix_api_rest.apiError;

import ar.edu.unq.api.TraiFlix_api_rest.apiError.ApiError;

@SuppressWarnings("all")
public class InvalidURLError extends ApiError {
  public InvalidURLError() {
    super("InvalidURLError", Integer.valueOf(404), "RESOURCE_NOT_FOUND");
  }
}
