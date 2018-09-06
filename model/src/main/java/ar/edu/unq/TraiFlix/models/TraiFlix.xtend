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
	
	def movie(Integer id){
		movies.findFirst[
			elem | elem.id == id
		]
	}
	
	def serie(Integer id){
		series.findFirst[
			elem | elem.id == id
		]
	}
	
	def user(Integer id){
		users.findFirst[
			elem | elem.id == id
		]
	}
	
	def movieRating(Integer id){
		this.movie(id).rating
	}
	

	def episodeRating(Integer idSerie, Integer epiId){
		this.serie(idSerie).getEpisode(epiId).rating
	}
	
	def serieRating(Integer id){
		this.serie(id).rating
	}
	
	def moviesAndSeriesCategory(Category category){
		var List<ContentRatingable> contentList = newArrayList
		
		contentList.addAll(movies.filter[
			elem | elem.movieHasCategory(category)
		])
		
		contentList.addAll(series.filter[
			elem | elem.serieHasCategory(category)
		])
		
		return contentList
	}
	
	def moviesAndSeriesClasification(Clasification clasification){
		var List<ContentRatingable> contentList = newArrayList
		
		contentList.addAll(movies.filter[
			elem | elem.clasificationIs(clasification)
		])
		
		contentList.addAll(series.filter[
			elem | elem.clasificationIs(clasification)
		])
	
		return contentList
	}
	
	def quantityOfSeasonsSerie(Integer id){
		this.serie(id).quantityOfSeasonsSerie()
	}
	
	def quantityOfEpisodesSereie(Integer id){
		this.serie(id).quantityOfEpisodesSereie
	}
	
	def userBeacomeFriendOf(User user1, User user2){
		user1.friends.add(user2)
		user2.friends.add(user1)
	}
	
	def friendsOfUser(Integer id){
		this.user(id).friends
	}
	
	def watchedSeriesByUser(Integer id) {
		this.user(id).watchedSeries();
	}
	
	def watchedAndFinishedSeriesByUser(Integer id) {
		this.user(id).watchedAndFinishedSeries();
	}
	

	
}
