package ar.edu.unq.api.TraiFlix_api_rest

import ar.edu.unq.TraiFlix.models.Assessment
import ar.edu.unq.TraiFlix.models.Favourable
import ar.edu.unq.TraiFlix.models.TraiFlix
import ar.edu.unq.TraiFlix.models.id.ContentIdFactory
import ar.edu.unq.TraiFlix.models.id.MovieId
import ar.edu.unq.TraiFlix.models.id.SerieId
import ar.edu.unq.api.TraiFlix_api_rest.dataResults.DataResult
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.Actor
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.CategoryToShow
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.Searched
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.Star
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.Text
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.UserRest
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.UserToAndFrom
import java.security.InvalidParameterException
import java.util.ArrayList
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Delete
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.NamesCategories
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.FavouriteToShow
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.RecommendToShow
import ar.edu.unq.TraiFlix.models.id.ContentId

/**
 * Servidor RESTful implementado con XtRest.
 */
@Controller
class RestfulServer {

	extension JSONUtils = new JSONUtils

	TraiFlix traiFlixsSystem
	NamesCategories namesCategories

	new(TraiFlix traiFlixsSystem) {
		this.traiFlixsSystem = traiFlixsSystem
		this.namesCategories = new NamesCategories
	}

	//GENERAL

	
	/**
	 *  Determinar si es un usuario válido o no
	 * 
	 * 		Parametros
	 * 		 	● Body [ {username​: nombre del usuario a autenticarse}]
	 * 		
	 *		Responses:
	 *			● 204 No content  
	 * 			● 200 OK
	 * 			● 401 Unauthorized
	 */
	@Post("/auth")
	def autentification(@Body String body) {
		response.contentType = ContentType.APPLICATION_JSON
		
		try{
			
			val user = body.fromJson(UserRest)
			checkUser(user.username)
				return ok()
	
		}catch(Exception e)
			return badRequest('{"status": "Error","message":"Usuario Invalido", "codeError":401}')
	}
	

	
	/**
	 * Retorna el listado de las categorías de la plataforma
	 * 
	 * 		Responses:
	 *			● 200 OK
	 * 
	 */
	@Get("/categories")
	def getCategories() {
		response.contentType = ContentType.APPLICATION_JSON
		
		this.namesCategories.namesToShow = this.traiFlixsSystem.categories;
		
		var data = new DataResult(this.namesCategories.names); 
		return ok( data.toJson )	
	}
	
	/**
	 * Retorna el listado de los contenidos que tengan la categoría {category}. 
	 * En los contenidos puede haber Películas y Series, pero no Capítulos de series.
	 * 
	 * 		Responses:
	 *			● 200 OK
	 * 
	 */
	@Get("/content/:category")
	def getCategoriesContents() {		
		response.contentType = ContentType.APPLICATION_JSON
		
		try{
			val cat = this.traiFlixsSystem.findCategory(category)
			val contentMovies = this.traiFlixsSystem.moviesCategory(cat)
			val contentSeries = this.traiFlixsSystem.seriesCategory(cat)
			val contentToShow = new CategoryToShow(cat.name, contentMovies, contentSeries)
			return ok(contentToShow.toJson)	
		}
		catch(Exception exception){
			return badRequest( getErrorJson("Problemas buscando contenidos en la categoria. " + exception.message ) ) 
		}
	}
	
	/**
	 * Retorna el listado del contenido favorito del usuario. En los contenidos puede
	 * haber Películas y Series, pero no Capítulos de series.
	 * 
	 * 		Responses:
	 *			● 200 OK
	 * 
	 * 
	 */
	@Get("/:username/favs")
	def getContentsUserFavs() {
		response.contentType = ContentType.APPLICATION_JSON
		
		try
		{	
			var data = new FavouriteToShow(this.traiFlixsSystem.findUserByNickName(username).favourites);			
			return ok( data.toJson )
		}
		catch( Exception exception ) {
			return badRequest( getErrorJson("Problemas buscando favoritos. " + exception.message ) )
		}
		
	}
	
	@Get("/:username/recomended")
	def getContentsRecomendedToUser() {
		
		try
		{	var data = new RecommendToShow(this.traiFlixsSystem.recomendedContentOfUser(username));				
			return ok( data.toJson )
		}
		catch( Exception exception ) {
			return badRequest( getErrorJson("Problemas buscando recomendados. " + exception.message ) )
		}
		
	}
	

	
	/**
	 * Que retorne la información para {username} de el contenido con id = {id}.
	 * 
	 * 		Parámetros
	 *			● id​: el id del contenido
	 *			● username​: nombre del usuario
	 * 
	 * 		Responses:
	 *			● 200 OK
	 * 			● 404 Not Found
	 */
	@Get("/:username/content/:id")
	def getContentUser() {		
		response.contentType = ContentType.APPLICATION_JSON
		
		try
		{
			checkUser(username)
			
			var contentId = ContentIdFactory.parse(id)
			
			
			if(contentId.movie) {
				getMovieUser(contentId as MovieId)
			}
			else {
				getSerieUser(contentId as SerieId)
			}
			
			
		}
		catch( Exception exception )
		{
			badRequest( "Error buscando el contenido. " + exception.message)
		}
	}
	
	def getSerieUser(SerieId id) {
		var serie = traiFlixsSystem.serie(id)
		if( serie !== null )
			return ok( serie.toJson )
		else
			return badRequest("No existe la serie con id: " + id.toString)
	}	
	
	def getMovieUser(MovieId id) {
		var movie = traiFlixsSystem.movie(id)
		if( movie !== null )
			return ok( movie.toJson )
		else
			return badRequest("No existe la movie con id: " + id.toString)
	}	

	
	
		/**
	 *  Genera una recomendación de una serie o película de un usuario a otro.
	 * 
	 * 		Parametros
	 *			● type​: Tipo del contenido. Debería aceptar sólo alguno de estos valores:
	 *				[movie, serie]
	 *			● id​: Id del contenido
	 *			● user-from​: nombre de usuario que recomienda un contenido
	 *			● user-to​: nombre de usuario al que le recomiendan un contenido
	 * 		
	 *		Responses:
	 *			● 202 Accepted 
	 *			● 200 OK
	 *			● 400 Bad Request
	 */
	 
	 
	 
	@Post("/recommend/:type/:id")
	def recomended(@Body String body) {
		response.contentType = ContentType.APPLICATION_JSON
		
		try{
			val users = body.fromJson(UserToAndFrom);
			val user1 = this.traiFlixsSystem.searchUser(users.userFrom)
			val user2 = this.traiFlixsSystem.searchUser(users.userTo)
			val idContent = ContentIdFactory.parse(id)
			val content = this.traiFlixsSystem.contentRatingable(idContent)
			this.traiFlixsSystem.userBeacomeFriendOf(user1,user2)
			this.traiFlixsSystem.recomendContentToUser(user1, user2, content)
			return ok()
		}
		catch(Exception exception){
			return badRequest( getErrorJson("Problemas al recomendar un contenido " + exception.message ) )
		}
	}
	
	/**
	 * Que busque en todo el contenido y retorne aquellos que matchean con la búsqueda
	 * 	
	 * 		Parámetros
	 * 			● text​: Valor a buscar
	 * 		Responses
	 *			● 200 OK
	 *			● 400 Bad Request
	 * 
	 */
	@Post("/search")
	def search(@Body String body) {		
		response.contentType = ContentType.APPLICATION_JSON
		
		try {
			val textSearch =  body.fromJson(Text)
			val content = this.traiFlixsSystem.searchRelationalContent(textSearch.text)
			val res = new Searched
			res.category = 'Busqueda'
			res.data = content			
			return ok(res.toJson )
		} catch (Exception exception) {
			return badRequest(getErrorJson(exception.message + " No existe la serie con nombre: "  ))
			}
		
	}
	
	
	
	/**
	 * Que establezca si el usuario marcó como favorito o no determinado contenido.
	 * 	
	 * 		Parámetros
	 * 			● type​: Tipo del contenido. Debería aceptar sólo alguno de estos valores:
	 *				[movie, serie]
	 *			● id​: Id del contenido
	 *			● value​: Valor booleano que indique si se marca como favorito o se quita de los
	 *				favoritos. Debería aceptar sólo alguno de estos valores: [true, false]
	 *			● username​: Nombre de usuario que está generando la acción
	 * 		Responses
	 *			● 202 Accepted
	 * 			● 200 OK
	 *			● 400 Bad Request
	 * 
	 */
	@Put("/:username/fav/:type/:id/:value")
	def setUserFavContent(@Body String body) {
		response.contentType = ContentType.APPLICATION_JSON
		
		try {			
			var user = traiFlixsSystem.findUserByNickName(username)
			var contentId = ContentIdFactory.parse(id)
			
			var Favourable content
			switch( type.toLowerCase ) {
				case "movie":
					content = traiFlixsSystem.movie(contentId as MovieId)
				case "serie":
					content = traiFlixsSystem.serie(contentId as SerieId)
				default:
					throw new InvalidParameterException( "El tipo de contenido " + type + " no es valido." )
			}			
			
			if( Boolean.parseBoolean(value) ) user.addFavourite(content)
			else user.removeFavourite(content)
			
			return ok()	
		}
		catch( Exception exception ) {
			return badRequest( getErrorJson("Problemas administrando favoritos. " + exception.message ) )			
		}	
		
	}
	
	/**
	 * Que establezca si el usuario marcó como visto o no determinado contenido.
	 * 	
	 * 		Parámetros
	 * 			● type​: Tipo del contenido. Debería aceptar sólo alguno de estos valores:
	 *				[movie, serie]
	 *			● id​: Id del contenido
	 *			● value​: Valor booleano que indique si se marca como visto o se quita de los
	 *				vistos. Debería aceptar sólo alguno de estos valores: [true, false]
	 *			● username​: Nombre de usuario que está generando la acción
	 * 		Responses
	 *			● 202 Accepted
	 * 			● 200 OK
	 *			● 400 Bad Request
	 * 
	 */
	@Put("/:username/watched/:type/:id/:value")
	def setUserWatchedContent(@Body String body) {
		response.contentType = ContentType.APPLICATION_JSON
		
		try {			
			var user = traiFlixsSystem.findUserByNickName(username)
			var contentId = ContentIdFactory.parse(id)
			var add =  Boolean.parseBoolean(value)
			
			switch( type.toLowerCase ) {
				case "movie": {
						var movie = traiFlixsSystem.movie(contentId as MovieId)
						if(add) user.addWatchedContent(movie)
						else user.removeWatchedContent(movie)					
					}
				case "serie": {
						var serie = traiFlixsSystem.serie(contentId as SerieId)
						if(add) {
							if(serie.episodes !== null)
								user.addWatchedContent(serie.episodes.get(0))
							else
								throw new InvalidParameterException( "No se puede marcar como vista una serie sin capitulos." )
						}
						else user.removeWatchedSerie(serie)					
					}
				default:
					throw new InvalidParameterException( "El tipo de contenido " + type + " no es valido." )
			}
			
			return ok()	
		}
		catch( Exception exception ) {
			return badRequest( getErrorJson("Problemas administrando contenido visto. " + exception.message ) )			
		}	
		
	}
	
	
	/**
	 * Establece el rating estipulado por el usuario.
	 * 	
	 * 		Parámetros
	 *			● type​: Tipo del contenido. Debería aceptar sólo alguno de estos valores:
	 *				[movie, chapter]
	 *			● id​: Id del contenido
	 *			● stars​: Valor que represente el rating efectuado. Debería aceptar sólo alguno
	 *				de estos valores: [1, 2, 3, 4, 5]
	 *			● username​: Nombre de usuario que está generando la acción
	 * 		Responses
	 *			● 202 Accepted
	 * 			● 200 OK
	 *			● 400 Bad Request
	 * 
	 */
	@Put("/:username/rating/:type/:id")
	def setRatingUser(@Body String body) {
		response.contentType = ContentType.APPLICATION_JSON
		
		try{
			val user = this.checkUser(username)
			var idContent = ContentIdFactory.parse(id)
			val stars = body.fromJson(Star)
			val assement = new Assessment(user,stars.value, stars.critic)
			val content = this.traiFlixsSystem.content(idContent)
			
			content.addAssessment(assement)
			
			return ok()	
		}
		catch( Exception exception ) {
			return badRequest( getErrorJson("Problemas agregando valoracion. " + exception.message ) )			
		}
		
		
	}
	
	
	/**
	 * Permite obtener el listado total de las series
	 */
	@Get("/series")
	def getSeries() {

		response.contentType = ContentType.APPLICATION_JSON
		
		
		return ok(this.traiFlixsSystem.series.toJson)
	}
	
	@Get("/episodes/:id")
	def getEpisodes() {

		response.contentType = ContentType.APPLICATION_JSON
		
		var idContent = ContentIdFactory.parse(id)

		return ok(this.traiFlixsSystem.serie(idContent as SerieId).episodes.toJson)
	}
	
	
	@Get("/user/:username")
	def getUser(){
		response.contentType = ContentType.APPLICATION_JSON
		
		return ok(this.checkUser(username).toJson)
	}
	
	@Get("/users")
	def getUsers(){
		response.contentType = ContentType.APPLICATION_JSON
		return ok(this.traiFlixsSystem.users.toJson)
	}	
	
	@Get("/all")
	def getAll(){
		
			val res = new Searched
			
			val series = this.traiFlixsSystem.series
			val movies = this.traiFlixsSystem.movies
			res.category = 'All'
			res.data = new ArrayList()
			res.data.addAll(series)
			res.data.addAll(movies)
			return ok(res.toJson)
	}
	
	
	//MOVIES

	/**
	 * Permite obtener el listado total de las peliculas
	 */
	@Get("/movies")
	def getMovies() {

		response.contentType = ContentType.APPLICATION_JSON

		return ok(this.traiFlixsSystem.movies.toJson)
	}


	/**
	 * Permite agregar un actor (con nombre)a la pelicula informada por parámetro
	 */
	@Post("/movies/:nameMovie/:nameActor")
	def addNameActorToMovie() {
		response.contentType = ContentType.APPLICATION_JSON
		try {
			val movie = this.traiFlixsSystem.searchMovie(nameMovie);
			movie.actors = movie.actors + ", " + nameActor
			return ok()
		} catch (Exception exception) {
			return badRequest(getErrorJson(exception.message + " No existe la serie con nombre: " + nameMovie))
		}
	}

	/**
	 * Permite agregar un actor a la pelicula informada por parámetro. 
	 * El actor debe ser enviado en el body del mensaje
	 */
	@Post("/movies/:movieName") 
	// http://0.0.0.0:9000/series/Breaking
	// Body [ { "name" : "as"}]
	//def agregarActor(String name) {
	def addActorToMovie(@Body String body) {
		response.contentType = ContentType.APPLICATION_JSON
		try {
			val actor = body.fromJson(Actor)

			val movie = this.traiFlixsSystem.searchMovie(movieName);
			movie.actors = movie.actors + ", " + actor.name
			return ok()
		} catch (Exception exception) {
			return badRequest(getErrorJson(exception.message + " No existe la peli con nombre: " + movieName))
				}
				
	}


	/**
     * Permite eliminar un por su id.
     * 
     * Atiende requests de la forma DELETE /series/1.
     */
    @Delete('/movies')
    def deleteSerieById(@Body String body) {
    	response.contentType = ContentType.APPLICATION_JSON
    	
        try {
        	val id = body.fromJson(MovieId)
            this.traiFlixsSystem.deleteMovie(id)
            
            return ok()
        } catch (NumberFormatException exception) {
            return badRequest(getErrorJson("El id debe ser un número entero"))
        }
    }
    
	private def getErrorJson(String message) {
		'{ "status": "error",\n  "message": "' + message + '" }'
	}
	
	private def checkUser(String userName ) {
		traiFlixsSystem.findUserByNickName(userName)
	}
	

}