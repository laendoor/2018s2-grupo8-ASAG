package ar.edu.unq.api.TraiFlix_api_rest.domain_rest

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import ar.edu.unq.TraiFlix.models.Movie
import ar.edu.unq.TraiFlix.models.id.ContentId
import ar.edu.unq.TraiFlix.models.Serie

@Accessors
abstract class DataShower {
	List<DataToShowOfContent> data;
	
	new(){
		this.data = new ArrayList();
	}
	
	def convertMoviesInDataToShowOfContent(List<Movie> movies){
		movies.map[m| new DataToShowOfContent(
			m.id as ContentId, m.getTitle(), m.link, m.release, 
			m.rating
		)
		].toList;
	}
	
	def convertSeriesInDataToShowOfContent(List<Serie> series){
		series.map[s| new DataToShowOfContent(
			s.id as ContentId, s.getTitle(), s.episodes.get(0).link, s.episodes.get(0).release, 
			s.rating
		)
		].toList;
	}
		
}