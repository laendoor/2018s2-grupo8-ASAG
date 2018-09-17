package ar.edu.unq.TraiFlix.ui

import org.uqbar.arena.windows.MainWindow
import ar.edu.unq.TraiFlix.models.TraiFlix
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Window
import org.uqbar.arena.windows.WindowOwner

class TraiFlixAdministratorMovieWindow extends Window<TraiFlix>{
	
	new(WindowOwner owner, TraiFlix model) {
		super(owner, model)
	}
	
	override createContents(Panel mainPanel) {
		this.title = "TraiFlix Administrar Pelicula"
		
		val panelSup = new Panel(mainPanel)
		
		
			
	}
	
}