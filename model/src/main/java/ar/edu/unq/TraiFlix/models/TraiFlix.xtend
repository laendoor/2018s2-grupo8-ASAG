package ar.edu.unq.TraiFlix.models

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.TraiFlix.models.id.EpisodeId
import ar.edu.unq.TraiFlix.models.id.SerieId
import ar.edu.unq.TraiFlix.models.id.MovieId
import ar.edu.unq.TraiFlix.models.Category
import org.uqbar.commons.model.annotations.Dependencies
import java.security.InvalidParameterException

@Accessors
@Observable
class TraiFlix {
	
	List<Movie> movies;
	List<Serie> series;
	List<User> users;
	List<Category> categories
	List<Clasification> classifications
	
	
	new(){
		movies = new ArrayList()
		series = new ArrayList()
		users = new ArrayList()
		categories = new ArrayList()
		classifications = new ArrayList()
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
	
	def addCategory( Category category ) {
		categories.add( category )
	}
	
	def addClassification( Clasification classification ) {
		classifications.add( classification )
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
	
	def findUserByNickName( String nickName ) {
		var user = users.findFirst[
			elem | elem.nick.toUpperCase == nickName.toUpperCase
		]
		if( user == null) throw new InvalidParameterException("Usuario '" + nickName + "' inexistente.")
		return user
	}
	
	def userFavourites( String nickName ) {
		findUserByNickName(nickName).favourites
	}
	
	def searchMovie(String name) {
		val res = movies.filter[it.getTitle().toLowerCase.contains(name)].toList
		if(res.isEmpty)
			return null
		return res.iterator.next
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
		user1.addFriend(user2)
		user2.addFriend(user1)
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

	def deleteMovie(MovieId id){
		movies = movies.filter( elem | !id.equals(elem.id) ).toList
	}

	@Dependencies("movies", "series")
	def getRelatableContent(Relatable toRelateWith) {
		var List<Relatable> contentList = new ArrayList
		
		contentList.addAll(movies)
		contentList.addAll(series)
		
		contentList.filter( elem | elem!=toRelateWith && !toRelateWith.getRelateds().contains(elem) ).toList
	}
	
	def deleteSerie(SerieId id) {
		series = series.filter( elem | !id.equals(elem.id) ).toList
	}
	
		
}
