package ar.edu.unq.TraiFlix.ui.appModels

import ar.edu.unq.TraiFlix.models.TraiFlix
import ar.edu.unq.TraiFlix.models.Serie

class AdminModel extends AppModel{
	
	new(TraiFlix model) {
		super(model)
	}


	def addSerie( Serie serie ) {
		model.setNewSerie(serie)
	}
	
	
}