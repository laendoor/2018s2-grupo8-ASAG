package ar.edu.unq.api.TraiFlix_api_rest;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class ContentToShow {
  private String title;
  
  private String realese;
  
  private String link;
  
  @Pure
  public String getTitle() {
    return this.title;
  }
  
  public void setTitle(final String title) {
    this.title = title;
  }
  
  @Pure
  public String getRealese() {
    return this.realese;
  }
  
  public void setRealese(final String realese) {
    this.realese = realese;
  }
  
  @Pure
  public String getLink() {
    return this.link;
  }
  
  public void setLink(final String link) {
    this.link = link;
  }
}
