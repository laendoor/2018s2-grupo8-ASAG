package ar.edu.unq.TraiFlix.models;

import ar.edu.unq.TraiFlix.models.Assessment;
import ar.edu.unq.TraiFlix.models.Category;
import ar.edu.unq.TraiFlix.models.Clasification;
import ar.edu.unq.TraiFlix.models.Content;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Movie extends Content {
  private List<Category> categories;
  
  private Clasification clasification;
  
  private List<Content> relateds;
  
  public Movie() {
    super();
    this.categories = CollectionLiterals.<Category>newArrayList();
    this.relateds = CollectionLiterals.<Content>newArrayList();
  }
  
  public int getRating() {
    Integer sum = Integer.valueOf(0);
    List<Assessment> _assessments = this.getAssessments();
    for (final Assessment critc : _assessments) {
      Integer _value = critc.getValue();
      int _plus = ((sum).intValue() + (_value).intValue());
      sum = Integer.valueOf(_plus);
    }
    int _size = this.getAssessments().size();
    return ((sum).intValue() / _size);
  }
  
  @Pure
  public List<Category> getCategories() {
    return this.categories;
  }
  
  public void setCategories(final List<Category> categories) {
    this.categories = categories;
  }
  
  @Pure
  public Clasification getClasification() {
    return this.clasification;
  }
  
  public void setClasification(final Clasification clasification) {
    this.clasification = clasification;
  }
  
  @Pure
  public List<Content> getRelateds() {
    return this.relateds;
  }
  
  public void setRelateds(final List<Content> relateds) {
    this.relateds = relateds;
  }
}
