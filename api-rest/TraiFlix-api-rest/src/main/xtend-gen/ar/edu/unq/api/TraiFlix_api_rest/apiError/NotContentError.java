package ar.edu.unq.api.TraiFlix_api_rest.apiError;

import ar.edu.unq.api.TraiFlix_api_rest.apiError.ApiError;

@SuppressWarnings("all")
public class NotContentError extends ApiError {
  public NotContentError() {
    super("NotContentError", Integer.valueOf(204), "NOT_CONTENT");
  }
}
