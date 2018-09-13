package ar.edu.unq.TraiFlix.ui

import org.uqbar.arena.windows.Window
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Selector
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.TraiFlix.usecase.SerieManagementUseCase
import org.uqbar.arena.widgets.List
import org.uqbar.arena.windows.ErrorsPanel

class SerieManagementWindow extends Window<SerieManagementUseCase> {
	
	new( WindowOwner owner, SerieManagementUseCase model ) {
		super(owner, model)
	}
	
	override createContents(Panel mainPanel) {
		
		this.title = "TraiFlix - Administrar Series [EN CONSTRUCCION]"
		mainPanel.layout = new VerticalLayout		
				
		// Build general information panel...
		createGeneralInfoPanel( mainPanel )
		
		// Build categories panel...
		createCategoriesPanel( mainPanel )
		
		// Build episodes panel...
		
		// Build related content panel...
		
		new ErrorsPanel( mainPanel, "" ) 
			
	}
	
	private def void createGeneralInfoPanel(Panel parentPanel) {
		
		var generalPanel = new Panel(parentPanel)
		generalPanel.layout = new HorizontalLayout
		
		// Title
		new Label(generalPanel) => [			
			text = "Titulo" 
		]
		new TextBox(generalPanel) => [
			value <=> "serie.title"
			width = 300
		]			
			
		// Classificacion
		new Label(generalPanel) => [
			text = "Clasificacion" 
		]
		new Selector(generalPanel) => [
			items <=> "availableClassifications"
			value <=> "serie.clasification"
		]
		
		// Creators
		new Label(generalPanel) => [			
			text = "Creadores" 
		]
		new TextBox(generalPanel) => [
			value <=> "serie.creators"
			width = 300
		]
	
	}
	
	
	private def void createCategoriesPanel(Panel parentPanel) {
				
		var categoriesPanel = new Panel(parentPanel)
		categoriesPanel.layout = new VerticalLayout

		new Label(categoriesPanel) => [			
			text = "Categorias" 
		]
		new List(categoriesPanel) => [
			items <=> "availableCategories"
		]
		
	}
}