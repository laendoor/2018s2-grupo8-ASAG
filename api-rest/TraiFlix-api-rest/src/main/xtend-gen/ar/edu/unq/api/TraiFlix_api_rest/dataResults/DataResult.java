package ar.edu.unq.api.TraiFlix_api_rest.dataResults;

import com.fasterxml.jackson.annotation.JsonProperty;

@SuppressWarnings("all")
public class DataResult {
  private Object data;
  
  public DataResult(final Object data) {
    this.data = data;
  }
  
  @JsonProperty
  public Object data() {
    return this.data;
  }
}
