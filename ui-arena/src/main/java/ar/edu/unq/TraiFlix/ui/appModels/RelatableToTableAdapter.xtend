package ar.edu.unq.TraiFlix.ui.appModels

import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.TraiFlix.models.Relatable

@Accessors
@Observable
class RelatableToTableAdapter implements Relatable {
	
	Relatable relatable
	
	new(Relatable relatable) {
		this.relatable = relatable
	}
	
	override title() {
		relatable.title
	}
	
	override contentType() {
		relatable.contentType
	}
	
	override addRelated(Relatable related) {
		relatable.addRelated(related)
	}
	
	override removeRelated(Relatable related) {
		relatable.removeRelated(related)
	}
	
	override getRelateds() {
		relatable.getRelateds
	}
	
}