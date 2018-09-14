package ar.edu.unq.TraiFlix.ui

import ar.edu.unq.TraiFlix.models.TraiFlix
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.TextBox
import ar.edu.unq.TraiFlix.models.Movie
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.windows.Window
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.TraiFlix.appModel.SerieManagementAppModel
import ar.edu.unq.TraiFlix.models.Serie
import ar.edu.unq.TraiFlix.models.Clasification
import ar.edu.unq.TraiFlix.models.Category
import ar.edu.unq.TraiFlix.models.Episode
import java.util.ArrayList

class TraiFlixMainWindow extends Window<TraiFlix> {
	


	new(WindowOwner owner, TraiFlix model) {
		super(owner, model)
	}
	
	override createContents(Panel mainPanel) {
		this.title = "Admin TraiFlix"

		mainPanel.layout = new VerticalLayout
		
		var otherPanel = new Panel(mainPanel)
		otherPanel.layout = new HorizontalLayout
		new Label(otherPanel) =>[
			
			text = "PELICULAS"
			fontSize= 16]
		new Button(otherPanel) => [ 
				caption = "Ver Usuarios"
				alignCenter
//				onClick [ | modelObject.convertir ]
//				bindEnabled(new NotNullObservable("conversion"))
		]
		
		new Button(otherPanel) => [ 
				caption = "*Prueba Administrar Serie*"
				alignCenter
				onClick [ | onManageSerie ]
//				bindEnabled(new NotNullObservable(""))
		]


		new TextBox(mainPanel).withFilter(null)
		var moviePanel = new Panel(mainPanel)
		moviePanel.layout = new HorizontalLayout
		var table = new Table<Movie>(moviePanel, typeof(Movie))=> [

		]
		
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
		]
		
		var buttonPanel = new Panel(moviePanel)
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
				]
		
	}
	
	def void onManageSerie() {
		var useCase = new SerieManagementAppModel()=>[ 				
				serie = new Serie => [
					// ** Datos de prueba **
					title = "[Titulo de la serie]"
					clasification = new Clasification("ATP")
					addCategory( new Category("Estrenos") )
					creators = "[Sin definir]"
					addEpisode( new Episode(it,1,1) => [
						title = "El primer capitulo"
					] )
					addEpisode( new Episode(it,1,2) => [
						title = "El segundo capitulo"
					] )
					addRelated( new Movie() => [ title = "La Momia" ] )			
				]
				availableClassifications = modelObject.classifications
				availableCategories = modelObject.categories
				availableRelatableContent = new ArrayList()
				availableRelatableContent.add( new Movie() => [ title = "La Momia" ] )
				availableRelatableContent.add( new Movie() => [ title = "Volver al Futuro" ] )
				
			]
			
		var window = new SerieManagementWindow( this, useCase )
		window.open()
	}

}