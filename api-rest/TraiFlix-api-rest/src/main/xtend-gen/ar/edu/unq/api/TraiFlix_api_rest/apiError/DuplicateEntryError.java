package ar.edu.unq.api.TraiFlix_api_rest.apiError;

import ar.edu.unq.api.TraiFlix_api_rest.apiError.ApiError;

@SuppressWarnings("all")
public class DuplicateEntryError extends ApiError {
  public DuplicateEntryError() {
    super("DuplicateEntryError", Integer.valueOf(409), "RESOURCE_ALREADY_EXISTS");
  }
}
