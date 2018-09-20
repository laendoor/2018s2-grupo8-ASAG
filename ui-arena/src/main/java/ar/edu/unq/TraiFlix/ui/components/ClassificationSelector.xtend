package ar.edu.unq.TraiFlix.ui.components

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Selector
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class ClassificationSelector {
	
	new( Panel parentPanel,
		 String availableClassificationsPropertyName, 
		 String selectedClassificationPropertyName,
		 String enabledPropertyName ) {
		createLayout(parentPanel,availableClassificationsPropertyName,selectedClassificationPropertyName,enabledPropertyName)
	}
	
	private def createLayout( Panel parentPanel,
							String availableClassificationsProperty, 
							String selectedClassificationProperty,
							String enabledPropertyName ) {

		new Label(parentPanel) => [
			text = "Clasificacion" 
		]
		new Selector(parentPanel) => [
			items <=> availableClassificationsProperty
			value <=> selectedClassificationProperty
			enabled <=> enabledPropertyName
		]
	}
	
}