package ar.edu.unq.TraiFlix.models.bootstrap

import ar.edu.unq.TraiFlix.models.Movie
import java.util.List
import ar.edu.unq.TraiFlix.models.id.ContentId

class MovieBootstrap  implements Bootstrap<Movie>{
	
	
	List<Movie> movies
	
	private static MovieBootstrap instance = null
	
	private new (){
		movies = newArrayList()
		
		
	}
	
	
	static def getInstance() {
		if (instance == null) {
			instance = new MovieBootstrap
		}
		instance
	}
	
	
	override add(Movie instanceT) {
		movies.add(instanceT)
	}
	
	override delete(Movie instanceT) {
		movies = movies.filter[elem | !(elem.id.equals(instanceT.id))].toList
	}
	
	override find(ContentId keyT) {
		movies.findFirst[elem | elem.id.equals(keyT)]
	}
	
	override load() {
		movies
	}
	
		
	
}