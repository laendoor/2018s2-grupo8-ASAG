package ar.edu.unq.api.TraiFlix_api_rest;

import ar.edu.unq.TraiFlix.models.Assessment;
import ar.edu.unq.TraiFlix.models.Category;
import ar.edu.unq.TraiFlix.models.Content;
import ar.edu.unq.TraiFlix.models.Episode;
import ar.edu.unq.TraiFlix.models.Favourable;
import ar.edu.unq.TraiFlix.models.Movie;
import ar.edu.unq.TraiFlix.models.Ratingable;
import ar.edu.unq.TraiFlix.models.Relatable;
import ar.edu.unq.TraiFlix.models.Serie;
import ar.edu.unq.TraiFlix.models.TraiFlix;
import ar.edu.unq.TraiFlix.models.User;
import ar.edu.unq.TraiFlix.models.id.ContentId;
import ar.edu.unq.TraiFlix.models.id.ContentIdFactory;
import ar.edu.unq.TraiFlix.models.id.MovieId;
import ar.edu.unq.TraiFlix.models.id.SerieId;
import ar.edu.unq.api.TraiFlix_api_rest.dataResults.DataResult;
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.Actor;
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.CategoryToShow;
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.FavouriteToShow;
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.NamesCategories;
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.RecommendToShow;
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.Searched;
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.Star;
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.Text;
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.UserRest;
import ar.edu.unq.api.TraiFlix_api_rest.domain_rest.UserToAndFrom;
import java.io.IOException;
import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.List;
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
  
  private NamesCategories namesCategories;
  
  public RestfulServer(final TraiFlix traiFlixsSystem) {
    this.traiFlixsSystem = traiFlixsSystem;
    NamesCategories _namesCategories = new NamesCategories();
    this.namesCategories = _namesCategories;
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
    response.setContentType(ContentType.APPLICATION_JSON);
    try {
      final UserRest user = this._jSONUtils.<UserRest>fromJson(body, UserRest.class);
      this.checkUser(user.getUsername());
      return ResultFactory.ok();
    } catch (final Throwable _t) {
      if (_t instanceof Exception) {
        return ResultFactory.badRequest("{\"status\": \"Error\",\"message\":\"Usuario Invalido\", \"codeError\":401}");
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  /**
   * Retorna el listado de las categorías de la plataforma
   * 
   * 		Responses:
   * 			● 200 OK
   */
  @Get("/categories")
  public Result getCategories(final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    response.setContentType(ContentType.APPLICATION_JSON);
    this.namesCategories.setNamesToShow(this.traiFlixsSystem.getCategories());
    List<String> _names = this.namesCategories.getNames();
    DataResult data = new DataResult(_names);
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
      final Category cat = this.traiFlixsSystem.findCategory(category);
      final List<Movie> contentMovies = this.traiFlixsSystem.moviesCategory(cat);
      final List<Serie> contentSeries = this.traiFlixsSystem.seriesCategory(cat);
      String _name = cat.getName();
      final CategoryToShow contentToShow = new CategoryToShow(_name, contentMovies, contentSeries);
      return ResultFactory.ok(this._jSONUtils.toJson(contentToShow));
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
    response.setContentType(ContentType.APPLICATION_JSON);
    try {
      List<Favourable> _favourites = this.traiFlixsSystem.findUserByNickName(username).getFavourites();
      FavouriteToShow data = new FavouriteToShow(_favourites);
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
  
  @Get("/:username/recomended")
  public Result getContentsRecomendedToUser(final String username, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    try {
      List<Ratingable> _recomendedContentOfUser = this.traiFlixsSystem.recomendedContentOfUser(username);
      RecommendToShow data = new RecommendToShow(_recomendedContentOfUser);
      return ResultFactory.ok(this._jSONUtils.toJson(data));
    } catch (final Throwable _t) {
      if (_t instanceof Exception) {
        final Exception exception = (Exception)_t;
        String _message = exception.getMessage();
        String _plus = ("Problemas buscando recomendados. " + _message);
        return ResultFactory.badRequest(this.getErrorJson(_plus));
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  /**
   * Que retorne la información para {username} de el contenido con id = {id}.
   * 
   * 		Parámetros
   * 			● id​: el id del contenido
   * 			● username​: nombre del usuario
   * 
   * 		Responses:
   * 			● 200 OK
   * 			● 404 Not Found
   */
  @Get("/:username/content/:id")
  public Result getContentUser(final String username, final String id, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    Result _xblockexpression = null;
    {
      response.setContentType(ContentType.APPLICATION_JSON);
      Result _xtrycatchfinallyexpression = null;
      try {
        Result _xblockexpression_1 = null;
        {
          this.checkUser(username);
          ContentId contentId = ContentIdFactory.parse(id);
          Result _xifexpression = null;
          boolean _isMovie = contentId.isMovie();
          if (_isMovie) {
            _xifexpression = this.getMovieUser(((MovieId) contentId));
          } else {
            _xifexpression = this.getSerieUser(((SerieId) contentId));
          }
          _xblockexpression_1 = _xifexpression;
        }
        _xtrycatchfinallyexpression = _xblockexpression_1;
      } catch (final Throwable _t) {
        if (_t instanceof Exception) {
          final Exception exception = (Exception)_t;
          String _message = exception.getMessage();
          String _plus = ("Error buscando el contenido. " + _message);
          _xtrycatchfinallyexpression = ResultFactory.badRequest(_plus);
        } else {
          throw Exceptions.sneakyThrow(_t);
        }
      }
      _xblockexpression = _xtrycatchfinallyexpression;
    }
    return _xblockexpression;
  }
  
  public Result getSerieUser(final SerieId id) {
    Serie serie = this.traiFlixsSystem.serie(id);
    if ((serie != null)) {
      return ResultFactory.ok(this._jSONUtils.toJson(serie));
    } else {
      String _string = id.toString();
      String _plus = ("No existe la serie con id: " + _string);
      return ResultFactory.badRequest(_plus);
    }
  }
  
  public Result getMovieUser(final MovieId id) {
    Movie movie = this.traiFlixsSystem.movie(id);
    if ((movie != null)) {
      return ResultFactory.ok(this._jSONUtils.toJson(movie));
    } else {
      String _string = id.toString();
      String _plus = ("No existe la movie con id: " + _string);
      return ResultFactory.badRequest(_plus);
    }
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
    response.setContentType(ContentType.APPLICATION_JSON);
    try {
      final UserToAndFrom users = this._jSONUtils.<UserToAndFrom>fromJson(body, UserToAndFrom.class);
      final User user1 = this.traiFlixsSystem.searchUser(users.getUserFrom());
      final User user2 = this.traiFlixsSystem.searchUser(users.getUserTo());
      final ContentId idContent = ContentIdFactory.parse(id);
      final Ratingable content = this.traiFlixsSystem.contentRatingable(idContent);
      this.traiFlixsSystem.userBeacomeFriendOf(user1, user2);
      this.traiFlixsSystem.recomendContentToUser(user1, user2, content);
      return ResultFactory.ok();
    } catch (final Throwable _t) {
      if (_t instanceof Exception) {
        final Exception exception = (Exception)_t;
        String _message = exception.getMessage();
        String _plus = ("Problemas al recomendar un contenido " + _message);
        return ResultFactory.badRequest(this.getErrorJson(_plus));
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
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
    response.setContentType(ContentType.APPLICATION_JSON);
    try {
      final Text textSearch = this._jSONUtils.<Text>fromJson(body, Text.class);
      final List<Relatable> content = this.traiFlixsSystem.searchRelationalContent(textSearch.getText());
      final Searched res = new Searched();
      res.setCategory("Busqueda");
      res.setData(content);
      return ResultFactory.ok(this._jSONUtils.toJson(res));
    } catch (final Throwable _t) {
      if (_t instanceof Exception) {
        final Exception exception = (Exception)_t;
        String _message = exception.getMessage();
        String _plus = (_message + " No existe la serie con nombre: ");
        return ResultFactory.badRequest(this.getErrorJson(_plus));
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  /**
   * Que establezca si el usuario marcó como favorito o no determinado contenido.
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
  @Put("/:username/fav/:type/:id/:value")
  public Result setUserFavContent(@Body final String body, final String username, final String type, final String id, final String value, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    response.setContentType(ContentType.APPLICATION_JSON);
    try {
      User user = this.traiFlixsSystem.findUserByNickName(username);
      ContentId contentId = ContentIdFactory.parse(id);
      Favourable content = null;
      String _lowerCase = type.toLowerCase();
      if (_lowerCase != null) {
        switch (_lowerCase) {
          case "movie":
            content = this.traiFlixsSystem.movie(((MovieId) contentId));
            break;
          case "serie":
            content = this.traiFlixsSystem.serie(((SerieId) contentId));
            break;
          default:
            throw new InvalidParameterException((("El tipo de contenido " + type) + " no es valido."));
        }
      } else {
        throw new InvalidParameterException((("El tipo de contenido " + type) + " no es valido."));
      }
      boolean _parseBoolean = Boolean.parseBoolean(value);
      if (_parseBoolean) {
        user.addFavourite(content);
      } else {
        user.removeFavourite(content);
      }
      return ResultFactory.ok();
    } catch (final Throwable _t) {
      if (_t instanceof Exception) {
        final Exception exception = (Exception)_t;
        String _message = exception.getMessage();
        String _plus = ("Problemas administrando favoritos. " + _message);
        return ResultFactory.badRequest(this.getErrorJson(_plus));
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  /**
   * Que establezca si el usuario marcó como visto o no determinado contenido.
   * 
   * 		Parámetros
   * 			● type​: Tipo del contenido. Debería aceptar sólo alguno de estos valores:
   * 				[movie, serie]
   * 			● id​: Id del contenido
   * 			● value​: Valor booleano que indique si se marca como visto o se quita de los
   * 				vistos. Debería aceptar sólo alguno de estos valores: [true, false]
   * 			● username​: Nombre de usuario que está generando la acción
   * 		Responses
   * 			● 202 Accepted
   * 			● 200 OK
   * 			● 400 Bad Request
   */
  @Put("/:username/watched/:type/:id/:value")
  public Result setUserWatchedContent(@Body final String body, final String username, final String type, final String id, final String value, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    response.setContentType(ContentType.APPLICATION_JSON);
    try {
      User user = this.traiFlixsSystem.findUserByNickName(username);
      ContentId contentId = ContentIdFactory.parse(id);
      boolean add = Boolean.parseBoolean(value);
      String _lowerCase = type.toLowerCase();
      if (_lowerCase != null) {
        switch (_lowerCase) {
          case "movie":
            Movie movie = this.traiFlixsSystem.movie(((MovieId) contentId));
            if (add) {
              user.addWatchedContent(movie);
            } else {
              user.removeWatchedContent(movie);
            }
            break;
          case "serie":
            Serie serie = this.traiFlixsSystem.serie(((SerieId) contentId));
            if (add) {
              List<Episode> _episodes = serie.getEpisodes();
              boolean _tripleNotEquals = (_episodes != null);
              if (_tripleNotEquals) {
                user.addWatchedContent(serie.getEpisodes().get(0));
              } else {
                throw new InvalidParameterException("No se puede marcar como vista una serie sin capitulos.");
              }
            } else {
              user.removeWatchedSerie(serie);
            }
            break;
          default:
            throw new InvalidParameterException((("El tipo de contenido " + type) + " no es valido."));
        }
      } else {
        throw new InvalidParameterException((("El tipo de contenido " + type) + " no es valido."));
      }
      return ResultFactory.ok();
    } catch (final Throwable _t) {
      if (_t instanceof Exception) {
        final Exception exception = (Exception)_t;
        String _message = exception.getMessage();
        String _plus = ("Problemas administrando contenido visto. " + _message);
        return ResultFactory.badRequest(this.getErrorJson(_plus));
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
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
    response.setContentType(ContentType.APPLICATION_JSON);
    try {
      final User user = this.checkUser(username);
      ContentId idContent = ContentIdFactory.parse(id);
      final Star stars = this._jSONUtils.<Star>fromJson(body, Star.class);
      Integer _value = stars.getValue();
      String _critic = stars.getCritic();
      final Assessment assement = new Assessment(user, _value, _critic);
      final Content content = this.traiFlixsSystem.content(idContent);
      content.addAssessment(assement);
      return ResultFactory.ok();
    } catch (final Throwable _t) {
      if (_t instanceof Exception) {
        final Exception exception = (Exception)_t;
        String _message = exception.getMessage();
        String _plus = ("Problemas agregando valoracion. " + _message);
        return ResultFactory.badRequest(this.getErrorJson(_plus));
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  /**
   * Permite obtener el listado total de las series
   */
  @Get("/series")
  public Result getSeries(final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    response.setContentType(ContentType.APPLICATION_JSON);
    return ResultFactory.ok(this._jSONUtils.toJson(this.traiFlixsSystem.getSeries()));
  }
  
  @Get("/episodes/:id")
  public Result getEpisodes(final String id, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    response.setContentType(ContentType.APPLICATION_JSON);
    ContentId idContent = ContentIdFactory.parse(id);
    return ResultFactory.ok(this._jSONUtils.toJson(this.traiFlixsSystem.serie(((SerieId) idContent)).getEpisodes()));
  }
  
  @Get("/user/:username")
  public Result getUser(final String username, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    response.setContentType(ContentType.APPLICATION_JSON);
    return ResultFactory.ok(this._jSONUtils.toJson(this.checkUser(username)));
  }
  
  @Get("/users")
  public Result getUsers(final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    response.setContentType(ContentType.APPLICATION_JSON);
    return ResultFactory.ok(this._jSONUtils.toJson(this.traiFlixsSystem.getUsers()));
  }
  
  @Get("/all")
  public Result getAll(final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    final Searched res = new Searched();
    final List<Serie> series = this.traiFlixsSystem.getSeries();
    final List<Movie> movies = this.traiFlixsSystem.getMovies();
    res.setCategory("All");
    ArrayList<Relatable> _arrayList = new ArrayList<Relatable>();
    res.setData(_arrayList);
    res.getData().addAll(series);
    res.getData().addAll(movies);
    return ResultFactory.ok(this._jSONUtils.toJson(res));
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
    response.setContentType(ContentType.APPLICATION_JSON);
    try {
      final MovieId id = this._jSONUtils.<MovieId>fromJson(body, MovieId.class);
      this.traiFlixsSystem.deleteMovie(id);
      return ResultFactory.ok();
    } catch (final Throwable _t) {
      if (_t instanceof NumberFormatException) {
        return ResultFactory.badRequest(this.getErrorJson("El id debe ser un número entero"));
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  private String getErrorJson(final String message) {
    return (("{ \"status\": \"error\",\n  \"message\": \"" + message) + "\" }");
  }
  
  private User checkUser(final String userName) {
    return this.traiFlixsSystem.findUserByNickName(userName);
  }
  
  public void handle(final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException {
    {
    	Matcher matcher = 
    		Pattern.compile("/categories").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Get") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = getCategories(target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/series").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Get") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = getSeries(target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/users").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Get") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = getUsers(target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/all").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Get") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = getAll(target, baseRequest, request, response);
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
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
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
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
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
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
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
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
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
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
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
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = getContentsUserFavs(username, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/(\\w+)/recomended").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Get") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		String username = matcher.group(1);
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = getContentsRecomendedToUser(username, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/episodes/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Get") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		String id = matcher.group(1);
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = getEpisodes(id, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/user/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Get") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		String username = matcher.group(1);
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = getUser(username, target, baseRequest, request, response);
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
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = addActorToMovie(body, movieName, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/(\\w+)/content/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Get") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		String username = matcher.group(1);
    		String id = matcher.group(2);
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = getContentUser(username, id, target, baseRequest, request, response);
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
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
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
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = addNameActorToMovie(nameMovie, nameActor, target, baseRequest, request, response);
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
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = setRatingUser(body, username, type, id, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/(\\w+)/fav/(\\w+)/(\\w+)/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Put") && matcher.matches()) {
    		// take parameters from request
    		String body = readBodyAsString(request);
    		
    		// take variables from url
    		String username = matcher.group(1);
    		String type = matcher.group(2);
    		String id = matcher.group(3);
    		String value = matcher.group(4);
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = setUserFavContent(body, username, type, id, value, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/(\\w+)/watched/(\\w+)/(\\w+)/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Put") && matcher.matches()) {
    		// take parameters from request
    		String body = readBodyAsString(request);
    		
    		// take variables from url
    		String username = matcher.group(1);
    		String type = matcher.group(2);
    		String id = matcher.group(3);
    		String value = matcher.group(4);
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = setUserWatchedContent(body, username, type, id, value, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    //this.pageNotFound(baseRequest, request, response);
  }
}
