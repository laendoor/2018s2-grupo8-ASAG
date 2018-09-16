package ar.edu.unq.TraiFlix.ui.appModels

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.TraiFlix.models.TraiFlix
import ar.edu.unq.TraiFlix.models.Relatable

@Accessors
@Observable
class RelatableContentAppModel extends AppModel {
	
	Relatable toRelateWith
	RelatableToTableAdapter selectedRelatableContent
	
	new(TraiFlix model, Relatable toRelateWith) {
		super(model)
		this.toRelateWith = toRelateWith
	}
	
	def availableRelatableContents() {
		model.getRelatableContent(toRelateWith).map[ elem | new RelatableToTableAdapter(elem) ]
	}
	
}