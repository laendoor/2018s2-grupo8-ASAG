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

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.ColumnLayout
import ar.edu.unq.TraiFlix.models.Serie

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
		
		new TextBox(tablePanel).withFilter(null)
		
		var table = new Table<Serie>(tablePanel, typeof(Serie))=> [
			numberVisibleRows = 3
			items <=> "model.series"
			selection <=> "selectedSerie"
		]
		createHeadedTableSeries(table)
		
		createCrudButtons(seriePanel)
		
		}
		
	def createPanelVisualizationMovies(Panel panel) {
		
		createTitlePanel(panel, "PELICULAS")
		
		
		
		createCrudPanelMovies(panel);
			
	}
	
	def createCrudPanelMovies(Panel panel) {
		var moviePanel = new Panel(panel)
		moviePanel.layout = new HorizontalLayout
		
		var tablePanel = new Panel(moviePanel)
		
		new TextBox(tablePanel).withFilter(null)
		
		var table = new Table<Movie>(tablePanel, typeof(Movie))=> [
			numberVisibleRows = 3
			items <=> "model.movies"
			selection <=> "selectedMovie"
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
				onClick [ | /*new ventanaDeLucas(this, this.modelObject.model).open */]
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
	    bindContentsToProperty("duration")
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

}