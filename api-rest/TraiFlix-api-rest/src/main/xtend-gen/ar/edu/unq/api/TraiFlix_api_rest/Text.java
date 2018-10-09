package ar.edu.unq.api.TraiFlix_api_rest;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Text {
  private String text;
  
  @Pure
  public String getText() {
    return this.text;
  }
  
  public void setText(final String text) {
    this.text = text;
  }
}
