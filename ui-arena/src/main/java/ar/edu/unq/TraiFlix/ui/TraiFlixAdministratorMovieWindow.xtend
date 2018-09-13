package ar.edu.unq.TraiFlix.ui

import org.uqbar.arena.windows.MainWindow
import ar.edu.unq.TraiFlix.models.TraiFlix
import org.uqbar.arena.widgets.Panel

class TraiFlixAdministratorMovieWindow extends MainWindow<TraiFlix>{
	
	new(TraiFlix model) {
		super(model)
	}
	
	override createContents(Panel mainPanel) {
		this.title = "TraiFlix Administrar Pelicula"
		
		val panelSup = new Panel(mainPanel)
		
		
			
	}
	
}