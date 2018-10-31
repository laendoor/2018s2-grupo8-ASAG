package ar.edu.unq.api.TraiFlix_api_rest.apiError;

import ar.edu.unq.api.TraiFlix_api_rest.apiError.ApiError;

@SuppressWarnings("all")
public class InvalidJSONError extends ApiError {
  public InvalidJSONError() {
    super("InvalidJSONError", Integer.valueOf(400), "BAD_REQUEST");
  }
}
