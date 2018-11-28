package ar.edu.unq.api.TraiFlix_api_rest.domain_rest

import java.util.List
import ar.edu.unq.TraiFlix.models.Ratingable
import ar.edu.unq.TraiFlix.models.Movie
import ar.edu.unq.TraiFlix.models.Serie
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RecommendToShow extends DataShower{
	
	new(List<Ratingable> recommends){
		super();
		var movies = recommends.filter[m | m.contentId.isMovie].map[m| m as Movie].toList();
		var series = recommends.filter[s | s.contentId.isSerie].map[s| s as Serie].toList();
		this.data.addAll(this.convertMoviesInDataToShowOfContent(movies))
		this.data.addAll(this.convertSeriesInDataToShowOfContent(series))
	}
	
}