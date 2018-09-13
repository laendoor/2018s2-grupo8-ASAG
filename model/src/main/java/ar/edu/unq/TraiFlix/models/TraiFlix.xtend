package ar.edu.unq.TraiFlix.models

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.TraiFlix.models.id.EpisodeId
import ar.edu.unq.TraiFlix.models.id.SerieId
import ar.edu.unq.TraiFlix.models.id.MovieId
import ar.edu.unq.TraiFlix.models.Category

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
		
		// Estoy hay que inyectarlo desde afuera...
		loadDefaultData()
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
	
	def recomendMovieToUser(User recommendedUser, Movie content){
		recommendedUser.recommended.add(content)	
		
	}
	
	def recomendSerieToUser(User recommendedUser, Serie content){
		recommendedUser.recommended.add(content)	
		
	}
	
	def recommendedContentOfUser(Integer id){
		this.user(id).recommended
	}

	
	private def void loadDefaultData() {
		loadDefaultClassifications()
		loadDefaultCategories()
	}
	private def void loadDefaultClassifications() {		
		addClassification( new Clasification("ATP") )
		addClassification( new Clasification("+13") )
		addClassification( new Clasification("+16") )
		addClassification( new Clasification("+18") )	
	}	
	private def void loadDefaultCategories() {		
		addCategory( new Category("Estrenos") )
		addCategory( new Category("Destacadas") )
		addCategory( new Category("Pochocleras") )		
	}
}
