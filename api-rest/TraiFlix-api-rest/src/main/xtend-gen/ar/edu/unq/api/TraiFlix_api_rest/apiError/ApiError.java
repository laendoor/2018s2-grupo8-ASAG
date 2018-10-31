package ar.edu.unq.api.TraiFlix_api_rest.apiError;

@SuppressWarnings("all")
public class ApiError extends Error {
  private String name;
  
  private Integer status;
  
  private String errorCode;
  
  public ApiError(final String name, final Integer status, final String errorCode) {
    super(name);
    this.name = name;
    this.status = status;
    this.errorCode = errorCode;
  }
}
