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
import ar.edu.unq.TraiFlix.models.TraiFlix

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

		var user2 = new User()
		user2.id = 2
		user2.nick = "Lukitas"
		user2.name = "Lucas"

		var user3 = new User()
		user3.id = 3
		user3.nick = "Marce"
		user3.name = "Marcelo"

		var user4 = new User()
		user4.id = 4
		user4.nick = "Peter"
		user4.name = "Pedro"

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
		movie.directors = directors
		movie.link = "https://www.youtube.com/watch?v=HoBo9ilFAlI"

		var movie1 = new Movie()
		movie1.title = "I'm Batman"
		movie1.release = new Date()
		movie1.actors = actors
		movie1.directors = directors
		movie1.link = "https://www.youtube.com/watch?v=PfEXKi83glA"

		var movie2 = new Movie()
		movie2.title = "Cmen"
		movie2.release = new Date()
		movie2.actors = actors
		movie2.directors = directors
		movie2.link = "https://www.youtube.com/watch?v=lpFzTJN2y_o"
		
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
	
		 val list = new ArrayList()
		
		list.add(serie)
		list.add(serie1)
		list.add(serie2)
		list
	}
	
	def load(TraiFlix model){
		model.categories = this.categories
		model.classifications = this.clasifications
		model.movies = this.movies
		model.series = this.series
		model.users = this.users

	}

}
