package ar.edu.unq.TraiFlix.ui.runnable

import ar.edu.unq.TraiFlix.models.TraiFlix
import ar.edu.unq.TraiFlix.ui.TraiFlixMainWindow
import org.uqbar.arena.windows.Window
import org.uqbar.arena.Application
import ar.edu.unq.TraiFlix.ui.appModels.AdminModel
import ar.edu.unq.TraiFlix.ui.appModels.AppModel

class TraiFlixApplication extends Application{
	
	static def void main(String[] args) { 
		
		new TraiFlixApplication().start()
	}

	override protected Window<AppModel> createMainWindow() {
		var traiflix = new TraiFlix =>[
		movies = DummyData.crearMovies()
			]		
		
			
		return new TraiFlixMainWindow(this,new AdminModel(traiflix))
	}

}



