package ar.edu.unq.api.TraiFlix_api_rest.domain_rest;

import ar.edu.unq.TraiFlix.models.Relatable;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Searched {
  private String category;
  
  private List<Relatable> data;
  
  @Pure
  public String getCategory() {
    return this.category;
  }
  
  public void setCategory(final String category) {
    this.category = category;
  }
  
  @Pure
  public List<Relatable> getData() {
    return this.data;
  }
  
  public void setData(final List<Relatable> data) {
    this.data = data;
  }
}
