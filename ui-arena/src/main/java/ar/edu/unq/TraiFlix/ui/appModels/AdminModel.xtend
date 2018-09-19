package ar.edu.unq.TraiFlix.ui.appModels

import ar.edu.unq.TraiFlix.models.Movie
import ar.edu.unq.TraiFlix.models.TraiFlix
import org.eclipse.xtend.lib.annotations.Accessors

import ar.edu.unq.TraiFlix.models.Serie
import java.util.List
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class AdminModel extends AppModel{
	
	Movie selectedMovie
	Serie selectedSerie
	
	List<Movie> filteredMovies
	List<Serie> filteredSeries
	
	String filterMovie
	String filterSerie
	
	new(TraiFlix model) {
		super(model)
		this.filterMovie = ""
		this.filterSerie = ""
		this.filteredMovies = model.movies
		this.filteredSeries = model.series
	}
	
		def void setFilterMovie(String newFilter) {
		this.filterMovie = newFilter.toLowerCase
		searchMovie()
	}
	
		def searchMovie() {
		this.filteredMovies = model.movies.filter[it.getTitle().toLowerCase.contains(filterMovie)].toList
	}

		def void setFilterSerie(String newFilter) {
		this.filterSerie = newFilter.toLowerCase
		searchSerie()
	}
	
	def searchSerie() {
		this.filteredSeries = model.series.filter[it.getTitle().toLowerCase.contains(filterSerie)].toList
	}
	
	
	def updateMovie() {

		}
	
	def viewMovie() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	

	def addSerie( Serie serie ) {
		model.setNewSerie(serie)
	}
	
	def deleteMovieSelected() {
		if(selectedMovie == null)
		return;
		model.deleteMovie(selectedMovie.id)
		searchMovie()
	}
}
