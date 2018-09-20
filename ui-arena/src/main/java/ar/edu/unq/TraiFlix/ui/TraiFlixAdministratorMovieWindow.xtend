package ar.edu.unq.TraiFlix.ui


import ar.edu.unq.TraiFlix.ui.appModels.MovieManagementAppModel
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.GroupPanel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox


import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.windows.Window
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import ar.edu.unq.TraiFlix.ui.appModels.RelatableToTableAdapter
import ar.edu.unq.TraiFlix.ui.appModels.RelatableContentAppModel
import ar.edu.unq.TraiFlix.filters.DateTextFilter
import ar.edu.unq.TraiFlix.transformer.DurationTransformer
import org.uqbar.arena.windows.MessageBox
import ar.edu.unq.TraiFlix.filters.LinkTextFilter
import ar.edu.unq.TraiFlix.transformer.DateTransformer
import ar.edu.unq.TraiFlix.filters.DurationFilter

class TraiFlixAdministratorMovieWindow extends Dialog<MovieManagementAppModel>{
	
	new(Window owner, MovieManagementAppModel model) {
		super(owner,model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		this.title = "TraiFlix Administrar Pelicula"
		mainPanel.layout = new VerticalLayout
		new Panel(mainPanel)=> [
			layout = new HorizontalLayout
			this.panelSup(it)
			this.panelMid(it)
		]
		
		this.panelInf(mainPanel)
	}
	
	
	private def panelSup(Panel parentPanel){
		
		new Panel(parentPanel) => [
			layout = new VerticalLayout
			this.panelWithLabelAndTextBox(it, "Titulo", "movie.title")
			createCategoriesPanel(it)				
		]
	}
	
	
	private def selector(Panel parent, String items1, String value1){
		new Selector(parent) => [
			items <=> items1
			value <=> value1
			width = 215
		]
	}
	
	def panelWithLabelAndTextBox(Panel parent, String title, String value) {
		new Panel(parent) => [
			layout = new HorizontalLayout
			this.label(it, title)
			this.textBox(it, value)
		]
	}
	
	
	private def panelMid(Panel panel){
		new Panel(panel) => [
			layout = new ColumnLayout(2)
			new Panel(it)=>[
				layout = new ColumnLayout(2)
				this.panelDuration(it, "Duracion", "movie.duration")
				this.colunmLabels(it)
			]	
		]		
	}
	
	private def panelDuration(Panel parent, String title, String value1){
		new Panel(parent)=>[
			layout = new HorizontalLayout
			this.label(it,title)
			new TextBox(it) => [
				withFilter(new DurationFilter)
				(value <=> value1).transformer = new DurationTransformer
			]
		]
	}
	
	
	
	private def colunmLabels(Panel parent){
		var columnPanel = new Panel(parent)
		columnPanel.layout = new ColumnLayout(2)
		this.label(columnPanel, "Clasificasion")
		this.selector(columnPanel, "availableClassifications", "movie.clasification")	
		this.label(columnPanel,"Fecha de estreno")	
		new TextBox(columnPanel)=> [
			width = 200
			withFilter(new DateTextFilter)
			(value <=> "movie.release" ).transformer = new DateTransformer
			]
		this.label(columnPanel, "Directores")
		this.textBox(columnPanel, "movie.directors")	
		this.label(columnPanel,"Actores principales")
		this.textBox(columnPanel, "movie.actors")
		this.label(columnPanel,"Link")
		this.textBox(columnPanel, "movie.link")=>[
			//withFilter = new LinkTextFilter
			]	
		

							
				
		
	}
	
	private def label(Panel panel, String title){
		new Label(panel) => [			
			text = title
				
		]
	}
		
	
	private def textBox(Panel parent, String value1){
		new TextBox(parent) =>[
			value <=> value1
			width = 200
			//height = 50
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
					items <=> "movie.categories"	
					value <=> "selectedAssignedCategory"
					height = 50	
				]
			]
		]
		
	}
	
	private def panelInf(Panel parent){
		new Panel(parent)=>[
			this.createRelatedContentPanel(it)
			this.createOkCancelButtonPanel(it)
		]
	}
	
	private def createRelatedContentPanel(Panel parentPanel) {
		
		new GroupPanel(parentPanel) => [
			title = "Contenido relacionado"
			layout = new VerticalLayout
			width = 400
			
			new Table<RelatableToTableAdapter>(it, typeof(RelatableToTableAdapter))=> [				
				items <=> "movie.relateds"
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
			
			
			new Panel(it) => [
				layout = new HorizontalLayout
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
	
	def onAddRelatedContent() {
		val relatableContentModel = new RelatableContentAppModel(modelObject.model,modelObject.movie)
		
		new RelatableContentSelectionDialog(this,relatableContentModel) => [
			title = "Contenidos disponibles para relacionar"
			onAccept[ this.modelObject.movie.addRelated(relatableContentModel.selectedRelatableContent) ]
			open
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
				onClick [ | if( this.modelObject.canSave ){						
							this.accept
							}
							else showMessageBox(MessageBox.Type.Error,"No ha ingresado todos los datos obligatorios.")
					]
			]				
		]
		
	}
	
	
	

	

	
}