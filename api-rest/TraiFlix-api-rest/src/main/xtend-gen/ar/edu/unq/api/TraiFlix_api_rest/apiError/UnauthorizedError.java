package ar.edu.unq.api.TraiFlix_api_rest.apiError;

import ar.edu.unq.api.TraiFlix_api_rest.apiError.ApiError;

@SuppressWarnings("all")
public class UnauthorizedError extends ApiError {
  public UnauthorizedError() {
    super("UnauthorizedError", Integer.valueOf(401), "USER_NOT_AUTHORIZED");
  }
}
