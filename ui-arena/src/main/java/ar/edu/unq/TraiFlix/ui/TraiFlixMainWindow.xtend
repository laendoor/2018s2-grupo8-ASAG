package ar.edu.unq.TraiFlix.ui

import java.awt.Color
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.windows.MainWindow

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.TraiFlix.models.TraiFlix

class TraiFlixMainWindow extends MainWindow<TraiFlix> {
	

	new() {
		super(new TraiFlix)
	}

	override createContents(Panel mainPanel) {
		this.title = "Admin TraiFlix"

		mainPanel.layout = new VerticalLayout
		
		new Label(mainPanel).text = "TO DO: Implementar una ventana de administración bien pulenta!"
	}

	def static main(String[] args) {
		new TraiFlixMainWindow().startApplication
	}
}