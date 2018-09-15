package ar.edu.unq.TraiFlix.ui.appModels

import ar.edu.unq.TraiFlix.models.TraiFlix
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@TransactionalAndObservable
class AppModel {
	
	TraiFlix model
	
	new(TraiFlix model){
		this.model = model
	}
}