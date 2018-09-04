package ar.edu.unq.TraiFlix.models;

import ar.edu.unq.TraiFlix.models.Assessment;
import ar.edu.unq.TraiFlix.models.Category;
import ar.edu.unq.TraiFlix.models.Clasification;
import ar.edu.unq.TraiFlix.models.Content;
import ar.edu.unq.TraiFlix.models.Episode;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Serie {
  private Integer id;
  
  private String title;
  
  private List<Category> categories;
  
  private Clasification clasification;
  
  private String creators;
  
  private List<Content> relateds;
  
  private List<Episode> episodes;
  
  public Serie() {
    super();
    this.categories = CollectionLiterals.<Category>newArrayList();
    this.relateds = CollectionLiterals.<Content>newArrayList();
    this.episodes = CollectionLiterals.<Episode>newArrayList();
  }
  
  public int getRating() {
    List<Assessment> assessments = CollectionLiterals.<Assessment>newArrayList();
    Integer sum = Integer.valueOf(0);
    for (final Episode epi : this.episodes) {
      assessments.addAll(epi.getAssessments());
    }
    for (final Assessment ass : assessments) {
      Integer _value = ass.getValue();
      int _plus = ((sum).intValue() + (_value).intValue());
      sum = Integer.valueOf(_plus);
    }
    if (((sum).intValue() != 0)) {
      int _size = assessments.size();
      return ((sum).intValue() / _size);
    }
    return 0;
  }
  
  @Pure
  public Integer getId() {
    return this.id;
  }
  
  public void setId(final Integer id) {
    this.id = id;
  }
  
  @Pure
  public String getTitle() {
    return this.title;
  }
  
  public void setTitle(final String title) {
    this.title = title;
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
  public String getCreators() {
    return this.creators;
  }
  
  public void setCreators(final String creators) {
    this.creators = creators;
  }
  
  @Pure
  public List<Content> getRelateds() {
    return this.relateds;
  }
  
  public void setRelateds(final List<Content> relateds) {
    this.relateds = relateds;
  }
  
  @Pure
  public List<Episode> getEpisodes() {
    return this.episodes;
  }
  
  public void setEpisodes(final List<Episode> episodes) {
    this.episodes = episodes;
  }
}
