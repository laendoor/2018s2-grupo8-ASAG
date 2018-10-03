package ar.edu.unq.api.TraiFlix_api_rest.apiError;

import ar.edu.unq.api.TraiFlix_api_rest.apiError.ApiError;

@SuppressWarnings("all")
public class UnexpectedFailureError extends ApiError {
  public UnexpectedFailureError() {
    super("UnexpectedFailureError", Integer.valueOf(500), "UNEXPECTED_FAILURE");
  }
}
