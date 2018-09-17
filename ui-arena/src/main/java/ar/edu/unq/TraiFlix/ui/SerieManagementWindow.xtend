package ar.edu.unq.TraiFlix.ui

import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Selector
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.TraiFlix.ui.appModels.SerieManagementAppModel
import org.uqbar.arena.widgets.List
import ar.edu.unq.TraiFlix.models.Episode
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.widgets.GroupPanel
import org.uqbar.arena.windows.Dialog
import ar.edu.unq.TraiFlix.ui.appModels.RelatableContentAppModel
import ar.edu.unq.TraiFlix.ui.appModels.RelatableToTableAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.windows.MainWindow

class SerieManagementWindow extends Dialog<SerieManagementAppModel> {
	
	new( WindowOwner owner, SerieManagementAppModel model ) {
		super(owner, model)
	}
	
	
	override createErrorsPanel(Panel mainPanel) {}
	
	
	override createFormPanel(Panel mainPanel) {
				
		mainPanel.layout = new VerticalLayout		
				
		// Build general information panel...
		createGeneralInfoPanel(mainPanel)
		
		// Build episodes panel...
		createEpisodesPanel(mainPanel)

		// Build related content panel...
		createRelatedContentPanel(mainPanel)

		// Build ok/cancel button panel...
		createOkCancelButtonPanel(mainPanel)
		
	}
	

	private def createGeneralInfoPanel(Panel parentPanel) {
		
		new Panel(parentPanel) => [
			layout = new ColumnLayout(2)
			
			// Title
			new Label(it) => [			
				text = "Titulo" 
			]
			new TextBox(it) => [
				value <=> "serie.title"
				width = 200
			]			
					
			// Classificacion
			new Label(it) => [
				text = "Clasificacion" 
			]
			new Selector(it) => [
				items <=> "availableClassifications"
				value <=> "serie.clasification"
			]
				
			// Creators
			new Label(it) => [			
				text = "Creadores" 			
			]
			new TextBox(it) => [
				value <=> "serie.creators"
				width = 200
			]
				
			createCategoriesPanel(it)				
		]
	}
	
	
	private def createCategoriesPanel(Panel parentPanel) {
				
		new GroupPanel(parentPanel) => [
			title = "Categorias"
			layout = new HorizontalLayout
			
			new Panel(it) => [
				layout = new VerticalLayout			
				new Label(it) => [
					text = "Disponibles"
					alignLeft
				]
				new List(it) => [
					items <=> "availableCategories"	
					value <=> "selectedAvailableCategory"
					height = 50	
				]
			]
			
			new Panel(it) => [
				layout = new VerticalLayout
				new Button(it) => [ 
					caption = ">"
					alignCenter
					bindEnabled(new NotNullObservable("selectedAvailableCategory"))
					onClick [ | modelObject.addSelectedAvailableCategory ]
				]
				new Button(it) => [ 
					caption = "<"
					alignCenter
					bindEnabled(new NotNullObservable("selectedAssignedCategory"))
					onClick [ | modelObject.removeSelectedAssignedCategory]
				]
			]
			
			new Panel(it) => [
				layout = new VerticalLayout			
				new Label(it) => [
					text = "Seleccionadas"
					alignLeft
				]
				new List(it) => [
					items <=> "serie.categories"	
					value <=> "selectedAssignedCategory"
					height = 50	
				]
			]
		]
		
	}
	

	private def createEpisodesPanel(Panel parentPanel) {

		new GroupPanel(parentPanel) => [
			title = "Capitulos"
			layout = new HorizontalLayout
				
			// Episodes grid
			new Table<Episode>(it, typeof(Episode))=> [				
				items <=> "serie.episodes"				
				selection <=> "selectedEpisode"
						
				new Column<Episode>(it) => [
				    title = "Temporada"
				    fixedSize = 100				    
				    bindContentsToProperty("season")
				]
				new Column<Episode>(it) => [
				    title = "Capitulo"
				    fixedSize = 300
				    bindContentsToProperty("title")
				]
			]
				
			// Add/remove episode button panel...
			new Panel(it) => [
				layout = new VerticalLayout
				new Button(it) => [ 
					caption = "Agregar"
					alignCenter
					onClick [ | onAddEpisode() ]
				]
				new Button(it) => [ 
					caption = "Quitar"
					alignCenter
					bindEnabled(new NotNullObservable("selectedEpisode"))
					onClick [ | modelObject.removeSelectedEpisode ]
				]
			]
		]
	}
	
	
	private def createRelatedContentPanel(Panel parentPanel) {
		
		new GroupPanel(parentPanel) => [
			title = "Contenido relacionado"
			layout = new HorizontalLayout
			
			// Related content grid
			new Table<RelatableToTableAdapter>(it, typeof(RelatableToTableAdapter))=> [				
				items <=> "serie.relateds"
				selection <=> "selectedRelatedContent"
				
				new Column<RelatableToTableAdapter>(it) => [
				    title = "Titulo"
				    fixedSize = 300				    
				    bindContentsToProperty("title")
				]
				new Column<RelatableToTableAdapter>(it) => [
				    title = "Contenido"
				    fixedSize = 100
				    bindContentsToProperty("contentType")
				]
			]
			
			// Add/remove related button panel...
			new Panel(it) => [
				layout = new VerticalLayout
				new Button(it) => [ 
					caption = "Agregar"
					alignCenter
					onClick [ | onAddRelatedContent() ]
				]
				new Button(it) => [ 
					caption = "Quitar"
					alignCenter
					bindEnabled(new NotNullObservable("selectedRelatedContent"))
					onClick [ | modelObject.removeSelectedRelatedContent ]
				]
			]
		]
	}
	
	
	private def createOkCancelButtonPanel(Panel parentPanel) {
		
		// Cancel/Ok button panel...			
		new Panel(parentPanel) => [
			layout = new HorizontalLayout
			new Button(it) => [ 
				caption = "Cancelar"
				alignCenter
				width = 200
				onClick [ | this.cancel ]
			]
			new Button(it) => [ 
				caption = "Aceptar"
				alignCenter
				width = 200
				onClick [ | this.accept ]
			]				
		]
		
	}
	
	
	private def onAddEpisode() {
		/* TO-DO:
		 * - instanciar el appModel para el caso de uso "crear un capitulo"
		 * 		ese appModel contiene un nuevo Episode y el resto de los datos necesarios para el caso de uso
		 * - instanciar la ventana de administracion de capitulos y pasarle su appModel
		 * - si se sale de la ventana con onAccept, llamar a mi modelObject.serie.addEpisode() con el capitulo creado
		 */
	}
	
		
	private def onAddRelatedContent() {	
		val relatableContentModel = new RelatableContentAppModel(modelObject.model,modelObject.serie)
		
		new RelatableContentSelectionDialog(this,relatableContentModel) => [
			title = "Contenidos disponibles para relacionar"
			onAccept[ this.modelObject.serie.addRelated(relatableContentModel.selectedRelatableContent) ]
			open
		]
	}
	
		

	
}