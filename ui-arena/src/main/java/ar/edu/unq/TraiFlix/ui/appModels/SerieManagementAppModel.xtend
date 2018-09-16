package ar.edu.unq.TraiFlix.ui.appModels

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.TraiFlix.models.Serie
import java.util.List
import ar.edu.unq.TraiFlix.models.Category
import ar.edu.unq.TraiFlix.models.Clasification
import ar.edu.unq.TraiFlix.models.Episode
import ar.edu.unq.TraiFlix.models.Relatable
import ar.edu.unq.TraiFlix.models.TraiFlix
import org.uqbar.commons.model.annotations.Dependencies

@Accessors
@Observable
class SerieManagementAppModel extends AppModel {
	
	Serie serie	
	Episode selectedEpisode
	Relatable selectedRelatedContent
	Category selectedAvailableCategory
	Category selectedAssignedCategory
	boolean readOnly

	new(TraiFlix model) {
		super(model)
		readOnly = false
	}
	
	def List<Clasification> availableClassifications() {
		model.classifications
	}
	
	def availableRelatableContents() {
		model.getRelatableContent(serie)
	}

	@Dependencies("serie.categories")
	def availableCategories() {
		model.categories.filter( elem | !serie.categories.contains(elem) ).toList
	}
	
	def void addSelectedCategory() {
		serie.addCategory(selectedAvailableCategory)
	}
	
	def void removeSelectedAssignedCategory() {
		serie.removeCategory(selectedAssignedCategory)
	}
	
	def void removeSelectedEpisode() {
		serie.removeEpisode(selectedEpisode)
	}
	
	def void removeSelectedRelatedContent() {
		serie.removeRelated(selectedRelatedContent)
	}	
	
}
