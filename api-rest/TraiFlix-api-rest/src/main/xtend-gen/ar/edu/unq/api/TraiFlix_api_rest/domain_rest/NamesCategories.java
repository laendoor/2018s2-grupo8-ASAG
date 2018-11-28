package ar.edu.unq.api.TraiFlix_api_rest.domain_rest;

import ar.edu.unq.TraiFlix.models.Category;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.model.annotations.Observable;

@Accessors
@Observable
@SuppressWarnings("all")
public class NamesCategories {
  private List<String> names;
  
  public void setNamesToShow(final List<Category> categories) {
    final Function1<Category, String> _function = (Category c) -> {
      return c.getName();
    };
    this.names = IterableExtensions.<String>toList(ListExtensions.<Category, String>map(categories, _function));
  }
  
  @Pure
  public List<String> getNames() {
    return this.names;
  }
  
  public void setNames(final List<String> names) {
    this.names = names;
  }
}
