package ar.edu.unq.TraiFlix.models;

import ar.edu.unq.TraiFlix.models.User;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Assessment {
  private User user;
  
  private Integer value;
  
  private String observation;
  
  public Assessment(final User cli, final Integer valoration, final String critic) {
    this.user = cli;
    this.value = valoration;
    this.observation = critic;
  }
  
  @Pure
  public User getUser() {
    return this.user;
  }
  
  public void setUser(final User user) {
    this.user = user;
  }
  
  @Pure
  public Integer getValue() {
    return this.value;
  }
  
  public void setValue(final Integer value) {
    this.value = value;
  }
  
  @Pure
  public String getObservation() {
    return this.observation;
  }
  
  public void setObservation(final String observation) {
    this.observation = observation;
  }
}
