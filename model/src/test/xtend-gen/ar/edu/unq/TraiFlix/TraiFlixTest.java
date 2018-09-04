package ar.edu.unq.TraiFlix;

import ar.edu.unq.TraiFlix.models.Assessment;
import ar.edu.unq.TraiFlix.models.Episode;
import ar.edu.unq.TraiFlix.models.Movie;
import ar.edu.unq.TraiFlix.models.Serie;
import ar.edu.unq.TraiFlix.models.TraiFlix;
import ar.edu.unq.TraiFlix.models.User;
import org.junit.Assert;
import org.junit.Test;

@SuppressWarnings("all")
public class TraiFlixTest {
  /**
   * Rigourous Test :-)
   */
  @Test
  public void obtenerElListadoDeLasPelículas() {
    TraiFlix triflix = new TraiFlix();
    Movie _movie = new Movie();
    triflix.setNewMovie(_movie);
    Movie _movie_1 = new Movie();
    triflix.setNewMovie(_movie_1);
    Serie _serie = new Serie();
    triflix.setNewSerie(_serie);
    int _size = triflix.getMovies().size();
    boolean _equals = (_size == 2);
    Assert.assertTrue(_equals);
  }
  
  @Test
  public void obtenerElListadoDeLasSeries() {
    TraiFlix triflix = new TraiFlix();
    Movie _movie = new Movie();
    triflix.setNewMovie(_movie);
    Movie _movie_1 = new Movie();
    triflix.setNewMovie(_movie_1);
    Serie _serie = new Serie();
    triflix.setNewSerie(_serie);
    int _size = triflix.getSeries().size();
    boolean _equals = (_size == 1);
    Assert.assertTrue(_equals);
  }
  
  @Test
  public void obtenerElListadoDeLosUsuarios() {
    TraiFlix triflix = new TraiFlix();
    Movie _movie = new Movie();
    triflix.setNewMovie(_movie);
    Movie _movie_1 = new Movie();
    triflix.setNewMovie(_movie_1);
    Serie _serie = new Serie();
    triflix.setNewSerie(_serie);
    User _user = new User();
    triflix.setNewUser(_user);
    User _user_1 = new User();
    triflix.setNewUser(_user_1);
    int _size = triflix.getUsers().size();
    boolean _equals = (_size == 2);
    Assert.assertTrue(_equals);
  }
  
  @Test
  public void conocerElRatingDeUnaPelicula() {
    TraiFlix triflix = new TraiFlix();
    final Movie elPadrino = new Movie();
    final User pepito = new User();
    final User pepita = new User();
    elPadrino.setTitle("El Padrino");
    pepito.setNick("Pepito");
    pepito.setName("Pepito");
    pepita.setNick("Pepita");
    pepita.setName("Pepita");
    triflix.setNewMovie(elPadrino);
    triflix.setNewUser(pepito);
    Assessment _assessment = new Assessment(pepito, Integer.valueOf(5), "violentas como me gustan a mi");
    elPadrino.addAssessment(_assessment);
    Assessment _assessment_1 = new Assessment(pepito, Integer.valueOf(1), "me gustan las romanticas, una mierda");
    elPadrino.addAssessment(_assessment_1);
    int _rating = elPadrino.getRating();
    boolean _equals = (_rating == 3);
    Assert.assertTrue(_equals);
  }
  
  @Test
  public void conocerElRatingDeUnaSerie() {
    TraiFlix triflix = new TraiFlix();
    final Serie lost = new Serie();
    final Episode episodio1 = new Episode();
    final Episode episodio2 = new Episode();
    final User pepito = new User();
    final User pepita = new User();
    lost.setTitle("Lost");
    pepito.setNick("Pepito");
    pepito.setName("Pepito");
    pepita.setNick("Pepita");
    pepita.setName("Pepita");
    triflix.setNewSerie(lost);
    lost.getEpisodes().add(episodio1);
    lost.getEpisodes().add(episodio2);
    Assessment _assessment = new Assessment(pepito, Integer.valueOf(5), "Me gusto como se cayo el avion");
    episodio1.addAssessment(_assessment);
    Assessment _assessment_1 = new Assessment(pepito, Integer.valueOf(3), "Medio chafa");
    episodio2.addAssessment(_assessment_1);
    Assessment _assessment_2 = new Assessment(pepita, Integer.valueOf(2), "No entiendo la trama");
    episodio1.addAssessment(_assessment_2);
    Assessment _assessment_3 = new Assessment(pepita, Integer.valueOf(2), "Entiendo menos ahora :d");
    episodio2.addAssessment(_assessment_3);
    int _rating = lost.getRating();
    boolean _equals = (_rating == 3);
    Assert.assertTrue(_equals);
  }
}
