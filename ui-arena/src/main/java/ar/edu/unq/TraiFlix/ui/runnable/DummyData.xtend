package ar.edu.unq.TraiFlix.ui.runnable

import ar.edu.unq.TraiFlix.models.Movie
import ar.edu.unq.TraiFlix.models.Serie
import java.util.ArrayList
import java.util.List
import ar.edu.unq.TraiFlix.models.Clasification
import ar.edu.unq.TraiFlix.models.Category
import ar.edu.unq.TraiFlix.models.Episode

class DummyData {

	
	def static createMovies() {
		var List<Movie> res = new ArrayList
		res.add(new Movie => [
			title = "Las tortugas pinja"
		] ) 
		return res
	}
	
		
	def static createSeries() {
		var List<Serie> series = new ArrayList
		
		series.add( new Serie => [
			title = "Breaking Bad"
			clasification = new Clasification("+18")
			addCategory( new Category("Destacadas") )
			creators = "Vince Gilligan"
			addEpisode( new Episode(it,1,1) => [
					title = "Pilot"
				] )
			addEpisode( new Episode(it,1,2) => [
					title = "Cat's in the bag..."
				] )			
		])
		
		series
	}
	
	
	def static createClassifications() {
		var List<Clasification> classifications = new ArrayList		
		classifications.add( new Clasification("ATP") )
		classifications.add( new Clasification("+13") )
		classifications.add( new Clasification("+16") )
		classifications.add( new Clasification("+18") )
		classifications
	}	
	
	
	def static createCategories() {		
		var List<Category> categories = new ArrayList
		categories.add( new Category("Estrenos") )
		categories.add( new Category("Destacadas") )
		categories.add( new Category("Pochocleras") )	
		categories		
	}
	
}
