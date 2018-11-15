package ar.edu.unq.api.TraiFlix_api_rest.domain_rest;

import ar.edu.unq.TraiFlix.models.Ratingable;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class CategoryToShow {
  private String category;
  
  private List<Ratingable> data;
  
  @Pure
  public String getCategory() {
    return this.category;
  }
  
  public void setCategory(final String category) {
    this.category = category;
  }
  
  @Pure
  public List<Ratingable> getData() {
    return this.data;
  }
  
  public void setData(final List<Ratingable> data) {
    this.data = data;
  }
}
