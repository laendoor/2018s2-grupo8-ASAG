package ar.edu.unq.TraiFlix.models

import ar.edu.unq.TraiFlix.models.Movie
import ar.edu.unq.TraiFlix.models.TraiFlix
import ar.edu.unq.TraiFlix.models.Serie
import org.junit.Test
import static org.junit.Assert.*
import ar.edu.unq.TraiFlix.models.User
import ar.edu.unq.TraiFlix.models.Assessment
import ar.edu.unq.TraiFlix.models.Episode
import org.junit.Before
import ar.edu.unq.TraiFlix.models.id.SerieId
import ar.edu.unq.TraiFlix.models.id.MovieId
import ar.edu.unq.TraiFlix.models.id.EpisodeId

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
	 
	User user
	Serie lostSerie
	Serie foundSerie
	Episode lostS1E1
	Episode lostS1E2
	Episode lostS1E3
	Episode foundS1E1
	Episode foundS1E2
	 
	@Before
	def void setUp() {		
		lostSerie = new Serie
		lostS1E1 = new Episode
		lostS1E1.serie = lostSerie		
		lostS1E2 = new Episode
		lostS1E2.serie = lostSerie
		lostS1E3 = new Episode
		lostS1E3.serie = lostSerie
		lostSerie.addEpisode(lostS1E1)
		lostSerie.addEpisode(lostS1E2)
		lostSerie.addEpisode(lostS1E3)
				
		foundSerie = new Serie
		foundS1E1 = new Episode
		foundS1E1.serie = foundSerie	
		foundS1E2 = new Episode
		foundS1E2.serie = foundSerie
		foundSerie.addEpisode(foundS1E1)
		foundSerie.addEpisode(foundS1E2)
		
		user = new User
		user.seeContent(lostS1E1)
		user.seeContent(lostS1E2)
		user.seeContent(lostS1E3)
		user.seeContent(foundS1E1)
	}
	 
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
		
		
		elPadrino.id = new MovieId
		elPadrino.title = "El Padrino" 
		pepito.nick = "Pepito"
		pepito.name = "Pepito"
		pepita.nick = "Pepita"
		pepita.name = "Pepita"
		
		
		triflix.setNewMovie(elPadrino)
		triflix.setNewUser(pepito)
		


		elPadrino.addAssessment(new Assessment(pepito, 5,"violentas como me gustan a mi"))
		elPadrino.addAssessment(new Assessment(pepito, 1,"me gustan las romanticas, una mierda"))

		
		assertTrue(triflix.movieRating(elPadrino.id) == 3)
	}
	
	
	
	@Test
	def void conocerElRatingDeUnCapitulo() {
		var TraiFlix triflix = new TraiFlix()
		val lost = new Serie;
		val episodio1 = new Episode;
		val episodio2 = new Episode;
		val pepito = new User;
		val pepita = new User;
		
		
		lost.id = new SerieId
		lost.title = "Lost"
		pepito.nick = "Pepito"
		pepito.name = "Pepito"
		pepita.nick = "Pepita"
		pepita.name = "Pepita"
		
		
		triflix.setNewSerie(lost)
		
		episodio1.id = new EpisodeId
		lost.episodes.add(episodio1)
		lost.episodes.add(episodio2)
		
		episodio1.addAssessment(new Assessment(pepito, 5, "Me gusto como se cayo el avion"))
		episodio2.addAssessment(new Assessment(pepito, 3, "Medio chafa"))
		
		episodio1.addAssessment(new Assessment(pepita, 2, "No entiendo la trama"))
		episodio2.addAssessment(new Assessment(pepita, 2, "Entiendo menos ahora :d"))
		
		
		
		assertTrue(triflix.episodeRating(lost.id, episodio1.id) == 3)
	}
	
	
	@Test
	def void conocerElRatingDeUnaSerie() {
		var TraiFlix triflix = new TraiFlix()
		val lost = new Serie;
		val episodio1 = new Episode;
		val episodio2 = new Episode;
		val pepito = new User;
		val pepita = new User;
		
		
		lost.id = new SerieId
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
		
		
		
		assertTrue(triflix.serieRating(lost.id) == 3)
	}
	
	
	
	@Test
	def void seriesYPeliculasConlaMismaCategoria() {
		var TraiFlix triflix = new TraiFlix()
		val elPadrino = new Movie;
		val lost = new Serie;
		val category = new Category("Accion")		
		val category2 = new Category("Terror")
		
		elPadrino.id = new MovieId
		elPadrino.title = "El Padrino"
		elPadrino.categories.add(category) 
		lost.id = new SerieId
		lost.title = "Lost"
		lost.categories.add(category)
					
		triflix.setNewMovie(elPadrino)
		triflix.setNewSerie(lost)
		
		assertTrue(triflix.moviesAndSeriesCategory
			(category).contains(lost)
		)
		assertTrue(triflix.moviesAndSeriesCategory
			(category).contains(elPadrino)
		)
		assertFalse(triflix.moviesAndSeriesCategory
			(category2).contains(lost)
		)
		assertFalse(triflix.moviesAndSeriesCategory
			(category2).contains(elPadrino)
		)
		
	}
	
	@Test
	def void seriesYPeliculasConlaMismaClasificacion() {
		var TraiFlix triflix = new TraiFlix()
		val elPadrino = new Movie;
		val lost = new Serie;
		val episodio1 = new Episode;
		val episodio2 = new Episode;
		val atp = new Clasification("ATP");
		val plus13 = new Clasification("plus13")
		
		elPadrino.id = new MovieId
		elPadrino.title = "El Padrino"
		elPadrino.clasification = atp
		lost.id = new SerieId
		lost.title = "Lost"
		lost.clasification = atp
		
		
		
		triflix.setNewMovie(elPadrino)
		triflix.setNewSerie(lost)
		

		lost.episodes.add(episodio1)
		lost.episodes.add(episodio2)
		


		
		assertTrue(triflix.moviesAndSeriesClasification
			(atp).contains(lost)
		)
		assertTrue(triflix.moviesAndSeriesClasification
			(atp).contains(elPadrino)
		)
		
		assertFalse(triflix.moviesAndSeriesClasification
			(plus13).contains(lost)
		)
		assertFalse(triflix.moviesAndSeriesClasification
			(plus13).contains(elPadrino)
		)
		
	}
	
	@Test
	def void cantidadDeTemporadasDeUnaSerie() {
		var TraiFlix triflix = new TraiFlix()
		val lost = new Serie;
		val episodio1 = new Episode;
		val episodio2 = new Episode;
	
		
		
		lost.id = new SerieId
		lost.title = "Lost"
	
		episodio1.season = 1
		episodio2.season = 1
		
		triflix.setNewSerie(lost)
		

		lost.episodes.add(episodio1)
		lost.episodes.add(episodio2)
		
		
		assertTrue(triflix.quantityOfSeasonsSerie(lost.id) == 1)
		
		val episodioS2 = new Episode;
		
		episodioS2.season = 2
		
		lost.episodes.add(episodioS2)
		
		assertFalse(triflix.quantityOfSeasonsSerie(lost.id) == 1)
		assertTrue(triflix.quantityOfSeasonsSerie(lost.id) == 2)
		
	}
		
		
	@Test
	def void cantidadDeEpisodiosDeUnaSerie() {
		var TraiFlix triflix = new TraiFlix()
		val lost = new Serie;
		val episodio1 = new Episode;
		val episodio2 = new Episode;
	
		
		
		lost.id = new SerieId
		lost.title = "Lost"
	
		episodio1.season = 1
		episodio2.season = 1
		
		triflix.setNewSerie(lost)
		

		lost.episodes.add(episodio1)
		lost.episodes.add(episodio2)
		
		
		assertTrue(triflix.quantityOfEpisodesSereie(lost.id) == 2)
		
		val episodioS2 = new Episode;
		
		episodioS2.season = 2
		
		lost.episodes.add(episodioS2)
		
		assertFalse(triflix.quantityOfEpisodesSereie(lost.id) == 2)
		assertTrue(triflix.quantityOfEpisodesSereie(lost.id) == 3)
		
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
	def void DadoUnUsuarioSaberQuePelículasVio(){
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
		
		val watchedMovies = pepe.watchedMovies()
		System.out.println(pepe.watched.size )
		assertTrue(watchedMovies.size == 2)
		assertTrue(watchedMovies.exists[elem | elem == elPadrino])
		assertFalse(watchedMovies.exists[elem | elem == karateKid])
	}

	@Test
	def void dadoUnUsuarioSaberQueSeriesVio() {
		var watchedSeries = user.watchedSeries()
		
		assertTrue( watchedSeries.size == 2 )
		assertTrue( watchedSeries.contains(lostSerie) )
		assertTrue( watchedSeries.contains(foundSerie) )	
	}
	
	@Test
	def void dadoUnUsuarioSaberQueSeriesVioDeFormaCompleta() {
		var watchedAndFinishedSeries = user.watchedAndFinishedSeries()
		
		assertTrue( watchedAndFinishedSeries.size == 1 )
		assertTrue( watchedAndFinishedSeries.contains(lostSerie) )
		assertFalse( watchedAndFinishedSeries.contains(foundSerie) )	
	}
	
	@Test
	def void dadoUnUsuarioSaberCualEsElContenidoQueLeRecomendaronSusAmigos(){
		var pepe = new User()
		pepe.id = 1
		var amigoDePepe = new User()
		amigoDePepe.id = 2
		var triflix = new TraiFlix()
		
		triflix.setNewUser(pepe)
		triflix.setNewUser(amigoDePepe)
		

		
		val elPadrino = new Movie
		elPadrino.title = "El Padrino"
		val teletubis = new Movie
		teletubis.title = "La venganza del teletubi rojo"
		
		triflix.setNewMovie(elPadrino)
		triflix.setNewMovie(teletubis)
		

		triflix.recomendMovieToUser(amigoDePepe, pepe, elPadrino)

		assertTrue(triflix.recommendedContentOfUser(1).isEmpty)
		
		triflix.userBeacomeFriendOf(pepe, amigoDePepe)
		
		triflix.recomendMovieToUser(amigoDePepe, pepe, elPadrino)

		assertTrue(triflix.recommendedContentOfUser(1).size == 1)
	}

	@Test
	def void contenidosSinTriler() {
				
		var traiFlix = new TraiFlix
				
		lostS1E1.link = "linkLost1E1"
		lostS1E2.link = "linkLost1E2"
		lostS1E3.link = "linkLost1E13"
		
		foundS1E1.link = "linkfoundS1E1"
		/*  foundS1E2 lo dejaremos sin  link a  you tube*/
		traiFlix.newSerie = lostSerie
		traiFlix.newSerie = foundSerie
		
		/*agrego alguna pelicula */
		val elPadrino = new Movie
		elPadrino.title = "El Padrino"
		elPadrino.link = "inkElPadrino"
		val teletubis = new Movie
		teletubis.title = "La venganza del teletubi rojo"
		/* teletubies sin link a youTube */
		val karateKid = new Movie
		karateKid.title = "Karate Kid"
		karateKid.link = "linkKarateKid"
		
		traiFlix.newMovie = elPadrino
		traiFlix.newMovie = teletubis
		traiFlix.newMovie = karateKid
				
		assertTrue( 2 == traiFlix.linklessContent.size)
		
		val elPadrino2 = new Movie
		elPadrino2.title = "El Padrino II"
		elPadrino2.link = "inkElPadrino II"
		traiFlix.newMovie = elPadrino2
		
		assertTrue( 2 == traiFlix.linklessContent.size)
		
		val karateKid2 = new Movie
		karateKid2.title = "Karate Kid 2"
		/* karate kid 2 sin link a youTube */
		traiFlix.newMovie = karateKid2
		
		assertTrue( 3 == traiFlix.linklessContent.size)
		}
		
		@Test
		def void addCategory() {
			var traiflix = new TraiFlix
			var category = new Category("Western")
			
			traiflix.addCategory(category)
			
			assertTrue( traiflix.categories.contains(category) )
		}
		
		@Test
		def void addClassification() {
			var traiflix = new TraiFlix
			var clasification = new Clasification("Western")
			
			traiflix.addClassification(clasification)
			
			assertTrue( traiflix.classifications.contains(clasification) )
		}
		
		@Test
		def void deleteMovie() {
			var traiflix = new TraiFlix
			var movie = new Movie
			
			traiflix.setNewMovie(movie)
			assertTrue( traiflix.movies.contains(movie) )
			
			traiflix.deleteMovie(movie.id)
			assertFalse( traiflix.movies.contains(movie) )
		}
		
		@Test
		def void deleteSerie() {
			var traiflix = new TraiFlix
			var serie = new Serie
			
			traiflix.setNewSerie(serie)
			assertTrue( traiflix.series.contains(serie) )
			
			traiflix.deleteSerie(serie.id)
			assertFalse( traiflix.series.contains(serie) )
		}
		
		@Test
		def void recomendSerieToFriendUser() {
			var traiflix = new TraiFlix
			var carlos = new User => [ id=1 ]
			var juan = new User => [ id=2 ]
			var serie = new Serie
			
			traiflix.setNewUser(carlos)
			traiflix.setNewUser(juan)
			traiflix.userBeacomeFriendOf(carlos,juan)
			
			traiflix.recomendSerieToUser(juan,carlos,serie)			

			assertTrue( traiflix.recommendedContentOfUser(carlos.id).contains(serie) )
		}
		
		@Test
		def void recomendSerieToNoFriendUser() {
			var traiflix = new TraiFlix
			var carlos = new User => [ id=1 ]
			var juan = new User => [ id=2 ]
			var serie = new Serie
			
			traiflix.setNewUser(carlos)
			traiflix.setNewUser(juan)			
			
			traiflix.recomendSerieToUser(juan,carlos,serie)			

			assertFalse( traiflix.recommendedContentOfUser(carlos.id).contains(serie) )
		}

		@Test
		def void getRelatableContent() {
			var traiflix = new TraiFlix
			var movie = new Movie
			var movietoRelateWith = new Movie
			var serie = new Serie
			
			traiflix.setNewMovie(movie)
			traiflix.setNewMovie(movietoRelateWith)
			traiflix.setNewSerie(serie)
			
			var relatableContent = traiflix.getRelatableContent(movietoRelateWith)
			assertTrue( relatableContent.size == 2 )
			assertTrue( relatableContent.contains(movie) )
			assertTrue( relatableContent.contains(serie) )
			assertFalse( relatableContent.contains(movietoRelateWith) )			
		}
	
		@Test
	def void searchRelatableContentWithText() {
				
		lostSerie.title = "Lost"
		foundSerie.title = "Found"		
		var traiFlix = new TraiFlix
				
		lostS1E1.link = "linkLost1E1"
		lostS1E2.link = "linkLost1E2"
		lostS1E3.link = "linkLost1E13"
		
		foundS1E1.link = "linkfoundS1E1"
		/*  foundS1E2 lo dejaremos sin  link a  you tube*/
		traiFlix.newSerie = lostSerie
		traiFlix.newSerie = foundSerie
		
		/*agrego alguna pelicula */
		val elPadrino = new Movie
		elPadrino.title = "El Padrino"
		elPadrino.link = "inkElPadrino"
		val teletubis = new Movie
		teletubis.title = "La venganza del teletubi rojo"
		/* teletubies sin link a youTube */
		val karateKid = new Movie
		karateKid.title = "Karate Kid"
		karateKid.link = "linkKarateKid"
		
		traiFlix.newMovie = elPadrino
		traiFlix.newMovie = teletubis
		traiFlix.newMovie = karateKid
				
		assertTrue( 1 == traiFlix.searchRelationalContent("El").size)
		
		val elPadrino2 = new Movie
		elPadrino2.title = "El Padrino II"
		elPadrino2.link = "inkElPadrino II"
		traiFlix.newMovie = elPadrino2
		
		assertTrue( 2 == traiFlix.searchRelationalContent("El").size)
		
		assertTrue( 1 == traiFlix.searchRelationalContent("Kid").size)
		val karateKid2 = new Movie
		karateKid2.title = "Karate Kid 2"
		/* karate kid 2 sin link a youTube */
		traiFlix.newMovie = karateKid2
		
		assertTrue( 2 == traiFlix.searchRelationalContent("Kid").size)
		}
	

	
}