package ar.edu.unq.TraiFlix.ui.runnable

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import ar.edu.unq.TraiFlix.ui.TraiFlixMainWindow
import ar.edu.unq.TraiFlix.models.TraiFlix

class TraiFlixApplication extends Application {
	
	
	static def void main(String[] args) { 
		new TraiFlixApplication().start()
	}

	override protected Window<?> createMainWindow() {
		return new TraiFlixMainWindow(this,new TraiFlix)
	}
}



