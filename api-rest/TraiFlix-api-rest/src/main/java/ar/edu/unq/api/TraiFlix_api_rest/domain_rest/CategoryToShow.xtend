package ar.edu.unq.api.TraiFlix_api_rest.domain_rest	


import org.eclipse.xtend.lib.annotations.Accessors	
import java.util.List	

import ar.edu.unq.TraiFlix.models.Movie
import ar.edu.unq.TraiFlix.models.Serie
import ar.edu.unq.TraiFlix.models.id.ContentId
import java.util.ArrayList

@Accessors	
class CategoryToShow extends DataShower{	
	String category	
	
	new(String cat, List<Movie> movies, List<Serie> series){
		super();
		this.category = cat;
		this.data.addAll(this.convertMoviesInDataToShowOfContent(movies));
		this.data.addAll(this.convertSeriesInDataToShowOfContent(series));
	}
		
	 	
}