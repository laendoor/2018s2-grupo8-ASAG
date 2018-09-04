package ar.edu.unq.TraiFlix.models;

import ar.edu.unq.TraiFlix.models.Actor;
import ar.edu.unq.TraiFlix.models.Assessment;
import ar.edu.unq.TraiFlix.models.Director;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Content {
  private Integer id;
  
  private String title;
  
  private Date release;
  
  private List<Assessment> assessments;
  
  private Calendar duration;
  
  private List<Director> directors;
  
  private List<Actor> actors;
  
  private String link;
  
  public Content() {
    this.assessments = CollectionLiterals.<Assessment>newArrayList();
    this.directors = CollectionLiterals.<Director>newArrayList();
    this.actors = CollectionLiterals.<Actor>newArrayList();
  }
  
  public boolean addAssessment(final Assessment critic) {
    return this.assessments.add(critic);
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
  public Date getRelease() {
    return this.release;
  }
  
  public void setRelease(final Date release) {
    this.release = release;
  }
  
  @Pure
  public List<Assessment> getAssessments() {
    return this.assessments;
  }
  
  public void setAssessments(final List<Assessment> assessments) {
    this.assessments = assessments;
  }
  
  @Pure
  public Calendar getDuration() {
    return this.duration;
  }
  
  public void setDuration(final Calendar duration) {
    this.duration = duration;
  }
  
  @Pure
  public List<Director> getDirectors() {
    return this.directors;
  }
  
  public void setDirectors(final List<Director> directors) {
    this.directors = directors;
  }
  
  @Pure
  public List<Actor> getActors() {
    return this.actors;
  }
  
  public void setActors(final List<Actor> actors) {
    this.actors = actors;
  }
  
  @Pure
  public String getLink() {
    return this.link;
  }
  
  public void setLink(final String link) {
    this.link = link;
  }
}
