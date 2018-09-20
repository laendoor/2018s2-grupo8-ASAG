package ar.edu.unq.TraiFlix.ui.appModels

import ar.edu.unq.TraiFlix.models.Movie
import ar.edu.unq.TraiFlix.models.TraiFlix
import org.eclipse.xtend.lib.annotations.Accessors

import ar.edu.unq.TraiFlix.models.Serie
import java.util.List
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.TraiFlix.ui.SerieManagementWindow
import ar.edu.unq.TraiFlix.ui.TraiFlixMainWindow
import org.uqbar.arena.windows.Dialog

@Accessors
@Observable
class AdminModel extends AppModel{
	
	Movie selectedMovie
	Serie selectedSerie
	
	List<Movie> filteredMovies
	List<Serie> filteredSeries
	
	String filterMovie
	String filterSerie
	
	TraiFlixMainWindow view
	
	new(TraiFlix model) {
		super(model)
		this.filterMovie = ""
		this.filterSerie = ""
		this.filteredMovies = model.movies
		this.filteredSeries = model.series
	}
	//--- FILTRO MOVIES ---//
		def void setFilterMovie(String newFilter) {
		this.filterMovie = newFilter.toLowerCase
		searchMovie()
	}
	
		def searchMovie() {
		this.filteredMovies = model.movies.filter[it.getTitle().toLowerCase.contains(filterMovie)].toList
	}
	//---------------------//
	//--- FILTRO SERIES ---//
	
		def void setFilterSerie(String newFilter) {
		this.filterSerie = newFilter.toLowerCase
		searchSerie()
	}
	
	def searchSerie() {
		this.filteredSeries = model.series.filter[it.getTitle().toLowerCase.contains(filterSerie)].toList
	}
	//---------------------//
	//--- BOTONES MOVIES ---//
	def updateMovie() {
 		new SerieManagementWindow(view, new SerieManagementAppModel(this.model,selectedSerie)).open
		}
	
		
	def viewMovie() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def deleteMovieSelected() {
		if(selectedMovie == null)
		return;
		model.deleteMovie(selectedMovie.id)
		selectedMovie = null
		searchMovie()
	}
  
  
	
	//----------------------//
	//--- BOTONES SERIES ---//
	def updateSerie() {
		if(selectedSerie == null){
			//TODO FIXME crear error
			return
		}
 		new SerieManagementWindow(view, new SerieManagementAppModel(this.model,selectedSerie)).open
		}
	
	def viewSerie() {
		if(selectedSerie == null){
			//TODO FIXME crear error
			return
		}
		new SerieManagementWindow(view, new SerieManagementAppModel(this.model,selectedSerie)=>[
			editMode = false
		]).open
	}

	def deleteSerieSelected() {
		if(selectedSerie == null)
			return;
		model.deleteSerie(selectedSerie.id)
		selectedSerie = null
		searchSerie()
	}




	//----------------------//
	

	def addSerie( Serie serie ) {
		model.setNewSerie(serie)
	}
	
	

	

	
	def setView(TraiFlixMainWindow window) {
		this.view = window
	}
  
  def addMovie(Movie movie){
		model.setNewMovie(movie)
	}
	

	
}

