package ar.edu.unq.TraiFlix.models

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.TraiFlix.models.id.EpisodeId
import ar.edu.unq.TraiFlix.models.id.SerieId
import ar.edu.unq.TraiFlix.models.id.MovieId

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
	
	def movie(MovieId id){
		movies.findFirst[
			elem | elem.id == id
		]
	}
	
	def serie(SerieId id){
		series.findFirst[
			elem | elem.id == id
		]
	}
	
	def user(Integer id){
		users.findFirst[
			elem | elem.id == id
		]
	}
	
	def movieRating(MovieId id){
		this.movie(id).rating
	}
	

	def episodeRating(SerieId idSerie, EpisodeId epiId){
		this.serie(idSerie).getEpisode(epiId).rating
	}
	
	def serieRating(SerieId id){
		this.serie(id).rating
	}
	
	def moviesAndSeriesCategory(Category category){
		var List<Ratingable> contentList = newArrayList
		
		contentList.addAll(movies.filter[
			elem | elem.movieHasCategory(category)
		])
		
		contentList.addAll(series.filter[
			elem | elem.serieHasCategory(category)
		])
		
		return contentList
	}
	
	def moviesAndSeriesClasification(Clasification clasification){
		var List<Ratingable> contentList = newArrayList
		
		contentList.addAll(movies.filter[
			elem | elem.clasificationIs(clasification)
		])
		
		contentList.addAll(series.filter[
			elem | elem.clasificationIs(clasification)
		])
	
		return contentList
	}
	
	def quantityOfSeasonsSerie(SerieId id){
		this.serie(id).quantityOfSeasonsSerie()
	}
	
	def quantityOfEpisodesSereie(SerieId id){
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
	
	def recomendMovieToUser(User recommenderUser, User recommendedUser, Movie content){
		if(recommenderUser.isFriend(recommendedUser)){
			recommendedUser.recommended.add(content)	
		}
			
		
	}
	
	def recomendSerieToUser(User recommenderUser, User recommendedUser, Serie content){
		if(recommenderUser.isFriend(recommendedUser)){
			recommendedUser.recommended.add(content)	
		}
		
	}
	
	def recommendedContentOfUser(Integer id){
		this.user(id).recommended
	}
	

	def linklessContent() {
		var List <Content> content = newArrayList
		var List <Episode> episode = newArrayList
		
		content.addAll(movies.filter[link.nullOrEmpty])
		for(serie:series){
			episode.addAll(serie.episodes)
			}
		content.addAll(episode.filter[link.nullOrEmpty])
		return content
	}
}
