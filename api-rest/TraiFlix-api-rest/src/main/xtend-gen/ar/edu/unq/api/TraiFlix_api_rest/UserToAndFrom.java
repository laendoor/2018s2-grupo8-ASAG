package ar.edu.unq.api.TraiFlix_api_rest;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class UserToAndFrom {
  private String userFrom;
  
  private String userTo;
  
  public UserToAndFrom() {
  }
  
  public UserToAndFrom(final String user1, final String user2) {
    this.userFrom = user1;
    this.userTo = user2;
  }
  
  @Pure
  public String getUserFrom() {
    return this.userFrom;
  }
  
  public void setUserFrom(final String userFrom) {
    this.userFrom = userFrom;
  }
  
  @Pure
  public String getUserTo() {
    return this.userTo;
  }
  
  public void setUserTo(final String userTo) {
    this.userTo = userTo;
  }
}
