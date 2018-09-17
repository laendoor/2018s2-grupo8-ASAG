package ar.edu.unq.TraiFlix.ui

import ar.edu.unq.TraiFlix.models.Movie
import ar.edu.unq.TraiFlix.ui.appModels.AdminModel
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
import ar.edu.unq.TraiFlix.ui.appModels.SerieManagementAppModel
import ar.edu.unq.TraiFlix.ui.appModels.AdminModel

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.ColumnLayout
import ar.edu.unq.TraiFlix.models.Serie
import org.eclipse.jface.viewers.deferred.ChangeQueue.Change
import ar.edu.unq.TraiFlix.models.Clasification

class TraiFlixMainWindow extends Window<AdminModel> {
	
	
	new(WindowOwner owner, AdminModel model) {
		super(owner, model)
	}
	
	override createContents(Panel mainPanel) {
		this.title = "Admin TraiFlix"

		createPanelVisualizationMovies(mainPanel)
		createPanelVisualizationSeries(mainPanel)
		
		
	}
	
	def createPanelVisualizationSeries(Panel panel) {
		createTitlePanel(panel, "SERIES")
		
		createCrudPanelSeries(panel);
	}
	
	def createCrudPanelSeries(Panel panel) {
		var seriePanel = new Panel(panel)
		seriePanel.layout = new HorizontalLayout
		
		var tablePanel = new Panel(seriePanel)
		new TextBox(tablePanel).value <=> "searchMovie" => [
	
		]
		
		var table = new Table<Serie>(tablePanel, typeof(Serie))=> [
			numberVisibleRows = 3
			items <=> "model.series"
			selection <=> "selectedSerie"
		]
		createHeadedTableSeries(table)
		
		createCrudButtonsSeries(seriePanel)
		
		}
	
	def createCrudButtonsSeries(Panel panel) {
		
		var buttonPanel = new Panel(panel)
	
			new Button(buttonPanel) => [ 
			caption = "Nuevo"
				alignCenter
				onClick [ | onNewSerie ]
			]
					new Button(buttonPanel) => [ 
			caption = "Ver"
			alignCenter
				onClick [ | onViewSerie ]
//				bindEnabled(new NotNullObservable("conversion"))
			]
			new Button(buttonPanel) => [ 
			caption = "Modificar"
			alignCenter
				onClick [ | onUpdateSerie ]
//				bindEnabled(new NotNullObservable("conversion"))
			]
							new Button(buttonPanel) => [ 
			caption = "Borrar"
			alignCenter
				onClick [ | onRemoveSerie ]
//				bindEnabled(new NotNullObservable("conversion"))

			]
		}
				
		
	def createPanelVisualizationMovies(Panel panel) {
		
		createTitlePanel(panel, "PELICULAS")
		
		
		
		createCrudPanelMovies(panel, "model.movies","selectedMovie");			
	}
	
	def createCrudPanelMovies(Panel panel,String dirList, String selected) {
		
		var moviePanel = new Panel(panel)

		moviePanel.layout = new HorizontalLayout
		
		var tablePanel = new Panel(moviePanel)
		
		new TextBox(tablePanel).withFilter(null)
		
		var table = new Table<Movie>(tablePanel, typeof(Movie))=> [
			numberVisibleRows = 3
			items <=> dirList
			selection <=> selected
		]
		
		createHeadedTable(table)
		
		createCrudButtons(moviePanel)
		
	}
	
	def createCrudButtons(Panel panel) {
		
		var buttonPanel = new Panel(panel)
	
			new Button(buttonPanel) => [ 
			caption = "Nuevo"
				alignCenter
				onClick [ | new TraiFlixAdministratorMovieWindow(this, this.modelObject.model).open ]
			]
					new Button(buttonPanel) => [ 
			caption = "Ver"
			alignCenter
				onClick [ | modelObject.viewMovie ]
//				bindEnabled(new NotNullObservable("conversion"))
			]
			new Button(buttonPanel) => [ 
			caption = "Modificar"
			alignCenter
				onClick [ | modelObject.updateMovie ]
//				bindEnabled(new NotNullObservable("conversion"))
			]
							new Button(buttonPanel) => [ 
			caption = "Borrar"
			alignCenter
				onClick [ | modelObject.deleteMovie ]
//				bindEnabled(new NotNullObservable("conversion"))

			]}
	

	def createHeadedTable(Table<Movie> table) {
		new Column<Movie>(table) => [
	    title = "Titulo"

	    fixedSize = 200
	    bindContentsToProperty("title")
		]
		new Column<Movie>(table) => [
	    title = "Duración"
	    fixedSize = 150
	    bindContentsToProperty("timeToString")
		]
		new Column<Movie>(table) => [
	    title = "Link"
	    fixedSize = 250
	    bindContentsToProperty("link")
		]	}
	
	def createHeadedTableSeries(Table<Serie> table) {
		new Column<Serie>(table) => [
	    title = "Titulo"
	    fixedSize = 200
	    bindContentsToProperty("title")
		]
		new Column<Serie>(table) => [
	    title = "Creadores"
	    fixedSize = 150
	    bindContentsToProperty("creators")
		]
		new Column<Serie>(table) => [
	    title = "Episodios"
	    fixedSize = 250
	    bindContentsToProperty("episodes.size")
		]	}
	
	
	def createTitlePanel(Panel panel, String title) {
		var titlePanel = new Panel(panel)
		
		titlePanel.layout = new ColumnLayout(2)
		
		new Label(titlePanel) =>[
			text = title
			fontSize= 16]
			
		
		new Button(titlePanel) => [ 
				caption = "Ver Usuarios"
		
//				onClick [ | modelObject.convertir ]
//				bindEnabled(new NotNullObservable("conversion"))
		]

	}
	
	
	def onNewSerie() {
		val serieModel = new SerieManagementAppModel(this.modelObject.model, new Serie)
		
		new SerieManagementWindow( this, serieModel ) =>  [ 
			title = "TraiFlix - Crear Nueva Serie"
			onAccept[ this.modelObject.addSerie(serieModel.serie) ]
			open						
		]	
	}
	
	def onUpdateSerie() {
	}
	
	def onRemoveSerie() {
	}
	
	def onViewSerie() {
	}


}