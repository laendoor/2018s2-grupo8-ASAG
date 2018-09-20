
package ar.edu.unq.TraiFlix.ui

import ar.edu.unq.TraiFlix.models.Movie
import ar.edu.unq.TraiFlix.models.Serie
import ar.edu.unq.TraiFlix.ui.appModels.AdminModel
import ar.edu.unq.TraiFlix.ui.appModels.SerieManagementAppModel
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Window
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.TraiFlix.ui.appModels.MovieManagementAppModel


class TraiFlixMainWindow extends Window<AdminModel> {
	
	
	new(WindowOwner owner, AdminModel model) {
		super(owner, model)

		model.setView(this);
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
		new TextBox(tablePanel) =>[
			value <=> "filterSerie"
		]
		
		var table = new Table<Serie>(tablePanel, typeof(Serie))=> [
			numberVisibleRows = 3
			items <=> "filteredSeries"
			selection <=> "selectedSerie"
		]
		
				
		val columns = newArrayList()
		columns.add(new Terna("Titulo","title",200))
		columns.add(new Terna("Creadores","creators",150))
		columns.add(new Terna("Episodios","episodes.size",250))
		
		createHeadedTableSeries(table,columns)
		
		createCrudButtonsSeries(seriePanel)
		
		}
	
	def createCrudButtonsSeries(Panel panel) {
		
		var buttonPanel = new Panel(panel)
	
			new Button(buttonPanel) => [ 
			caption = "Nuevo"
				alignCenter
				onClick [ |
					val serie = new Serie
					 new SerieManagementWindow
					(this, new SerieManagementAppModel(this.modelObject.model,serie))=>[
						onAccept[this.modelObject.addSerie(serie)]
						open
					]
					
				]
			]
					new Button(buttonPanel) => [ 
			caption = "Ver"
			alignCenter

				onClick [ | modelObject.viewSerie ]

//				bindEnabled(new NotNullObservable("conversion"))
			]
			new Button(buttonPanel) => [ 
			caption = "Modificar"
			alignCenter

				onClick [ | modelObject.updateSerie]

//				bindEnabled(new NotNullObservable("conversion"))
			]
							new Button(buttonPanel) => [ 
			caption = "Borrar"
			alignCenter

				onClick [ | modelObject.deleteSerieSelected ]

//				bindEnabled(new NotNullObservable("conversion"))

			]
		}
				
		
	def createPanelVisualizationMovies(Panel panel) {
		
		var titlePanel = createTitlePanel(panel, "PELICULAS")
		new Button(titlePanel) => [ 
				caption = "Ver Usuarios"

				onClick [ | new TraiFlixUserAdminWindow(this, this.modelObject.model.users).open ]
				]
		createCrudPanelMovies(panel, "model.movies","selectedMovie");			
	}
	
	def createCrudPanelMovies(Panel panel,String dirList, String selected) {
		
		var moviePanel = new Panel(panel)

		moviePanel.layout = new HorizontalLayout
		
		var tablePanel = new Panel(moviePanel)
		
		new TextBox(tablePanel)=> [
				value <=> "filterMovie"
			]
		
		var table = new Table<Movie>(tablePanel, typeof(Movie))=> [
			numberVisibleRows = 3
			items <=> "filteredMovies"
			selection <=> selected
		]
		val columns = newArrayList()
		columns.add(new Terna("Titulo","title",200))
		columns.add(new Terna("Duración","timeToString",150))
		columns.add(new Terna("Link","link",250))
	
		createHeadedTable(table,columns)
		
		createCrudButtons(moviePanel)
		
	}
	
	def createCrudButtons(Panel panel) {
		
		var buttonPanel = new Panel(panel)
	
			new Button(buttonPanel) => [ 
			caption = "Nuevo"
				alignCenter

				onClick [  
					val movie = new Movie()
					new TraiFlixAdministratorMovieWindow(this,
					new MovieManagementAppModel(this.modelObject.model, movie))=>[
					onAccept[this.modelObject.addMovie(movie)]
					open 
					]
					
					
				]
			
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
				onClick [  if(modelObject.selectedMovie!= null)
					new TraiFlixAdministratorMovieWindow(this,
					new MovieManagementAppModel(this.modelObject.model, modelObject.selectedMovie))=>[
					
					open 
					]
//				bindEnabled(new NotNullObservable("conversion"))
			]
			]
			new Button(buttonPanel) => [ 
			caption = "Borrar"
			alignCenter
				onClick [ | modelObject.deleteMovieSelected ]
				//bindEnabled()

			]}

	def createHeadedTable(Table<Movie> table, List<Terna<String,String,Integer>> columns) {
		for(Terna<String,String,Integer>column : columns){
			new Column<Movie>(table) => [
		    title = column.x
		    fixedSize = column.z
		    bindContentsToProperty(column.y)
			]
		}
	}
	
	def createHeadedTableSeries(Table<Serie> table, List<Terna<String,String,Integer>> columns) {
		for(Terna<String,String,Integer>column : columns){
			new Column<Serie>(table) => [
		    title = column.x
		    fixedSize = column.z
		    bindContentsToProperty(column.y)
			]
		}

}
	
	
	def createTitlePanel(Panel panel, String title) {
		var titlePanel = new Panel(panel)
		
		titlePanel.layout = new ColumnLayout(2)
		
		new Label(titlePanel) =>[
			text = title
			fontSize= 16]
			
		return titlePanel
	
	}
	
	
	def void onManageSerie() {
		val serieModel = new SerieManagementAppModel(this.modelObject.model,null)
		
		new SerieManagementWindow( this, serieModel ) =>  [ 
			onAccept[ this.modelObject.addSerie(serieModel.serie) ]
			open						
		]	
	}
}

@Accessors
public class Terna<T,K,Z>{

	T x
	K y
	Z z 
	
	new(T x, K y, Z z){
		this.x = x
		this.y = y
		this.z = z
	}

}