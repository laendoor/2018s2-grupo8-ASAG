package ar.edu.unq.TraiFlix.ui.appModels

import ar.edu.unq.TraiFlix.models.Movie
import ar.edu.unq.TraiFlix.models.TraiFlix
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.TraiFlix.models.Serie

@Accessors
class AdminModel extends AppModel{
	
	Movie selectedMovie
	
	Serie selectedSerie
	
	new(TraiFlix model) {
		super(model)
	}

	
	def updateMovie() {

		}
	
	def viewMovie() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
	def deleteMovie() {
		//TODO FIXME ESTE LO TENGO QUE HACER YO
	}
	
	
	
	
}