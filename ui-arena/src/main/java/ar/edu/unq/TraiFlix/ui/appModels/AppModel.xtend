package ar.edu.unq.TraiFlix.ui.appModels

import ar.edu.unq.TraiFlix.models.TraiFlix
import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Observable
abstract class AppModel {
	
	TraiFlix model
	
	new(TraiFlix model){
		this.model = model
	}
	
}