package ar.edu.unq.TraiFlix.models

import ar.edu.unq.TraiFlix.models.Movie
import ar.edu.unq.TraiFlix.models.TraiFlix
import ar.edu.unq.TraiFlix.models.Serie
import org.junit.Test
import static org.junit.Assert.*
import ar.edu.unq.TraiFlix.models.User
import ar.edu.unq.TraiFlix.models.Assessment
import ar.edu.unq.TraiFlix.models.Episode

class TraiFlixTest{
	/*
	 * a. Obtener el listado de las películas
	 * b. Obtener el listado de las series
	 * c. Obtener el listado de los usuarios
	 * d. Conocer el rating de una película
	 * e. Conocer el rating de un capítulo de una serie
	 * f. Obtener películas y series por categoría
	 * g. Obtener películas y series por clasificación
	 * h. La cantidad de temporadas de una serie
	 * i. La cantidad de capítulos de una serie
	 * j. Los amigos de un usuario
	 * k. Dado un usuario, saber qué películas vió
	 * l. Dado un usuario, saber qué series vió de forma completa
	 * m. Dado un usuario, conocer el contenido recomendado por sus amigos
	 * n. Obtener el contenido que no tenga cargado el trailer
	 */
	/** 
	 * Rigourous Test :-)
	 */
	@Test
	def void obtenerElListadoDeLasPelículas() {
		var TraiFlix triflix = new TraiFlix()
		triflix.setNewMovie(new Movie)
		triflix.setNewMovie(new Movie)
		triflix.setNewSerie(new Serie)
		
		assertTrue(triflix.getMovies().size == 2)
	}
	
	@Test
	def void obtenerElListadoDeLasSeries() {
		var TraiFlix triflix = new TraiFlix()
		triflix.setNewMovie(new Movie)
		triflix.setNewMovie(new Movie)
		triflix.setNewSerie(new Serie)
		
		assertTrue(triflix.getSeries().size == 1)
	}
	
	@Test
	def void obtenerElListadoDeLosUsuarios() {
		var TraiFlix triflix = new TraiFlix()
		triflix.setNewMovie(new Movie)
		triflix.setNewMovie(new Movie)
		triflix.setNewSerie(new Serie)
		triflix.setNewUser(new User)
		triflix.setNewUser(new User)
		
		assertTrue(triflix.users.size == 2)
	}
	
	@Test
	def void conocerElRatingDeUnaPelicula() {
		var TraiFlix triflix = new TraiFlix()
		val elPadrino = new Movie;
		val pepito = new User;
		val pepita = new User;
		
		
		elPadrino.id = 1
		elPadrino.title = "El Padrino" 
		pepito.nick = "Pepito"
		pepito.name = "Pepito"
		pepita.nick = "Pepita"
		pepita.name = "Pepita"
		
		
		triflix.setNewMovie(elPadrino)
		triflix.setNewUser(pepito)
		


		elPadrino.addAssessment(new Assessment(pepito, 5,"violentas como me gustan a mi"))
		elPadrino.addAssessment(new Assessment(pepito, 1,"me gustan las romanticas, una mierda"))

		
		assertTrue(triflix.movieRating(1) == 3)
	}
	
	
	
	@Test
	def void conocerElRatingDeUnCapitulo() {
		var TraiFlix triflix = new TraiFlix()
		val lost = new Serie;
		val episodio1 = new Episode;
		val episodio2 = new Episode;
		val pepito = new User;
		val pepita = new User;
		
		
		lost.id = 1
		lost.title = "Lost"
		pepito.nick = "Pepito"
		pepito.name = "Pepito"
		pepita.nick = "Pepita"
		pepita.name = "Pepita"
		
		
		triflix.setNewSerie(lost)
		
		episodio1.id = 1
		lost.episodes.add(episodio1)
		lost.episodes.add(episodio2)
		
		episodio1.addAssessment(new Assessment(pepito, 5, "Me gusto como se cayo el avion"))
		episodio2.addAssessment(new Assessment(pepito, 3, "Medio chafa"))
		
		episodio1.addAssessment(new Assessment(pepita, 2, "No entiendo la trama"))
		episodio2.addAssessment(new Assessment(pepita, 2, "Entiendo menos ahora :d"))
		
		
		
		assertTrue(triflix.episodeRating(1, 1) == 3)
	}
	
	
	@Test
	def void conocerElRatingDeUnaSerie() {
		var TraiFlix triflix = new TraiFlix()
		val lost = new Serie;
		val episodio1 = new Episode;
		val episodio2 = new Episode;
		val pepito = new User;
		val pepita = new User;
		
		
		lost.id = 1
		lost.title = "Lost"
		pepito.nick = "Pepito"
		pepito.name = "Pepito"
		pepita.nick = "Pepita"
		pepita.name = "Pepita"
		
		
		triflix.setNewSerie(lost)
		

		lost.episodes.add(episodio1)
		lost.episodes.add(episodio2)
		
		episodio1.addAssessment(new Assessment(pepito, 5, "Me gusto como se cayo el avion"))
		episodio2.addAssessment(new Assessment(pepito, 3, "Medio chafa"))
		
		episodio1.addAssessment(new Assessment(pepita, 2, "No entiendo la trama"))
		episodio2.addAssessment(new Assessment(pepita, 2, "Entiendo menos ahora :d"))
		
		
		
		assertTrue(triflix.serieRating(1) == 3)
	}
	
	
	
	@Test
	def void seriesYPeliculasConlaMismaCategoria() {
		var TraiFlix triflix = new TraiFlix()
		val elPadrino = new Movie;
		val lost = new Serie;
		val episodio1 = new Episode;
		val episodio2 = new Episode;
		
		
		elPadrino.id = 1
		elPadrino.title = "El Padrino"
		elPadrino.categories.add(Category.ACCION) 
		lost.id = 1
		lost.title = "Lost"
		lost.categories.add(Category.ACCION)
		
		
		
		triflix.setNewMovie(elPadrino)
		triflix.setNewSerie(lost)
		

		lost.episodes.add(episodio1)
		lost.episodes.add(episodio2)
		


		assertTrue(triflix.moviesAndSeriesCategory
			(Category.ACCION).contains(lost)
		)
		assertTrue(triflix.moviesAndSeriesCategory
			(Category.ACCION).contains(elPadrino)
		)
		assertFalse(triflix.moviesAndSeriesCategory
			(Category.TERROR).contains(lost)
		)
		assertFalse(triflix.moviesAndSeriesCategory
			(Category.TERROR).contains(elPadrino)
		)
		
	}
	
	@Test
	def void seriesYPeliculasConlaMismaClasificacion() {
		var TraiFlix triflix = new TraiFlix()
		val elPadrino = new Movie;
		val lost = new Serie;
		val episodio1 = new Episode;
		val episodio2 = new Episode;
		
		
		elPadrino.id = 1
		elPadrino.title = "El Padrino"
		elPadrino.clasification = Clasification.ATP 
		lost.id = 1
		lost.title = "Lost"
		lost.clasification = Clasification.ATP
		
		
		
		triflix.setNewMovie(elPadrino)
		triflix.setNewSerie(lost)
		

		lost.episodes.add(episodio1)
		lost.episodes.add(episodio2)
		


		
		assertTrue(triflix.moviesAndSeriesClasification
			(Clasification.ATP).contains(lost)
		)
		assertTrue(triflix.moviesAndSeriesClasification
			(Clasification.ATP).contains(elPadrino)
		)
		
		assertFalse(triflix.moviesAndSeriesClasification
			(Clasification.PLUS13).contains(lost)
		)
		assertFalse(triflix.moviesAndSeriesClasification
			(Clasification.PLUS13).contains(elPadrino)
		)
		
	}
	
	@Test
	def void cantidadDeTemporadasDeUnaSerie() {
		var TraiFlix triflix = new TraiFlix()
		val lost = new Serie;
		val episodio1 = new Episode;
		val episodio2 = new Episode;
	
		
		
		lost.id = 1
		lost.title = "Lost"
	
		episodio1.season = 1
		episodio2.season = 1
		
		triflix.setNewSerie(lost)
		

		lost.episodes.add(episodio1)
		lost.episodes.add(episodio2)
		
		
		assertTrue(triflix.quantityOfSeasonsSerie(1) == 1)
		
		val episodioS2 = new Episode;
		
		episodioS2.season = 2
		
		lost.episodes.add(episodioS2)
		
		assertFalse(triflix.quantityOfSeasonsSerie(1) == 1)
		assertTrue(triflix.quantityOfSeasonsSerie(1) == 2)
		
	}
		
		
	@Test
	def void cantidadDeEpisodiosDeUnaSerie() {
		var TraiFlix triflix = new TraiFlix()
		val lost = new Serie;
		val episodio1 = new Episode;
		val episodio2 = new Episode;
	
		
		
		lost.id = 1
		lost.title = "Lost"
	
		episodio1.season = 1
		episodio2.season = 1
		
		triflix.setNewSerie(lost)
		

		lost.episodes.add(episodio1)
		lost.episodes.add(episodio2)
		
		
		assertTrue(triflix.quantityOfEpisodesSereie(1) == 2)
		
		val episodioS2 = new Episode;
		
		episodioS2.season = 2
		
		lost.episodes.add(episodioS2)
		
		assertFalse(triflix.quantityOfEpisodesSereie(1) == 2)
		assertTrue(triflix.quantityOfEpisodesSereie(1) == 3)
		
	}
		
	@Test
	def void amigosDelUsuario(){
		var TraiFlix triflix = new TraiFlix()
		var User user1 = new User()
		var User user2 = new User()
		var User user3 = new User()
		var User user4 = new User()
		
		user1.id = 1
		
		triflix.userBeacomeFriendOf(user1, user2)
		triflix.userBeacomeFriendOf(user1, user3)
		
		triflix.setNewUser(user1)
		
		assertTrue(triflix.friendsOfUser(1).contains(user2))
		assertTrue(triflix.friendsOfUser(1).contains(user3))
		assertFalse(triflix.friendsOfUser(1).contains(user4))
		
	}
	
		@Test
	def void DadoUnUsuarioSsaberQuePelículasVio(){
		var User pepe = new User()
		
		val elPadrino = new Movie
		elPadrino.title = "El Padrino"
		val teletubis = new Movie
		teletubis.title = "La venganza del teletubi rojo"
		val karateKid = new Movie
		teletubis.title = "Karate Kid"
		
		val luisMiguel = new Episode
		luisMiguel.title = "Luis Miguel"
		
		pepe.seeContent(elPadrino)
		pepe.seeContent(teletubis)
		pepe.seeContent(luisMiguel)
		
		val moviesSeen = pepe.moviesSeen()
		
		assertTrue(moviesSeen.size == 2)
		assertTrue(moviesSeen.exists[elem | elem == elPadrino])
		assertFalse(moviesSeen.exists[elem | elem == karateKid])
	}
	
	}