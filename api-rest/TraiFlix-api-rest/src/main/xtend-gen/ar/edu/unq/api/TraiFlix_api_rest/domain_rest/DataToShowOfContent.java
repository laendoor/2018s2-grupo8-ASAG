package ar.edu.unq.api.TraiFlix_api_rest.domain_rest;

import ar.edu.unq.TraiFlix.models.id.ContentId;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class DataToShowOfContent {
  private ContentId id;
  
  private String title;
  
  private String link;
  
  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy")
  private Date release;
  
  private Integer rating;
  
  public DataToShowOfContent(final ContentId id, final String title, final String link, final Date release, final Integer rating) {
    this.id = id;
    this.title = title;
    this.link = link;
    this.release = release;
    this.rating = rating;
  }
  
  @Pure
  public ContentId getId() {
    return this.id;
  }
  
  public void setId(final ContentId id) {
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
  public String getLink() {
    return this.link;
  }
  
  public void setLink(final String link) {
    this.link = link;
  }
  
  @Pure
  public Date getRelease() {
    return this.release;
  }
  
  public void setRelease(final Date release) {
    this.release = release;
  }
  
  @Pure
  public Integer getRating() {
    return this.rating;
  }
  
  public void setRating(final Integer rating) {
    this.rating = rating;
  }
}
