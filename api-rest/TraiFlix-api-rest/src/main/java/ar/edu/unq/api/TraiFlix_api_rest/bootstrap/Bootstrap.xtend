package ar.edu.unq.api.TraiFlix_api_rest.bootstrap

import ar.edu.unq.TraiFlix.models.Movie
import ar.edu.unq.TraiFlix.models.Serie
import ar.edu.unq.TraiFlix.models.User
import java.util.ArrayList
import java.util.List
import java.util.Date
import ar.edu.unq.TraiFlix.models.Category
import ar.edu.unq.TraiFlix.models.Clasification
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.TraiFlix.models.TraiFlix
import org.joda.time.Duration
import org.joda.time.DateTime
import ar.edu.unq.TraiFlix.models.Episode

@Accessors
class Bootstrap {

	List<Movie> movies
	List<Serie> series
	List<User> users
	List<Category> categories
	List<Clasification> clasifications 

	private static Bootstrap instance = null

	private new() {
		categories = this.createCategories
		clasifications = this.createClasifications
		movies = this.createMovies
		series = this.createSeries
		users = this.createUsers


	}

	static def getInstance() {
		if (instance === null) {
			instance = new Bootstrap
		}
		instance
	}

	def createUsers() {

		var user1 = new User()
		user1.id = 1
		user1.nick = "Saba"
		user1.name = "Pablo"
		user1.dateOfBirth = new DateTime(1986, 7, 16, 0, 0, 0, 0);
		user1.created = new DateTime(2015, 3, 14, 0, 0, 0, 0);

		var user2 = new User()
		user2.id = 2
		user2.nick = "Lukitas"
		user2.name = "Lucas"
		user2.dateOfBirth = new DateTime(2000, 7, 16, 0, 0, 0, 0);
		user2.created = new DateTime(2014, 3, 14, 0, 0, 0, 0);

		var user3 = new User()
		user3.id = 3
		user3.nick = "Marce"
		user3.name = "Marcelo"
		user3.dateOfBirth = new DateTime(1983, 7, 16, 0, 0, 0, 0);
		user3.created = new DateTime(2016, 3, 14, 0, 0, 0, 0);

		var user4 = new User()
		user4.id = 4
		user4.nick = "Peter"
		user4.name = "Pedro"
		user4.dateOfBirth = new DateTime(1980, 7, 16, 0, 0, 0, 0);
		user4.created = new DateTime(2011, 3, 14, 0, 0, 0, 0);

		val list = new ArrayList()
		
		list.add(user1)
		list.add(user2)
		list.add(user3)
		list.add(user4)
		list
	}

	def createMovies() {

		var directors = "Spilbergo, Jorge Lucas"
		var actors = "Obi One Kenobi , Darin"


		var movie = new Movie()
		movie.title = "Las tortugas pinjas"
		movie.release = new Date()
		movie.actors = actors
		movie.duration = Duration.standardMinutes(12).plus(Duration.standardSeconds(50))
		movie.clasification = new Clasification("+18")
		movie.directors = directors
		movie.link = "https://www.youtube.com/watch?v=HoBo9ilFAlI"

		var movie1 = new Movie()
		movie1.title = "I'm Batman"
		movie1.release = new Date()
		movie1.actors = actors
		movie1.duration = Duration.standardMinutes(2)
		movie1.directors = directors
		movie1.link = "https://www.youtube.com/watch?v=PfEXKi83glA"
		movie1.clasification = new Clasification("ATP")

		var movie2 = new Movie()
		movie2.title = "Cmen"
		movie2.release = new Date()
		movie2.duration = Duration.standardMinutes(5)
		movie2.actors = actors
		movie2.directors = directors
		movie2.link = "https://www.youtube.com/watch?v=lpFzTJN2y_o"
		movie2.clasification = new Clasification("ATP")
		
		movie.addRelated(movie1)
		movie.addRelated(movie2)
		
		val list = new ArrayList()
		
		list.add(movie)
		list.add(movie1)
		list.add(movie2)
		list

	}
	
	
	def createCategories(){
		var cate = new Category("Action")
		var cate1 = new Category("Drama")
		var cate2 = new Category("Zombies Nazis")
		
		val list = new ArrayList()
		
		list.add(cate)
		list.add(cate1)
		list.add(cate2)
		list
	}
	
	
	def createClasifications(){
		
		var clas1 = new Clasification("ATP")
		var clas2 = new Clasification("+13")
		var clas3 = new Clasification("+17")
		
		val list = new ArrayList()
		
		list.add(clas1)
		list.add(clas2)
		list.add(clas3)
		list
	}
	
	
	def createSeries(){

		var serie = new Serie()
		serie.title = "ALF"
		serie.creators = "Spilbergo"
		serie.categories = this.categories
		serie.clasification = this.clasifications.get(1)
		
		
		var serie1 = new Serie()
		serie1.title = "Lost"
		serie1.creators = "Luke SkyWalker"
		serie1.categories = this.categories
		serie1.clasification = this.clasifications.get(0)
		
		var serie2 = new Serie()
		serie2.title = "Friends"
		serie2.creators = "Matt Groening"
		serie2.categories = this.categories
		serie2.clasification = this.clasifications.get(1)
	
		 val list = new ArrayList()
		
		list.add(serie)
		list.add(serie1)
		list.add(serie2)
		list
	}
	
	def createEpisodes(){
		val episode1 = new Episode();
		episode1.title = "Larry el Psicologo"
		episode1.season = 1
		episode1.episodeNumber = 1
		episode1.link = "https://www.youtube.com/watch?v=5MbSixjIzOw"
		
		val episode2 = new Episode();
		episode2.title = "Ajedrez"
		episode2.season = 2
		episode2.episodeNumber = 2
		episode2.link = "https://www.youtube.com/watch?v=ctoKrCpFxjA"		
		
		val episode3 = new Episode();
		episode3.title = "Luna de Miel"
		episode3.season = 3
		episode3.episodeNumber = 3
		episode3.link = "https://www.youtube.com/watch?v=o-8fGNqbzj8"
		
		
		return new ArrayList(newArrayList(episode1,episode2,episode3))
		
		 
	}
	
	
	def loadEpisodesInSerie(Serie serie1, List<Episode> episodes){
		episodes.forEach[elem | elem.setSerie(serie1)]
		episodes.forEach[elem | serie1.addEpisode(elem)]
	}
	
	def load(TraiFlix model){
		model.categories = this.categories
		model.classifications = this.clasifications
		model.movies = this.movies
		val series2 = this.series
		this.loadEpisodesInSerie(series.get(0), this.createEpisodes) 
		model.series = series2
		model.users = this.users
	}

}
