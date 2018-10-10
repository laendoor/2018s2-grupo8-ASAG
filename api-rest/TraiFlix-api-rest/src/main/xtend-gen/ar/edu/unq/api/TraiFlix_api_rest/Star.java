package ar.edu.unq.api.TraiFlix_api_rest;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Star {
  private Integer value;
  
  private String critic;
  
  @Pure
  public Integer getValue() {
    return this.value;
  }
  
  public void setValue(final Integer value) {
    this.value = value;
  }
  
  @Pure
  public String getCritic() {
    return this.critic;
  }
  
  public void setCritic(final String critic) {
    this.critic = critic;
  }
}
