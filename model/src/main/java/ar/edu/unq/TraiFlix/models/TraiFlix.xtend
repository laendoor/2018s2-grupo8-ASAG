package ar.edu.unq.TraiFlix.models

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class TraiFlix {
	
	List<Movie> movies;
	List<Serie> series;
	List<User> users;
	
	
	new(){
		movies = new ArrayList()
		series = new ArrayList()
		users = new ArrayList()
	}
	
	
	def setNewMovie(Movie movie) {
		movies.add(movie);
	}
	
	def setNewSerie(Serie serie) {
		series.add(serie);
	}
	
	def setNewUser(User user) {
		users.add(user);
	}
	
	def movieRating(Integer id){
		movies.findFirst[
			elem | elem.id == id
		].rating
	}
	
	def episodeRating(Integer idSerie, Integer epiId){
		series.findFirst[
			elem | elem.id == idSerie
		].getEpisode(epiId).rating
	}
	
	def serieRating(Integer id){
		series.findFirst[
			elem | elem.id == id
		].rating
	}
	
	def moviesAndSeriesCategory(Category category){
		var List<ContentRatingable> contentList = newArrayList
		
		contentList.addAll(movies.filter[
			elem | elem.categories.contains(category)
		])
		
		contentList.addAll(series.filter[
			elem | elem.categories.contains(category)
		])
		
		contentList
	}
	
	def moviesAndSeriesClasification(Clasification clasification){
		var List<ContentRatingable> contentList = newArrayList
		
		contentList.addAll(movies.filter[
			elem | elem.clasification ==  clasification
		])
		
		contentList.addAll(series.filter[
			elem | elem.clasification ==  clasification
		])
	
		contentList
	}
	
	
}
