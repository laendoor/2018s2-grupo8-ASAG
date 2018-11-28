package ar.edu.unq.api.TraiFlix_api_rest.domain_rest;

import ar.edu.unq.TraiFlix.models.Favourable;
import ar.edu.unq.TraiFlix.models.Movie;
import ar.edu.unq.TraiFlix.models.Serie;
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.DataShower;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@Accessors
@SuppressWarnings("all")
public class FavouriteToShow extends DataShower {
  public FavouriteToShow(final List<Favourable> favs) {
    super();
    final Function1<Favourable, Boolean> _function = (Favourable m) -> {
      return Boolean.valueOf(m.contentId().isMovie());
    };
    final Function1<Favourable, Movie> _function_1 = (Favourable m) -> {
      return ((Movie) m);
    };
    List<Movie> movies = IterableExtensions.<Movie>toList(IterableExtensions.<Favourable, Movie>map(IterableExtensions.<Favourable>filter(favs, _function), _function_1));
    final Function1<Favourable, Boolean> _function_2 = (Favourable s) -> {
      return Boolean.valueOf(s.contentId().isSerie());
    };
    final Function1<Favourable, Serie> _function_3 = (Favourable s) -> {
      return ((Serie) s);
    };
    List<Serie> series = IterableExtensions.<Serie>toList(IterableExtensions.<Favourable, Serie>map(IterableExtensions.<Favourable>filter(favs, _function_2), _function_3));
    this.getData().addAll(this.convertMoviesInDataToShowOfContent(movies));
    this.getData().addAll(this.convertSeriesInDataToShowOfContent(series));
  }
}
