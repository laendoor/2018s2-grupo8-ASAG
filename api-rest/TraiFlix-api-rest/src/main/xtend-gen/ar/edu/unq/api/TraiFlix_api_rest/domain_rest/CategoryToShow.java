package ar.edu.unq.api.TraiFlix_api_rest.domain_rest;

import ar.edu.unq.TraiFlix.models.Movie;
import ar.edu.unq.TraiFlix.models.Serie;
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.DataShower;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class CategoryToShow extends DataShower {
  private String category;
  
  public CategoryToShow(final String cat, final List<Movie> movies, final List<Serie> series) {
    super();
    this.category = cat;
    this.getData().addAll(this.convertMoviesInDataToShowOfContent(movies));
    this.getData().addAll(this.convertSeriesInDataToShowOfContent(series));
  }
  
  @Pure
  public String getCategory() {
    return this.category;
  }
  
  public void setCategory(final String category) {
    this.category = category;
  }
}
