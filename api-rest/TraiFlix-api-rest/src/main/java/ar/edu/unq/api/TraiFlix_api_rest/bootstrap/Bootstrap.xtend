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
import ar.edu.unq.TraiFlix.models.Ratingable
import ar.edu.unq.TraiFlix.models.Favourable
import ar.edu.unq.TraiFlix.models.Assessment

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
		val fav = movies.subList(0,4).map[m| m as Favourable]
		val fav2 = series.map[s| s as Favourable]
		user1.favourites.addAll(fav)
		user1.favourites.addAll(fav2)
		
		val fav3 = movies.subList(5,10).map[m| m as Ratingable]
		val fav4 = series.map[s| s as Ratingable]
		
		user1.recommended.addAll(fav3)
		user1.recommended.addAll(fav4)

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
		movie.release = new Date(90, 3, 17)
		movie.actors = actors
		movie.duration = Duration.standardHours(2).plus(Duration.standardMinutes(29))
		movie.clasification = new Clasification("+18")
		movie.directors = directors
		movie.link = "https://www.youtube.com/watch?v=HoBo9ilFAlI"
		movie.categories = this.categories
			

		var movie1 = new Movie()
		movie1.title = "I'm Batman"
		movie1.release = new Date(98, 4, 6)
		movie1.actors = actors
		movie1.duration = Duration.standardMinutes(2)
		movie1.directors = directors
		movie1.link = "https://www.youtube.com/watch?v=PfEXKi83glA"
		movie1.clasification = new Clasification("ATP")
		movie1.categories.add(this.categories.get(6))
		movie1.categories.add(this.categories.get(1))

		var movie2 = new Movie()
		movie2.title = "Cmen"
		movie2.release = new Date(94, 3, 12)
		movie2.duration = Duration.standardMinutes(5)
		movie2.actors = actors
		movie2.directors = directors
		movie2.link = "https://www.youtube.com/watch?v=lpFzTJN2y_o"
		movie2.clasification = new Clasification("ATP")
		movie2.categories.add(this.categories.get(4))
		
		var movie3 = new Movie()
		movie3.title = "Dragon Ball Super: Broly Movie"
		movie3.release = new Date(118, 11, 11)
		movie3.duration = Duration.standardMinutes(5)
		movie3.actors = actors
		movie3.directors = directors
		movie3.link = "https://www.youtube.com/watch?v=FHgm89hKpXU"
		movie3.clasification = new Clasification("ATP")
		movie3.categories.add(this.categories.get(4))
		movie3.categories.add(this.categories.get(3))

		var movie4 = new Movie()
		movie4.title = "El Padrino"
		movie4.release = new Date(72, 4, 11)
		movie4.duration = Duration.standardMinutes(5)
		movie4.actors = actors
		movie4.directors = directors
		movie4.link = "https://www.youtube.com/watch?v=gCVj1LeYnsc"
		movie4.clasification = new Clasification("ATP")
		movie4.categories.add(this.categories.get(6))

		var movie5 = new Movie()
		movie5.title = "Star Wars: The Last Jedi"
		movie5.release = new Date(119, 3, 12)
		movie5.duration = Duration.standardMinutes(5)
		movie5.actors = actors
		movie5.directors = directors
		movie5.link = "https://www.youtube.com/watch?v=Cs4y56AnaUg"
		movie5.clasification = new Clasification("ATP")
		movie5.categories.add(this.categories.get(6))
		
		var movie6 = new Movie()
		movie6.title = "Venom"
		movie6.release = new Date(118, 24, 11)
		movie6.duration = Duration.standardMinutes(5)
		movie6.actors = actors
		movie6.directors = directors
		movie6.link = "https://www.youtube.com/watch?v=xLCn88bfW1o"
		movie6.clasification = new Clasification("ATP")
		movie6.categories.add(this.categories.get(0))
		
		var movie7 = new Movie()
		movie7.title = "La Monja"
		movie7.release = new Date(119, 8, 11)
		movie7.duration = Duration.standardMinutes(5)
		movie7.actors = actors
		movie7.directors = directors
		movie7.link = "https://www.youtube.com/watch?v=3HGXDuvnW9o"
		movie7.clasification = new Clasification("ATP")
		movie7.categories.add(this.categories.get(5))

		var movie8 = new Movie()
		movie8.title = "MAGADOLÓN"
		movie8.release = new Date(117, 3, 12)
		movie8.duration = Duration.standardMinutes(5)
		movie8.actors = actors
		movie8.directors = directors
		movie8.link = "https://www.youtube.com/watch?v=azI5fLoocDo"
		movie8.clasification = new Clasification("ATP")
		movie8.categories.add(this.categories.get(5))

		var movie9 = new Movie()
		movie9.title = "Pie Pequeño"
		movie9.release = new Date(94, 3, 12)
		movie9.duration = Duration.standardMinutes(5)
		movie9.actors = actors
		movie9.directors = directors
		movie9.link = "https://www.youtube.com/watch?v=tzJtXPiIpBg"
		movie9.clasification = new Clasification("ATP")
		movie9.categories.add(this.categories.get(4))

		var movie10 = new Movie()
		movie10.title = "Scarface"
		movie10.release = new Date(83, 6, 7)
		movie10.duration = Duration.standardMinutes(5)
		movie10.actors = actors
		movie10.directors = directors
		movie10.link = "https://www.youtube.com/watch?v=7pQQHnqBa2E"
		movie10.clasification = new Clasification("ATP")
		movie10.categories.add(this.categories.get(6))
		
		movie.addRelated(movie1)
		movie.addRelated(movie2)
		
		movie10.addRelated(movie4)
		
		val list = new ArrayList()
		
		list.add(movie)
		list.add(movie1)
		list.add(movie2)
		list.add(movie3)
		list.add(movie4)
		list.add(movie5)
		list.add(movie6)
		list.add(movie7)
		list.add(movie8)
		list.add(movie9)
		list.add(movie10)
		list

	}
	
	
	def createCategories(){
		var cate = new Category("Action")
		var cate1 = new Category("Drama")
		var cate2 = new Category("Zombies")
		var cate3 = new Category("Anime")
		var cate4 = new Category("Animado")
		var cate5 = new Category("Terror")
		var cate6 = new Category("Clasicos")
		
		val list = new ArrayList()
		
		list.add(cate)
		list.add(cate1)
		list.add(cate2)
		list.add(cate3)
		list.add(cate4)
		list.add(cate5)
		list.add(cate6)
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
	
	def createEpisodesForALF(){
		val episode1 = new Episode();
		episode1.title = "Larry el Psicologo"
		episode1.season = 1
		episode1.episodeNumber = 1
		episode1.link =  "https://www.youtube.com/watch?v=pAdTUYoKIQM"
		episode1.release = new Date(84, 7, 16)
		
		val episode2 = new Episode();
		episode2.title = "Ajedrez"
		episode2.season = 2
		episode2.episodeNumber = 2
		episode2.link = "http://www.youtube.com/watch?v=ctoKrCpFxjA"
		episode2.release = new Date(85, 8, 16);
		
		val episode3 = new Episode();
		episode3.title = "Luna de Miel"
		episode3.season = 3
		episode3.episodeNumber = 3
		episode3.link = "http://www.youtube.com/watch?v=o-8fGNqbzj8"
		episode3.release = new Date(85, 9, 16);
		
		
		return new ArrayList(newArrayList(episode1,episode2,episode3))
		
		 
	}
	
	def createEpisodesForFriends(){
		val episode1 = new Episode();
		episode1.title = "Larry el Psicologo"
		episode1.season = 1
		episode1.episodeNumber = 1
		episode1.link =  "https://www.youtube.com/watch?v=2jMvc5VoavE"
		episode1.release = new Date(94, 9, 22)
		
		val episode2 = new Episode();
		episode2.title = "Ajedrez"
		episode2.season = 2
		episode2.episodeNumber = 2
		episode2.link = "http://www.youtube.com/watch?v=ctoKrCpFxjA"
		episode2.release = new Date(104, 9, 22);
		
		val episode3 = new Episode();
		episode3.title = "Luna de Miel"
		episode3.season = 3
		episode3.episodeNumber = 3
		episode3.link = "http://www.youtube.com/watch?v=o-8fGNqbzj8"
		episode3.release = new Date(85, 9, 16);
		
		
		return new ArrayList(newArrayList(episode1,episode2,episode3))
		
		 
	}
	
	def createEpisodesForLost(){
		val episode1 = new Episode();
		episode1.title = "Larry el Psicologo"
		episode1.season = 1
		episode1.episodeNumber = 1
		episode1.link =  "https://www.youtube.com/watch?v=GsAEE_sy3aU"
		episode1.release = new Date(104, 9, 22)
		
		val episode2 = new Episode();
		episode2.title = "Ajedrez"
		episode2.season = 2
		episode2.episodeNumber = 2
		episode2.link = "http://www.youtube.com/watch?v=ctoKrCpFxjA"
		episode2.release = new Date(85, 8, 16);
		
		val episode3 = new Episode();
		episode3.title = "Luna de Miel"
		episode3.season = 3
		episode3.episodeNumber = 3
		episode3.link = "http://www.youtube.com/watch?v=o-8fGNqbzj8"
		episode3.release = new Date(85, 9, 16);
		
		
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
		this.loadEpisodesInSerie(series.get(0), this.createEpisodesForALF)
		this.loadEpisodesInSerie(series.get(1), this.createEpisodesForLost) 
		this.loadEpisodesInSerie(series.get(2), this.createEpisodesForFriends)  
		model.series = series2
		model.users = this.users
		
		
		model.movies.get(0).addAssessment( new Assessment(model.users.get(2),2,"Una bosta!") )
		model.series.get(0).episodes.get(0).addAssessment( new Assessment(model.users.get(2),4,"Alta serie!") )
	}	

}
