package ar.edu.unq.TraiFlix.ui.appModels

import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.TraiFlix.models.Relatable

@Accessors
@Observable
class RelatableToTableAdapter {
	
	Relatable relatable
	
	new(Relatable relatable) {
		this.relatable = relatable
	}
	
	def title() {
		relatable.title
	}
	
	def contentType() {
		relatable.contentType
	}
	
	def addRelated(Relatable related) {
		relatable.addRelated(related)
	}
	
	def removeRelated(Relatable related) {
		relatable.removeRelated(related)
	}
	
	def getRelateds() {
		relatable.getRelateds
	}
	
}