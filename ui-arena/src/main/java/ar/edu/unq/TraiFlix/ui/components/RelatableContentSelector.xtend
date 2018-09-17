package ar.edu.unq.TraiFlix.ui.components

import org.uqbar.arena.widgets.Panel
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Container
import org.uqbar.arena.widgets.GroupPanel
import ar.edu.unq.TraiFlix.ui.appModels.RelatableToTableAdapter
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.HorizontalLayout

@Accessors
class RelatableContentSelector extends GroupPanel {
	
	String relatedContentsPropertyName
	String selectedRelatedContentPropertyName
	Runnable onAddRelatedContent
	Runnable onRemoveRelatedContent
	
	new(Container container) {
		super(container)
	}
	
	
	def show() {
		title = "Contenido relacionado"
		layout = new HorizontalLayout
			
		// Related content grid
		new Table<RelatableToTableAdapter>(this, typeof(RelatableToTableAdapter))=> [				
			items <=> relatedContentsPropertyName
			selection <=> selectedRelatedContentPropertyName
				
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
		new Panel(this) => [
			layout = new VerticalLayout
			new Button(it) => [ 
				caption = "Agregar"
				alignCenter
				onClick [ | onAddRelatedContent.run ]
			]
			new Button(it) => [ 
				caption = "Quitar"
				alignCenter
				bindEnabled(new NotNullObservable(selectedRelatedContentPropertyName))
				onClick [ | onRemoveRelatedContent.run ]
			]
		]
	}
		
}