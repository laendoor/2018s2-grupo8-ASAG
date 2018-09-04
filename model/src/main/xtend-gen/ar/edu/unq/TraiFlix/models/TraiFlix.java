package ar.edu.unq.TraiFlix.models;

import ar.edu.unq.TraiFlix.models.Movie;
import ar.edu.unq.TraiFlix.models.Serie;
import ar.edu.unq.TraiFlix.models.User;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class TraiFlix {
  private List<Movie> movies;
  
  private List<Serie> series;
  
  private List<User> users;
  
  public TraiFlix() {
    this.movies = CollectionLiterals.<Movie>newArrayList();
    this.series = CollectionLiterals.<Serie>newArrayList();
    this.users = CollectionLiterals.<User>newArrayList();
  }
  
  public boolean setNewMovie(final Movie movie) {
    return this.movies.add(movie);
  }
  
  public boolean setNewSerie(final Serie serie) {
    return this.series.add(serie);
  }
  
  public boolean setNewUser(final User user) {
    return this.users.add(user);
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
}
