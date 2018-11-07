package ar.edu.unq.api.TraiFlix_api_rest.bootstrap;

import ar.edu.unq.TraiFlix.models.Assessment;
import ar.edu.unq.TraiFlix.models.Category;
import ar.edu.unq.TraiFlix.models.Clasification;
import ar.edu.unq.TraiFlix.models.Episode;
import ar.edu.unq.TraiFlix.models.Favourable;
import ar.edu.unq.TraiFlix.models.Movie;
import ar.edu.unq.TraiFlix.models.Ratingable;
import ar.edu.unq.TraiFlix.models.Serie;
import ar.edu.unq.TraiFlix.models.TraiFlix;
import ar.edu.unq.TraiFlix.models.User;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pure;
import org.joda.time.DateTime;
import org.joda.time.Duration;

@Accessors
@SuppressWarnings("all")
public class Bootstrap {
  private List<Movie> movies;
  
  private List<Serie> series;
  
  private List<User> users;
  
  private List<Category> categories;
  
  private List<Clasification> clasifications;
  
  private static Bootstrap instance = null;
  
  private Bootstrap() {
    this.categories = this.createCategories();
    this.clasifications = this.createClasifications();
    this.movies = this.createMovies();
    this.series = this.createSeries();
    this.users = this.createUsers();
  }
  
  public static Bootstrap getInstance() {
    Bootstrap _xblockexpression = null;
    {
      if ((Bootstrap.instance == null)) {
        Bootstrap _bootstrap = new Bootstrap();
        Bootstrap.instance = _bootstrap;
      }
      _xblockexpression = Bootstrap.instance;
    }
    return _xblockexpression;
  }
  
  public ArrayList<User> createUsers() {
    ArrayList<User> _xblockexpression = null;
    {
      User user1 = new User();
      user1.setId(Integer.valueOf(1));
      user1.setNick("Saba");
      user1.setName("Pablo");
      DateTime _dateTime = new DateTime(1986, 7, 16, 0, 0, 0, 0);
      user1.setDateOfBirth(_dateTime);
      DateTime _dateTime_1 = new DateTime(2015, 3, 14, 0, 0, 0, 0);
      user1.setCreated(_dateTime_1);
      final Function1<Movie, Favourable> _function = (Movie m) -> {
        return ((Favourable) m);
      };
      final List<Favourable> fav = ListExtensions.<Movie, Favourable>map(this.movies.subList(0, 4), _function);
      final Function1<Serie, Favourable> _function_1 = (Serie s) -> {
        return ((Favourable) s);
      };
      final List<Favourable> fav2 = ListExtensions.<Serie, Favourable>map(this.series, _function_1);
      user1.getFavourites().addAll(fav);
      user1.getFavourites().addAll(fav2);
      final Function1<Movie, Ratingable> _function_2 = (Movie m) -> {
        return ((Ratingable) m);
      };
      final List<Ratingable> fav3 = ListExtensions.<Movie, Ratingable>map(this.movies.subList(5, 10), _function_2);
      final Function1<Serie, Ratingable> _function_3 = (Serie s) -> {
        return ((Ratingable) s);
      };
      final List<Ratingable> fav4 = ListExtensions.<Serie, Ratingable>map(this.series, _function_3);
      user1.getRecommended().addAll(fav3);
      user1.getRecommended().addAll(fav4);
      User user2 = new User();
      user2.setId(Integer.valueOf(2));
      user2.setNick("Lukitas");
      user2.setName("Lucas");
      DateTime _dateTime_2 = new DateTime(2000, 7, 16, 0, 0, 0, 0);
      user2.setDateOfBirth(_dateTime_2);
      DateTime _dateTime_3 = new DateTime(2014, 3, 14, 0, 0, 0, 0);
      user2.setCreated(_dateTime_3);
      User user3 = new User();
      user3.setId(Integer.valueOf(3));
      user3.setNick("Marce");
      user3.setName("Marcelo");
      DateTime _dateTime_4 = new DateTime(1983, 7, 16, 0, 0, 0, 0);
      user3.setDateOfBirth(_dateTime_4);
      DateTime _dateTime_5 = new DateTime(2016, 3, 14, 0, 0, 0, 0);
      user3.setCreated(_dateTime_5);
      User user4 = new User();
      user4.setId(Integer.valueOf(4));
      user4.setNick("Peter");
      user4.setName("Pedro");
      DateTime _dateTime_6 = new DateTime(1980, 7, 16, 0, 0, 0, 0);
      user4.setDateOfBirth(_dateTime_6);
      DateTime _dateTime_7 = new DateTime(2011, 3, 14, 0, 0, 0, 0);
      user4.setCreated(_dateTime_7);
      final ArrayList<User> list = new ArrayList<User>();
      list.add(user1);
      list.add(user2);
      list.add(user3);
      list.add(user4);
      _xblockexpression = list;
    }
    return _xblockexpression;
  }
  
  public ArrayList<Movie> createMovies() {
    ArrayList<Movie> _xblockexpression = null;
    {
      String directors = "Spilbergo, Jorge Lucas";
      String actors = "Obi One Kenobi , Darin";
      Movie movie = new Movie();
      movie.setTitle("Las tortugas pinjas");
      Date _date = new Date(90, 3, 17);
      movie.setRelease(_date);
      movie.setActors(actors);
      movie.setDuration(Duration.standardHours(2).plus(Duration.standardMinutes(29)));
      Clasification _clasification = new Clasification("+18");
      movie.setClasification(_clasification);
      movie.setDirectors(directors);
      movie.setLink("https://www.youtube.com/watch?v=HoBo9ilFAlI");
      movie.setCategories(this.categories);
      Movie movie1 = new Movie();
      movie1.setTitle("I\'m Batman");
      Date _date_1 = new Date(98, 4, 6);
      movie1.setRelease(_date_1);
      movie1.setActors(actors);
      movie1.setDuration(Duration.standardMinutes(2));
      movie1.setDirectors(directors);
      movie1.setLink("https://www.youtube.com/watch?v=PfEXKi83glA");
      Clasification _clasification_1 = new Clasification("ATP");
      movie1.setClasification(_clasification_1);
      movie1.getCategories().add(this.categories.get(6));
      movie1.getCategories().add(this.categories.get(1));
      Movie movie2 = new Movie();
      movie2.setTitle("Cmen");
      Date _date_2 = new Date(94, 3, 12);
      movie2.setRelease(_date_2);
      movie2.setDuration(Duration.standardMinutes(5));
      movie2.setActors(actors);
      movie2.setDirectors(directors);
      movie2.setLink("https://www.youtube.com/watch?v=lpFzTJN2y_o");
      Clasification _clasification_2 = new Clasification("ATP");
      movie2.setClasification(_clasification_2);
      movie2.getCategories().add(this.categories.get(4));
      Movie movie3 = new Movie();
      movie3.setTitle("Dragon Ball Super: Broly Movie");
      Date _date_3 = new Date(118, 11, 24);
      movie3.setRelease(_date_3);
      movie3.setDuration(Duration.standardMinutes(5));
      movie3.setActors(actors);
      movie3.setDirectors(directors);
      movie3.setLink("https://www.youtube.com/watch?v=FHgm89hKpXU");
      Clasification _clasification_3 = new Clasification("ATP");
      movie3.setClasification(_clasification_3);
      movie3.getCategories().add(this.categories.get(4));
      movie3.getCategories().add(this.categories.get(3));
      Movie movie4 = new Movie();
      movie4.setTitle("El Padrino");
      Date _date_4 = new Date(72, 4, 11);
      movie4.setRelease(_date_4);
      movie4.setDuration(Duration.standardMinutes(5));
      movie4.setActors(actors);
      movie4.setDirectors(directors);
      movie4.setLink("https://www.youtube.com/watch?v=gCVj1LeYnsc");
      Clasification _clasification_4 = new Clasification("ATP");
      movie4.setClasification(_clasification_4);
      movie4.getCategories().add(this.categories.get(6));
      Movie movie5 = new Movie();
      movie5.setTitle("Star Wars: The Last Jedi");
      Date _date_5 = new Date(119, 3, 12);
      movie5.setRelease(_date_5);
      movie5.setDuration(Duration.standardMinutes(5));
      movie5.setActors(actors);
      movie5.setDirectors(directors);
      movie5.setLink("https://www.youtube.com/watch?v=Cs4y56AnaUg");
      Clasification _clasification_5 = new Clasification("ATP");
      movie5.setClasification(_clasification_5);
      movie5.getCategories().add(this.categories.get(6));
      Movie movie6 = new Movie();
      movie6.setTitle("Venom");
      Date _date_6 = new Date(118, 10, 21);
      movie6.setRelease(_date_6);
      movie6.setDuration(Duration.standardMinutes(5));
      movie6.setActors(actors);
      movie6.setDirectors(directors);
      movie6.setLink("https://www.youtube.com/watch?v=xLCn88bfW1o");
      Clasification _clasification_6 = new Clasification("ATP");
      movie6.setClasification(_clasification_6);
      movie6.getCategories().add(this.categories.get(0));
      Movie movie7 = new Movie();
      movie7.setTitle("La Monja");
      Date _date_7 = new Date(118, 8, 12);
      movie7.setRelease(_date_7);
      movie7.setDuration(Duration.standardMinutes(5));
      movie7.setActors(actors);
      movie7.setDirectors(directors);
      movie7.setLink("https://www.youtube.com/watch?v=3HGXDuvnW9o");
      Clasification _clasification_7 = new Clasification("ATP");
      movie7.setClasification(_clasification_7);
      movie7.getCategories().add(this.categories.get(5));
      Movie movie8 = new Movie();
      movie8.setTitle("MAGADOLÓN");
      Date _date_8 = new Date(117, 3, 12);
      movie8.setRelease(_date_8);
      movie8.setDuration(Duration.standardMinutes(5));
      movie8.setActors(actors);
      movie8.setDirectors(directors);
      movie8.setLink("https://www.youtube.com/watch?v=azI5fLoocDo");
      Clasification _clasification_8 = new Clasification("ATP");
      movie8.setClasification(_clasification_8);
      movie8.getCategories().add(this.categories.get(5));
      Movie movie9 = new Movie();
      movie9.setTitle("Pie Pequeño");
      Date _date_9 = new Date(94, 3, 12);
      movie9.setRelease(_date_9);
      movie9.setDuration(Duration.standardMinutes(5));
      movie9.setActors(actors);
      movie9.setDirectors(directors);
      movie9.setLink("https://www.youtube.com/watch?v=tzJtXPiIpBg");
      Clasification _clasification_9 = new Clasification("ATP");
      movie9.setClasification(_clasification_9);
      movie9.getCategories().add(this.categories.get(4));
      Movie movie10 = new Movie();
      movie10.setTitle("Scarface");
      Date _date_10 = new Date(83, 6, 7);
      movie10.setRelease(_date_10);
      movie10.setDuration(Duration.standardMinutes(5));
      movie10.setActors(actors);
      movie10.setDirectors(directors);
      movie10.setLink("https://www.youtube.com/watch?v=7pQQHnqBa2E");
      Clasification _clasification_10 = new Clasification("ATP");
      movie10.setClasification(_clasification_10);
      movie10.getCategories().add(this.categories.get(6));
      movie.addRelated(movie1);
      movie.addRelated(movie2);
      movie10.addRelated(movie4);
      final ArrayList<Movie> list = new ArrayList<Movie>();
      list.add(movie);
      list.add(movie1);
      list.add(movie2);
      list.add(movie3);
      list.add(movie4);
      list.add(movie5);
      list.add(movie6);
      list.add(movie7);
      list.add(movie8);
      list.add(movie9);
      list.add(movie10);
      _xblockexpression = list;
    }
    return _xblockexpression;
  }
  
  public ArrayList<Category> createCategories() {
    ArrayList<Category> _xblockexpression = null;
    {
      Category cate = new Category("Action");
      Category cate1 = new Category("Drama");
      Category cate2 = new Category("Zombies");
      Category cate3 = new Category("Anime");
      Category cate4 = new Category("Animado");
      Category cate5 = new Category("Terror");
      Category cate6 = new Category("Clasicos");
      final ArrayList<Category> list = new ArrayList<Category>();
      list.add(cate);
      list.add(cate1);
      list.add(cate2);
      list.add(cate3);
      list.add(cate4);
      list.add(cate5);
      list.add(cate6);
      _xblockexpression = list;
    }
    return _xblockexpression;
  }
  
  public ArrayList<Clasification> createClasifications() {
    ArrayList<Clasification> _xblockexpression = null;
    {
      Clasification clas1 = new Clasification("ATP");
      Clasification clas2 = new Clasification("+13");
      Clasification clas3 = new Clasification("+17");
      final ArrayList<Clasification> list = new ArrayList<Clasification>();
      list.add(clas1);
      list.add(clas2);
      list.add(clas3);
      _xblockexpression = list;
    }
    return _xblockexpression;
  }
  
  public ArrayList<Serie> createSeries() {
    ArrayList<Serie> _xblockexpression = null;
    {
      Serie serie = new Serie();
      serie.setTitle("ALF");
      serie.setCreators("Spilbergo");
      serie.setCategories(this.categories);
      serie.setClasification(this.clasifications.get(1));
      Serie serie1 = new Serie();
      serie1.setTitle("Lost");
      serie1.setCreators("Luke SkyWalker");
      serie1.setCategories(this.categories);
      serie1.setClasification(this.clasifications.get(0));
      Serie serie2 = new Serie();
      serie2.setTitle("Friends");
      serie2.setCreators("Matt Groening");
      serie2.setCategories(this.categories);
      serie2.setClasification(this.clasifications.get(1));
      final ArrayList<Serie> list = new ArrayList<Serie>();
      list.add(serie);
      list.add(serie1);
      list.add(serie2);
      _xblockexpression = list;
    }
    return _xblockexpression;
  }
  
  public ArrayList<Episode> createEpisodesForALF() {
    final Episode episode1 = new Episode();
    episode1.setTitle("Larry el Psicologo");
    episode1.setSeason(Integer.valueOf(1));
    episode1.setEpisodeNumber(Integer.valueOf(1));
    episode1.setLink("https://www.youtube.com/watch?v=pAdTUYoKIQM");
    Date _date = new Date(84, 7, 16);
    episode1.setRelease(_date);
    final Episode episode2 = new Episode();
    episode2.setTitle("Ajedrez");
    episode2.setSeason(Integer.valueOf(2));
    episode2.setEpisodeNumber(Integer.valueOf(2));
    episode2.setLink("http://www.youtube.com/watch?v=ctoKrCpFxjA");
    Date _date_1 = new Date(85, 8, 16);
    episode2.setRelease(_date_1);
    final Episode episode3 = new Episode();
    episode3.setTitle("Luna de Miel");
    episode3.setSeason(Integer.valueOf(3));
    episode3.setEpisodeNumber(Integer.valueOf(3));
    episode3.setLink("http://www.youtube.com/watch?v=o-8fGNqbzj8");
    Date _date_2 = new Date(85, 9, 16);
    episode3.setRelease(_date_2);
    ArrayList<Episode> _newArrayList = CollectionLiterals.<Episode>newArrayList(episode1, episode2, episode3);
    return new ArrayList<Episode>(_newArrayList);
  }
  
  public ArrayList<Episode> createEpisodesForFriends() {
    final Episode episode1 = new Episode();
    episode1.setTitle("Larry el Psicologo");
    episode1.setSeason(Integer.valueOf(1));
    episode1.setEpisodeNumber(Integer.valueOf(1));
    episode1.setLink("https://www.youtube.com/watch?v=2jMvc5VoavE");
    Date _date = new Date(94, 9, 22);
    episode1.setRelease(_date);
    final Episode episode2 = new Episode();
    episode2.setTitle("Ajedrez");
    episode2.setSeason(Integer.valueOf(2));
    episode2.setEpisodeNumber(Integer.valueOf(2));
    episode2.setLink("http://www.youtube.com/watch?v=ctoKrCpFxjA");
    Date _date_1 = new Date(104, 9, 22);
    episode2.setRelease(_date_1);
    final Episode episode3 = new Episode();
    episode3.setTitle("Luna de Miel");
    episode3.setSeason(Integer.valueOf(3));
    episode3.setEpisodeNumber(Integer.valueOf(3));
    episode3.setLink("http://www.youtube.com/watch?v=o-8fGNqbzj8");
    Date _date_2 = new Date(85, 9, 16);
    episode3.setRelease(_date_2);
    ArrayList<Episode> _newArrayList = CollectionLiterals.<Episode>newArrayList(episode1, episode2, episode3);
    return new ArrayList<Episode>(_newArrayList);
  }
  
  public ArrayList<Episode> createEpisodesForLost() {
    final Episode episode1 = new Episode();
    episode1.setTitle("Larry el Psicologo");
    episode1.setSeason(Integer.valueOf(1));
    episode1.setEpisodeNumber(Integer.valueOf(1));
    episode1.setLink("https://www.youtube.com/watch?v=GsAEE_sy3aU");
    Date _date = new Date(104, 9, 22);
    episode1.setRelease(_date);
    final Episode episode2 = new Episode();
    episode2.setTitle("Ajedrez");
    episode2.setSeason(Integer.valueOf(2));
    episode2.setEpisodeNumber(Integer.valueOf(2));
    episode2.setLink("http://www.youtube.com/watch?v=ctoKrCpFxjA");
    Date _date_1 = new Date(85, 8, 16);
    episode2.setRelease(_date_1);
    final Episode episode3 = new Episode();
    episode3.setTitle("Luna de Miel");
    episode3.setSeason(Integer.valueOf(3));
    episode3.setEpisodeNumber(Integer.valueOf(3));
    episode3.setLink("http://www.youtube.com/watch?v=o-8fGNqbzj8");
    Date _date_2 = new Date(85, 9, 16);
    episode3.setRelease(_date_2);
    ArrayList<Episode> _newArrayList = CollectionLiterals.<Episode>newArrayList(episode1, episode2, episode3);
    return new ArrayList<Episode>(_newArrayList);
  }
  
  public void loadEpisodesInSerie(final Serie serie1, final List<Episode> episodes) {
    final Consumer<Episode> _function = (Episode elem) -> {
      elem.setSerie(serie1);
    };
    episodes.forEach(_function);
    final Consumer<Episode> _function_1 = (Episode elem) -> {
      serie1.addEpisode(elem);
    };
    episodes.forEach(_function_1);
  }
  
  public boolean load(final TraiFlix model) {
    boolean _xblockexpression = false;
    {
      model.setCategories(this.categories);
      model.setClassifications(this.clasifications);
      model.setMovies(this.movies);
      final List<Serie> series2 = this.series;
      this.loadEpisodesInSerie(this.series.get(0), this.createEpisodesForALF());
      this.loadEpisodesInSerie(this.series.get(1), this.createEpisodesForLost());
      this.loadEpisodesInSerie(this.series.get(2), this.createEpisodesForFriends());
      model.setSeries(series2);
      model.setUsers(this.users);
      Movie _get = model.getMovies().get(0);
      User _get_1 = model.getUsers().get(2);
      Assessment _assessment = new Assessment(_get_1, Integer.valueOf(2), "Una bosta!");
      _get.addAssessment(_assessment);
      Episode _get_2 = model.getSeries().get(0).getEpisodes().get(0);
      User _get_3 = model.getUsers().get(2);
      Assessment _assessment_1 = new Assessment(_get_3, Integer.valueOf(4), "Alta serie!");
      _xblockexpression = _get_2.addAssessment(_assessment_1);
    }
    return _xblockexpression;
  }
  
  @Pure
  public List<Movie> getMovies() {
    return this.movies;
  }
  
  public void setMovies(final List<Movie> movies) {
    this.movies = movies;
  }
  
  @Pure
  public List<Serie> getSeries() {
    return this.series;
  }
  
  public void setSeries(final List<Serie> series) {
    this.series = series;
  }
  
  @Pure
  public List<User> getUsers() {
    return this.users;
  }
  
  public void setUsers(final List<User> users) {
    this.users = users;
  }
  
  @Pure
  public List<Category> getCategories() {
    return this.categories;
  }
  
  public void setCategories(final List<Category> categories) {
    this.categories = categories;
  }
  
  @Pure
  public List<Clasification> getClasifications() {
    return this.clasifications;
  }
  
  public void setClasifications(final List<Clasification> clasifications) {
    this.clasifications = clasifications;
  }
}
