package ar.edu.unq.TraiFlix.ui

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.TraiFlix.ui.appModels.RelatableContentAppModel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.widgets.tables.Column
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.TraiFlix.ui.appModels.RelatableToTableAdapter

class RelatableContentSelectionDialog extends Dialog<RelatableContentAppModel> {
	
	new(WindowOwner owner, RelatableContentAppModel model) {
		super(owner, model)
	}

	
    override createErrorsPanel(Panel mainPanel) {}
    
    	
	override protected createFormPanel(Panel mainPanel) {
		
		mainPanel.layout = new VerticalLayout
		
		createContentGrid(mainPanel)
		
		createButtonsPanel(mainPanel)			
		
	}

	
	def createContentGrid(Panel parentPanel) {
		new Table<RelatableToTableAdapter>(parentPanel, typeof(RelatableToTableAdapter))=> [				
			items <=> "availableRelatableContents"				
			selection <=> "selectedRelatableContent"

			new Column<RelatableToTableAdapter>(it) => [
			    title = "Titulo"
			    fixedSize = 200				    
			    bindContentsToProperty("title")
			]
			new Column<RelatableToTableAdapter>(it) => [
			    title = "Contenido"
			    fixedSize = 100
			    bindContentsToProperty("contentType")
			]
		]
	}

	
	def createButtonsPanel(Panel parentPanel) {
		new Button(parentPanel) => [ 
				caption = "Seleccionar"
				alignCenter
				bindEnabled(new NotNullObservable("selectedRelatableContent"))
				onClick [ | accept ]
		]
	}	

}
