package ar.edu.unq.TraiFlix.models;

import ar.edu.unq.TraiFlix.models.Assessment;
import ar.edu.unq.TraiFlix.models.Content;
import java.util.List;

@SuppressWarnings("all")
public class Episode extends Content {
  private Integer season;
  
  private Integer EpisodeNumber;
  
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
}
