package ar.edu.unq.api.TraiFlix_api_rest.domain_rest;

import ar.edu.unq.TraiFlix.models.Movie;
import ar.edu.unq.TraiFlix.models.Serie;
import ar.edu.unq.TraiFlix.models.id.ContentId;
import ar.edu.unq.TraiFlix.models.id.MovieId;
import ar.edu.unq.TraiFlix.models.id.SerieId;
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.DataToShowOfContent;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public abstract class DataShower {
  private List<DataToShowOfContent> data;
  
  public DataShower() {
    ArrayList<DataToShowOfContent> _arrayList = new ArrayList<DataToShowOfContent>();
    this.data = _arrayList;
  }
  
  public List<DataToShowOfContent> convertMoviesInDataToShowOfContent(final List<Movie> movies) {
    final Function1<Movie, DataToShowOfContent> _function = (Movie m) -> {
      MovieId _id = m.getId();
      String _title = m.getTitle();
      String _link = m.getLink();
      Date _release = m.getRelease();
      return new DataToShowOfContent(
        ((ContentId) _id), _title, _link, _release);
    };
    return IterableExtensions.<DataToShowOfContent>toList(ListExtensions.<Movie, DataToShowOfContent>map(movies, _function));
  }
  
  public List<DataToShowOfContent> convertSeriesInDataToShowOfContent(final List<Serie> series) {
    final Function1<Serie, DataToShowOfContent> _function = (Serie s) -> {
      SerieId _id = s.getId();
      String _title = s.getTitle();
      String _link = s.getEpisodes().get(0).getLink();
      Date _release = s.getEpisodes().get(0).getRelease();
      return new DataToShowOfContent(
        ((ContentId) _id), _title, _link, _release);
    };
    return IterableExtensions.<DataToShowOfContent>toList(ListExtensions.<Serie, DataToShowOfContent>map(series, _function));
  }
  
  @Pure
  public List<DataToShowOfContent> getData() {
    return this.data;
  }
  
  public void setData(final List<DataToShowOfContent> data) {
    this.data = data;
  }
}
