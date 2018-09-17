package ar.edu.unq.TraiFlix.ui.components

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Container
import org.uqbar.arena.widgets.GroupPanel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.widgets.Label
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CategorySelector extends GroupPanel {
	
	String availableCategoriesPropertyName
	String selectedAvailableCategoryPropertyName
	String assignedCategoriesPropertyName
	String selectedAssignedCategoryPropertyName
	Runnable onAddCategory
	Runnable onRemoveCategory
		
	new(Container container) {
		super(container)
	}
	
	def show() {
		
		title = "Categorias"
		layout = new HorizontalLayout
			
		new Panel(this) => [
			layout = new VerticalLayout			
			new Label(it) => [
				text = "Disponibles"
				alignLeft
			]
			new List(it) => [
				items <=> availableCategoriesPropertyName
				value <=> selectedAvailableCategoryPropertyName
				height = 50	
			]
		]
			
		new Panel(this) => [
			layout = new VerticalLayout
			new Button(it) => [ 
				caption = ">"
				alignCenter
				bindEnabled(new NotNullObservable(selectedAvailableCategoryPropertyName))
				onClick [ | onAddCategory.run() ]
			]
			new Button(it) => [ 
				caption = "<"
				alignCenter
				bindEnabled(new NotNullObservable(selectedAssignedCategoryPropertyName))
				onClick [ | onRemoveCategory.run() ]
			]
		]
			
		new Panel(this) => [
			layout = new VerticalLayout			
			new Label(it) => [
				text = "Seleccionadas"
				alignLeft
			]
			new List(it) => [
				items <=> assignedCategoriesPropertyName
				value <=> selectedAssignedCategoryPropertyName
				height = 50	
			]
		]
		
	}
	
}