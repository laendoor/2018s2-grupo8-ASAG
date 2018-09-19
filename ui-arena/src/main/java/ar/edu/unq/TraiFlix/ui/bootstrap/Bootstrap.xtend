package ar.edu.unq.TraiFlix.ui.bootstrap

import ar.edu.unq.TraiFlix.models.Movie
import ar.edu.unq.TraiFlix.models.Serie
import ar.edu.unq.TraiFlix.models.User
import java.util.ArrayList
import java.util.List
import java.util.Date
import ar.edu.unq.TraiFlix.models.Category
import ar.edu.unq.TraiFlix.models.Clasification
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.Period
import org.joda.time.DateTime

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
		if (instance == null) {
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

		newArrayList(user1, user2, user3, user4)
	}

	def createMovies() {

		var directors = newArrayList("Spilbergo", "Jorge Lucas")
		var actors = newArrayList("Obi One Kenobi", "Darin")

		var movie = new Movie()
		movie.title = "Las tortugas pinjas"
		movie.release = new Date()
		movie.actors = actors
		movie.duration = new Period(0, 2, 16, 0)
		movie.directors = directors
		movie.link = "https://www.youtube.com/watch?v=HoBo9ilFAlI"

		var movie1 = new Movie()
		movie1.title = "I'm Batman"
		movie1.release = new Date()
		movie1.actors = actors
		movie1.duration = new Period(0, 2, 16, 0)
		movie1.directors = directors
		movie1.link = "https://www.youtube.com/watch?v=PfEXKi83glA"

		var movie2 = new Movie()
		movie2.title = "Cmen"
		movie2.release = new Date()
		movie2.duration = new Period(0, 2, 16, 0)
		movie2.actors = actors
		movie2.directors = directors
		movie2.link = "https://www.youtube.com/watch?v=lpFzTJN2y_o"
		
		newArrayList(movie,movie1,movie2)

	}
	
	
	def createCategories(){
		var cate = new Category("Action")
		var cate1 = new Category("Drama")
		var cate2 = new Category("Zombies Nazis")
		
		newArrayList(cate, cate1, cate2)
	}
	
	
	def createClasifications(){
		newArrayList(new Clasification("ATP"), new Clasification("+13"),
			new Clasification("+17")
		)
	}
	
	
	def createSeries(){

		var serie = new Serie()
		serie.title = "ALF"
		serie.categories = this.categories
		serie.clasification = this.clasifications.get(0)
		
		
		var serie1 = new Serie()
		serie1.title = "ALF"
		serie1.categories = this.categories
		serie1.clasification = this.clasifications.get(0)
		
		var serie2 = new Serie()
		serie2.title = "ALF"
		serie2.categories = this.categories
		serie2.clasification = this.clasifications.get(0)
	
		 newArrayList(serie, serie1, serie2)
	}

}
