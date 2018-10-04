package ar.edu.unq.api.TraiFlix_api_rest;

import ar.edu.unq.TraiFlix.models.Category;
import ar.edu.unq.TraiFlix.models.Favourable;
import ar.edu.unq.TraiFlix.models.Movie;
import ar.edu.unq.TraiFlix.models.Ratingable;
import ar.edu.unq.TraiFlix.models.Serie;
import ar.edu.unq.TraiFlix.models.TraiFlix;
import ar.edu.unq.TraiFlix.models.User;
import ar.edu.unq.TraiFlix.models.id.ContentId;
import ar.edu.unq.TraiFlix.models.id.ContentIdFactory;
import ar.edu.unq.TraiFlix.models.id.MovieId;
import ar.edu.unq.TraiFlix.models.id.SerieId;
import ar.edu.unq.api.TraiFlix_api_rest.Actor;
import ar.edu.unq.api.TraiFlix_api_rest.dataResults.DataResult;
import com.google.common.base.Objects;
import java.io.IOException;
import java.security.InvalidParameterException;
import java.util.List;
import java.util.function.Function;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.eclipse.jetty.server.Request;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Extension;
import org.uqbar.xtrest.api.Result;
import org.uqbar.xtrest.api.annotation.Body;
import org.uqbar.xtrest.api.annotation.Controller;
import org.uqbar.xtrest.api.annotation.Delete;
import org.uqbar.xtrest.api.annotation.Get;
import org.uqbar.xtrest.api.annotation.Post;
import org.uqbar.xtrest.api.annotation.Put;
import org.uqbar.xtrest.http.ContentType;
import org.uqbar.xtrest.json.JSONUtils;
import org.uqbar.xtrest.result.ResultFactory;

/**
 * Servidor RESTful implementado con XtRest.
 */
@Controller
@SuppressWarnings("all")
public class RestfulServer extends ResultFactory {
  @Extension
  private JSONUtils _jSONUtils = new JSONUtils();
  
  private TraiFlix traiFlixsSystem;
  
  public RestfulServer(final TraiFlix traiFlixsSystem) {
    this.traiFlixsSystem = traiFlixsSystem;
  }
  
  /**
   * Determinar si es un usuario válido o no
   * 
   * 		Parametros
   * 		 	● Body [ {username​: nombre del usuario a autenticarse}]
   * 
   * 		Responses:
   * 			● 204 No content
   * 			● 200 OK
   * 			● 401 Unauthorized
   */
  @Post("/auth")
  public Result autentification(@Body final String body, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    return ResultFactory.ok();
  }
  
  /**
   * Retorna el listado de las categorías de la plataforma
   * 
   * 		Responses:
   * 			● 200 OK
   */
  @Get("/categories")
  public Result getCategories(final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    final Function<Category, String> _function = new Function<Category, String>() {
      public String apply(final Category elem) {
        return elem.getName();
      }
    };
    Object[] _array = this.traiFlixsSystem.getCategories().stream().<String>map(_function).toArray();
    DataResult data = new DataResult(_array);
    return ResultFactory.ok(this._jSONUtils.toJson(data));
  }
  
  /**
   * Retorna el listado de los contenidos que tengan la categoría {category}.
   * En los contenidos puede haber Películas y Series, pero no Capítulos de series.
   * 
   * 		Responses:
   * 			● 200 OK
   */
  @Get("/content/:category")
  public Result getCategoriesContents(final String category, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    response.setContentType(ContentType.APPLICATION_JSON);
    try {
      final Category cat = new Category(category);
      final List<Ratingable> content = this.traiFlixsSystem.moviesAndSeriesCategory(cat);
      return ResultFactory.ok(this._jSONUtils.toJson(cat));
    } catch (final Throwable _t) {
      if (_t instanceof Exception) {
        final Exception exception = (Exception)_t;
        String _message = exception.getMessage();
        String _plus = ("Problemas buscando contenidos en la categoria. " + _message);
        return ResultFactory.badRequest(this.getErrorJson(_plus));
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  /**
   * Retorna el listado del contenido favorito del usuario. En los contenidos puede
   * haber Películas y Series, pero no Capítulos de series.
   * 
   * 		Responses:
   * 			● 200 OK
   */
  @Get("/:username/favs")
  public Result getContentsUserFavs(final String username, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    try {
      List<Favourable> _userFavourites = this.traiFlixsSystem.userFavourites(username);
      DataResult data = new DataResult(_userFavourites);
      return ResultFactory.ok(this._jSONUtils.toJson(data));
    } catch (final Throwable _t) {
      if (_t instanceof Exception) {
        final Exception exception = (Exception)_t;
        String _message = exception.getMessage();
        String _plus = ("Problemas buscando favoritos. " + _message);
        return ResultFactory.badRequest(this.getErrorJson(_plus));
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  /**
   * Que retorne la información de la película con id {id} para el usuario {username}.
   * Se debe añadir también cierta información relevante para el usuario: si vió la película
   * y también la lista de amigos que se la recomendaron
   * 
   * 		Parámetros
   * 			● id​: el id de la película
   * 			● username​: nombre del usuario
   * 
   * 		Responses:
   * 			● 200 OK
   * 			● 404 Not Found
   */
  @Get(":username/movie/:id")
  public Result getMoviesUserFavs(final String username, final String id, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    return ResultFactory.ok();
  }
  
  /**
   * Que retorne la información para {username} de la serie con id = {id}.
   * 
   * 		Parámetros
   * 			● id​: el id de la serie
   * 			● username​: nombre del usuario
   * 
   * 		Responses:
   * 			● 200 OK
   * 			● 404 Not Found
   */
  @Get("/:username/serie/:id")
  public Result getSeriesUserFavs(final String username, final String id, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    Result _xblockexpression = null;
    {
      String errorMessage = null;
      try {
        this.checkUser(username);
        ContentId _parse = ContentIdFactory.parse(id);
        SerieId serieId = ((SerieId) _parse);
        Serie serie = this.traiFlixsSystem.serie(serieId);
        boolean _notEquals = (!Objects.equal(serie, null));
        if (_notEquals) {
          return ResultFactory.ok(this._jSONUtils.toJson(serie));
        } else {
          String _string = serieId.toString();
          String _plus = ("No existe la serie con id: " + _string);
          errorMessage = _plus;
        }
      } catch (final Throwable _t) {
        if (_t instanceof Exception) {
          final Exception exception = (Exception)_t;
          String _message = exception.getMessage();
          String _plus_1 = ("Error buscando la serie. " + _message);
          errorMessage = _plus_1;
        } else {
          throw Exceptions.sneakyThrow(_t);
        }
      }
      _xblockexpression = ResultFactory.badRequest(this.getErrorJson(errorMessage));
    }
    return _xblockexpression;
  }
  
  /**
   * Genera una recomendación de una serie o película de un usuario a otro.
   * 
   * 		Parametros
   * 			● type​: Tipo del contenido. Debería aceptar sólo alguno de estos valores:
   * 				[movie, serie]
   * 			● id​: Id del contenido
   * 			● user-from​: nombre de usuario que recomienda un contenido
   * 			● user-to​: nombre de usuario al que le recomiendan un contenido
   * 
   * 		Responses:
   * 			● 202 Accepted
   * 			● 200 OK
   * 			● 400 Bad Request
   */
  @Post("/recommend/:type/:id")
  public Result recomended(@Body final String body, final String type, final String id, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    return ResultFactory.ok();
  }
  
  /**
   * Que busque en todo el contenido y retorne aquellos que matchean con la búsqueda
   * 
   * 		Parámetros
   * 			● text​: Valor a buscar
   * 		Responses
   * 			● 200 OK
   * 			● 400 Bad Request
   */
  @Post("/search")
  public Result search(@Body final String body, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    return ResultFactory.ok();
  }
  
  /**
   * Que establezca si el usuario marcó como visto o no visto determinado contenido.
   * 
   * 		Parámetros
   * 			● type​: Tipo del contenido. Debería aceptar sólo alguno de estos valores:
   * 				[movie, serie]
   * 			● id​: Id del contenido
   * 			● value​: Valor booleano que indique si se marca como favorito o se quita de los
   * 				favoritos. Debería aceptar sólo alguno de estos valores: [true, false]
   * 			● username​: Nombre de usuario que está generando la acción
   * 		Responses
   * 			● 202 Accepted
   * 			● 200 OK
   * 			● 400 Bad Request
   */
  @Put("/:username/fav/:type/:id")
  public Result setWatchedUser(@Body final String body, final String username, final String type, final String id, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    return ResultFactory.ok();
  }
  
  /**
   * Establece el rating estipulado por el usuario.
   * 
   * 		Parámetros
   * 			● type​: Tipo del contenido. Debería aceptar sólo alguno de estos valores:
   * 				[movie, chapter]
   * 			● id​: Id del contenido
   * 			● stars​: Valor que represente el rating efectuado. Debería aceptar sólo alguno
   * 				de estos valores: [1, 2, 3, 4, 5]
   * 			● username​: Nombre de usuario que está generando la acción
   * 		Responses
   * 			● 202 Accepted
   * 			● 200 OK
   * 			● 400 Bad Request
   */
  @Put("/:username/rating/:type/:id")
  public Result setRatingUser(@Body final String body, final String username, final String type, final String id, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    return ResultFactory.ok();
  }
  
  /**
   * Permite obtener el listado total de las peliculas
   */
  @Get("/movies")
  public Result getMovies(final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    response.setContentType(ContentType.APPLICATION_JSON);
    return ResultFactory.ok(this._jSONUtils.toJson(this.traiFlixsSystem.getMovies()));
  }
  
  /**
   * Permite agregar un actor (con nombre)a la pelicula informada por parámetro
   */
  @Post("/movies/:nameMovie/:nameActor")
  public Result addNameActorToMovie(final String nameMovie, final String nameActor, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    response.setContentType(ContentType.APPLICATION_JSON);
    try {
      final Movie movie = this.traiFlixsSystem.searchMovie(nameMovie);
      String _actors = movie.getActors();
      String _plus = (_actors + ", ");
      String _plus_1 = (_plus + nameActor);
      movie.setActors(_plus_1);
      return ResultFactory.ok();
    } catch (final Throwable _t) {
      if (_t instanceof Exception) {
        final Exception exception = (Exception)_t;
        String _message = exception.getMessage();
        String _plus_2 = (_message + " No existe la serie con nombre: ");
        String _plus_3 = (_plus_2 + nameMovie);
        return ResultFactory.badRequest(this.getErrorJson(_plus_3));
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  /**
   * Permite agregar un actor a la pelicula informada por parámetro.
   * El actor debe ser enviado en el body del mensaje
   */
  @Post("/movies/:movieName")
  public Result addActorToMovie(@Body final String body, final String movieName, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    response.setContentType(ContentType.APPLICATION_JSON);
    try {
      final Actor actor = this._jSONUtils.<Actor>fromJson(body, Actor.class);
      final Movie movie = this.traiFlixsSystem.searchMovie(movieName);
      String _actors = movie.getActors();
      String _plus = (_actors + ", ");
      String _name = actor.getName();
      String _plus_1 = (_plus + _name);
      movie.setActors(_plus_1);
      return ResultFactory.ok();
    } catch (final Throwable _t) {
      if (_t instanceof Exception) {
        final Exception exception = (Exception)_t;
        String _message = exception.getMessage();
        String _plus_2 = (_message + " No existe la peli con nombre: ");
        String _plus_3 = (_plus_2 + movieName);
        return ResultFactory.badRequest(this.getErrorJson(_plus_3));
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  /**
   * Permite eliminar un por su id.
   * 
   * Atiende requests de la forma DELETE /series/1.
   */
  @Delete("/movies")
  public Result deleteSerieById(@Body final String body, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    try {
      final MovieId id = this._jSONUtils.<MovieId>fromJson(body, MovieId.class);
      this.traiFlixsSystem.deleteMovie(id);
      return ResultFactory.ok();
    } catch (final Throwable _t) {
      if (_t instanceof NumberFormatException) {
        final NumberFormatException exception = (NumberFormatException)_t;
        return ResultFactory.badRequest(this.getErrorJson("El id debe ser un número entero"));
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  private String getErrorJson(final String message) {
    return (("{ \"status\": \"error\",\n  \"message\": \"" + message) + "\" }");
  }
  
  private void checkUser(final String userName) {
    User _findUserByNickName = this.traiFlixsSystem.findUserByNickName(userName);
    boolean _equals = Objects.equal(_findUserByNickName, null);
    if (_equals) {
      throw new InvalidParameterException(("No existe el usuario " + userName));
    }
  }
  
  public void handle(final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException {
    {
    	Matcher matcher = 
    		Pattern.compile("/categories").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Get") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		
    		
    	    Result result = getCategories(target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/movies").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Get") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		
    		
    	    Result result = getMovies(target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/auth").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Post") && matcher.matches()) {
    		// take parameters from request
    		String body = readBodyAsString(request);
    		
    		// take variables from url
    		
    		
    	    Result result = autentification(body, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/search").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Post") && matcher.matches()) {
    		// take parameters from request
    		String body = readBodyAsString(request);
    		
    		// take variables from url
    		
    		
    	    Result result = search(body, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/movies").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Delete") && matcher.matches()) {
    		// take parameters from request
    		String body = readBodyAsString(request);
    		
    		// take variables from url
    		
    		
    	    Result result = deleteSerieById(body, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/content/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Get") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		String category = matcher.group(1);
    		
    		
    	    Result result = getCategoriesContents(category, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/(\\w+)/favs").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Get") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		String username = matcher.group(1);
    		
    		
    	    Result result = getContentsUserFavs(username, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/movies/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Post") && matcher.matches()) {
    		// take parameters from request
    		String body = readBodyAsString(request);
    		
    		// take variables from url
    		String movieName = matcher.group(1);
    		
    		
    	    Result result = addActorToMovie(body, movieName, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("(\\w+)/movie/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Get") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		String username = matcher.group(1);
    		String id = matcher.group(2);
    		
    		
    	    Result result = getMoviesUserFavs(username, id, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/(\\w+)/serie/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Get") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		String username = matcher.group(1);
    		String id = matcher.group(2);
    		
    		
    	    Result result = getSeriesUserFavs(username, id, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/recommend/(\\w+)/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Post") && matcher.matches()) {
    		// take parameters from request
    		String body = readBodyAsString(request);
    		
    		// take variables from url
    		String type = matcher.group(1);
    		String id = matcher.group(2);
    		
    		
    	    Result result = recomended(body, type, id, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/movies/(\\w+)/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Post") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		String nameMovie = matcher.group(1);
    		String nameActor = matcher.group(2);
    		
    		
    	    Result result = addNameActorToMovie(nameMovie, nameActor, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/(\\w+)/fav/(\\w+)/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Put") && matcher.matches()) {
    		// take parameters from request
    		String body = readBodyAsString(request);
    		
    		// take variables from url
    		String username = matcher.group(1);
    		String type = matcher.group(2);
    		String id = matcher.group(3);
    		
    		
    	    Result result = setWatchedUser(body, username, type, id, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/(\\w+)/rating/(\\w+)/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Put") && matcher.matches()) {
    		// take parameters from request
    		String body = readBodyAsString(request);
    		
    		// take variables from url
    		String username = matcher.group(1);
    		String type = matcher.group(2);
    		String id = matcher.group(3);
    		
    		
    	    Result result = setRatingUser(body, username, type, id, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    //this.pageNotFound(baseRequest, request, response);
  }
}