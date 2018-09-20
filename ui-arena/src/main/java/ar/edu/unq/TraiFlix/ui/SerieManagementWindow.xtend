package ar.edu.unq.TraiFlix.ui

import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.TraiFlix.ui.appModels.SerieManagementAppModel
import ar.edu.unq.TraiFlix.models.Episode
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.widgets.GroupPanel
import org.uqbar.arena.windows.Dialog
import ar.edu.unq.TraiFlix.ui.appModels.RelatableContentAppModel
import org.uqbar.arena.layout.ColumnLayout
import ar.edu.unq.TraiFlix.ui.components.ClassificationSelector
import ar.edu.unq.TraiFlix.ui.components.CategorySelector
import ar.edu.unq.TraiFlix.ui.components.RelatableContentSelector
import org.uqbar.arena.windows.MessageBox
import ar.edu.unq.TraiFlix.ui.appModels.EpisodeManagementAppModel

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
				enabled <=> "editMode"
			]			
					
			// Classificacion
			new ClassificationSelector(it,"availableClassifications","serie.clasification","editMode")
				
			// Creators
			new Label(it) => [			
				text = "Creadores" 			
			]
			new TextBox(it) => [
				value <=> "serie.creators"
				width = 200
				enabled <=> "editMode"
			]
				
			createCategoriesPanel(it)				
		]
	}
	
	
	private def createCategoriesPanel(Panel parentPanel) {
			
		new CategorySelector(parentPanel) => [
			availableCategoriesPropertyName = "availableCategories"	
			selectedAvailableCategoryPropertyName = "selectedAvailableCategory"
			assignedCategoriesPropertyName = "serie.categories"
			selectedAssignedCategoryPropertyName = "selectedAssignedCategory"
			onAddCategory = [ this.modelObject.addSelectedAvailableCategory ]
			onRemoveCategory = [ this.modelObject.removeSelectedAssignedCategory ]
			show
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
					bindVisibleToProperty("editMode")
					onClick [ | onAddEpisode() ]
				]
				new Button(it) => [ 
					caption = "Quitar"
					alignCenter
					bindVisibleToProperty("editMode")
					bindEnabled(new NotNullObservable("selectedEpisode"))
					onClick [ | modelObject.removeSelectedEpisode ]
				]
			]
		]
	}
	
	
	private def createRelatedContentPanel(Panel parentPanel) {
		
		new RelatableContentSelector(parentPanel) => [
			relatedContentsPropertyName = "serie.relateds"
			selectedRelatedContentPropertyName = "selectedRelatedContent"
			onRemoveRelatedContent = [ this.modelObject.removeSelectedRelatedContent ]
			onAddRelatedContent = [ val relatableContentModel = new RelatableContentAppModel(this.modelObject.model,this.modelObject.serie)
									
									new RelatableContentSelectionDialog(this,relatableContentModel) => [
												title = "Contenidos disponibles para relacionar"
												onAccept[ this.modelObject.serie.addRelated(relatableContentModel.selectedRelatableContent) ]
												open
											]
									]
			show
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
				//enabled <=> "canSave" // TO-DO: no funciona este binding ...
				onClick [ | if( this.modelObject.canSave ) this.accept
							else showMessageBox(MessageBox.Type.Error,"No ha ingresado todos los datos obligatorios.")
					]
			]				
		]
		
	}
	
	
	private def onAddEpisode() {
		val episode = new Episode(this.modelObject.serie)
		val appModelEpisode= new EpisodeManagementAppModel(episode)
		
		new EpisodeWindow(this, appModelEpisode ) =>  [ 
			
			title = "TraiFlix - Crear Nuevo Episodio"
			onAccept[ this.modelObject.addEpisode(episode) ]
			open						
		]	
	}
	
	
}