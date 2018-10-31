package ar.edu.unq.api.TraiFlix_api_rest.bootstrap;

import ar.edu.unq.TraiFlix.models.Assessment;
import ar.edu.unq.TraiFlix.models.Category;
import ar.edu.unq.TraiFlix.models.Clasification;
import ar.edu.unq.TraiFlix.models.Episode;
import ar.edu.unq.TraiFlix.models.Movie;
import ar.edu.unq.TraiFlix.models.Serie;
import ar.edu.unq.TraiFlix.models.TraiFlix;
import ar.edu.unq.TraiFlix.models.User;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
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
    this.users = this.createUsers();
    this.categories = this.createCategories();
    this.clasifications = this.createClasifications();
    this.movies = this.createMovies();
    this.series = this.createSeries();
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
      movie.setTitle("Las Tortugas Pinjas");
      Date _date = new Date();
      movie.setRelease(_date);
      movie.setActors(actors);
      movie.setDuration(Duration.standardHours(2).plus(Duration.standardMinutes(29)));
      Clasification _clasification = new Clasification("+18");
      movie.setClasification(_clasification);
      movie.setDirectors(directors);
      movie.setLink("http://www.youtube.com/watch?v=HoBo9ilFAlI");
      User _get = this.users.get(0);
      Assessment _assessment = new Assessment(_get, Integer.valueOf(2), "Bien piola");
      movie.addAssessment(_assessment);
      movie.setCategories(this.categories);
      Movie movie1 = new Movie();
      movie1.setTitle("I\'m Batman");
      Date _date_1 = new Date();
      movie1.setRelease(_date_1);
      movie1.setActors(actors);
      movie1.setDuration(Duration.standardMinutes(2));
      movie1.setDirectors(directors);
      movie1.setLink("http://www.youtube.com/watch?v=PfEXKi83glA");
      Clasification _clasification_1 = new Clasification("ATP");
      movie1.setClasification(_clasification_1);
      Movie movie2 = new Movie();
      movie2.setTitle("Cmen");
      Date _date_2 = new Date();
      movie2.setRelease(_date_2);
      movie2.setDuration(Duration.standardMinutes(5));
      movie2.setActors(actors);
      movie2.setDirectors(directors);
      movie2.setLink("http://www.youtube.com/watch?v=lpFzTJN2y_o");
      Clasification _clasification_2 = new Clasification("ATP");
      movie2.setClasification(_clasification_2);
      movie.addRelated(movie1);
      movie.addRelated(movie2);
      final ArrayList<Movie> list = new ArrayList<Movie>();
      list.add(movie);
      list.add(movie1);
      list.add(movie2);
      _xblockexpression = list;
    }
    return _xblockexpression;
  }
  
  public ArrayList<Category> createCategories() {
    ArrayList<Category> _xblockexpression = null;
    {
      Category cate = new Category("Action");
      Category cate1 = new Category("Drama");
      Category cate2 = new Category("Zombies Nazis");
      final ArrayList<Category> list = new ArrayList<Category>();
      list.add(cate);
      list.add(cate1);
      list.add(cate2);
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
  
  public ArrayList<Episode> createEpisodes() {
    final Episode episode1 = new Episode();
    episode1.setTitle("Larry el Psicologo");
    episode1.setSeason(Integer.valueOf(1));
    episode1.setEpisodeNumber(Integer.valueOf(1));
    episode1.setLink("http://www.youtube.com/watch?v=5MbSixjIzOw");
    Date _date = new Date(84, 7, 16);
    episode1.setRelease(_date);
    User _get = this.users.get(0);
    Assessment _assessment = new Assessment(_get, Integer.valueOf(3), "Bien piola");
    episode1.addAssessment(_assessment);
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
  
  public void load(final TraiFlix model) {
    model.setCategories(this.categories);
    model.setClassifications(this.clasifications);
    model.setMovies(this.movies);
    final List<Serie> series2 = this.series;
    this.loadEpisodesInSerie(this.series.get(0), this.createEpisodes());
    model.setSeries(series2);
    model.setUsers(this.users);
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
