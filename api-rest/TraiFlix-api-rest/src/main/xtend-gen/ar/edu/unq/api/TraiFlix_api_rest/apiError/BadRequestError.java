package ar.edu.unq.api.TraiFlix_api_rest.apiError;

import ar.edu.unq.api.TraiFlix_api_rest.apiError.ApiError;

@SuppressWarnings("all")
public class BadRequestError extends ApiError {
  public BadRequestError() {
    super("BadRequestError", Integer.valueOf(400), "BAD_REQUEST");
  }
}
