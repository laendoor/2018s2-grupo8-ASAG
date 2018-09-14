package ar.edu.unq.TraiFlix.ui

import ar.edu.unq.TraiFlix.models.Movie
import ar.edu.unq.TraiFlix.ui.appModels.AppModel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Window
import org.uqbar.arena.windows.WindowOwner

class TraiFlixMainWindow extends Window<AppModel> {
	
	
	new(WindowOwner owner, AppModel model) {
		super(owner, model)
	}
	
	override createContents(Panel mainPanel) {
		this.title = "Admin TraiFlix"

		createPanelVisualizationMovies(mainPanel)
		createPanelVisualizationSeries(mainPanel)
		
	}
	
	def createPanelVisualizationSeries(Panel panel) {
		//TODO FIXME LABURA GATO
	}
	
	def createPanelVisualizationMovies(Panel panel) {
		
		createTitlePanel(panel)
		
		new TextBox(panel).withFilter(null)
		
		createCrudPanelMovies(panel);
			
	}
	
	def createCrudPanelMovies(Panel panel) {
		var moviePanel = new Panel(panel)
		moviePanel.layout = new HorizontalLayout
		
		var table = new Table<Movie>(moviePanel, typeof(Movie))=> [
		
		]
		createHeadedTable(table)
		
		createCrudButtons(moviePanel)
		
		}
	
	def createCrudButtons(Panel panel) {
		
	var buttonPanel = new Panel(panel)
	
	buttonPanel.layout = new VerticalLayout
	
			new Button(buttonPanel) => [ 
			caption = "Nuevo"
			alignCenter
//				onClick [ | modelObject.convertir ]
//				bindEnabled(new NotNullObservable("conversion"))
			]
					new Button(buttonPanel) => [ 
			caption = "Ver"
			alignCenter
//				onClick [ | modelObject.convertir ]
//				bindEnabled(new NotNullObservable("conversion"))
			]
							new Button(buttonPanel) => [ 
			caption = "Modificar"
			alignCenter
//				onClick [ | modelObject.convertir ]
//				bindEnabled(new NotNullObservable("conversion"))
			]
							new Button(buttonPanel) => [ 
			caption = "Borrar"
			alignCenter
//				onClick [ | modelObject.convertir ]
//				bindEnabled(new NotNullObservable("conversion"))
			]}

	def createHeadedTable(Table<Movie> table) {
new Column<Movie>(table) => [
	    title = "Head1"
	    fixedSize = 200
	    bindContentsToProperty("fullName")
		]
		new Column<Movie>(table) => [
	    title = "Head2"
	    fixedSize = 200
	    bindContentsToProperty("fullName")
		]
		new Column<Movie>(table) => [
	    title = "Head3"
	    fixedSize = 200
	    bindContentsToProperty("fullName")
		]	}
	
	def createTitlePanel(Panel panel) {
		var titlePanel = new Panel(panel)
		
		titlePanel.layout = new HorizontalLayout
		
		new Label(titlePanel) =>[
			text = "PELICULAS"
			fontSize= 16]
			
		new Button(titlePanel) => [ 
				caption = "Ver Usuarios"
				alignCenter
//				onClick [ | modelObject.convertir ]
//				bindEnabled(new NotNullObservable("conversion"))
		]
			}

}