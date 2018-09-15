package ar.edu.unq.TraiFlix.ui.runnable

import ar.edu.unq.TraiFlix.models.Movie
import ar.edu.unq.TraiFlix.models.Serie
import java.util.ArrayList
import java.util.List

import java.util.Calendar
import org.joda.time.JodaTimePermission
import org.joda.time.Period

import ar.edu.unq.TraiFlix.models.Clasification
import ar.edu.unq.TraiFlix.models.Category

import ar.edu.unq.TraiFlix.models.Episode

class DummyData {

	
	def static createMovies() {
		var List<Movie> res = new ArrayList
		res.add(new Movie => [
			title = "El Padrino"
			duration = new Period(0, 2, 16, 0)
			
			link = "https://www.youtube.com/watch?v=gCVj1LeYnsc"
			
		] ) 
				res.add(new Movie => [
			title = "Pulp Fiction"
			duration = new Period(0, 2, 41, 0)
			
			link = "https://www.youtube.com/watch?v=ZFYCXAG6fdo"
			
		] ) 
		return res
		}
		/* 
	def static createSeries() {
		var List<Serie> res = new ArrayList
		res.add(new Serie => [
			title = "Los 100"
			creators = "Jason Rothenberg"
			
			episodes.add(new Episode)
			episodes.add(new Episode)
			episodes.add(new Episode)
		] ) 
				 
		return res

		}

	*/
		
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
