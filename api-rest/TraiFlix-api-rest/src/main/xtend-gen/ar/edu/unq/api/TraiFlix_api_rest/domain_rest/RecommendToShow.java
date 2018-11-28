package ar.edu.unq.api.TraiFlix_api_rest.domain_rest;

import ar.edu.unq.TraiFlix.models.Movie;
import ar.edu.unq.TraiFlix.models.Ratingable;
import ar.edu.unq.TraiFlix.models.Serie;
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.DataShower;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@Accessors
@SuppressWarnings("all")
public class RecommendToShow extends DataShower {
  public RecommendToShow(final List<Ratingable> recommends) {
    super();
    final Function1<Ratingable, Boolean> _function = (Ratingable m) -> {
      return Boolean.valueOf(m.contentId().isMovie());
    };
    final Function1<Ratingable, Movie> _function_1 = (Ratingable m) -> {
      return ((Movie) m);
    };
    List<Movie> movies = IterableExtensions.<Movie>toList(IterableExtensions.<Ratingable, Movie>map(IterableExtensions.<Ratingable>filter(recommends, _function), _function_1));
    final Function1<Ratingable, Boolean> _function_2 = (Ratingable s) -> {
      return Boolean.valueOf(s.contentId().isSerie());
    };
    final Function1<Ratingable, Serie> _function_3 = (Ratingable s) -> {
      return ((Serie) s);
    };
    List<Serie> series = IterableExtensions.<Serie>toList(IterableExtensions.<Ratingable, Serie>map(IterableExtensions.<Ratingable>filter(recommends, _function_2), _function_3));
    this.getData().addAll(this.convertMoviesInDataToShowOfContent(movies));
    this.getData().addAll(this.convertSeriesInDataToShowOfContent(series));
  }
}
