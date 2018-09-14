package ar.edu.unq.TraiFlix.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.TraiFlix.models.Serie
import java.util.List
import ar.edu.unq.TraiFlix.models.Category
import ar.edu.unq.TraiFlix.models.Clasification
import ar.edu.unq.TraiFlix.models.Episode
import ar.edu.unq.TraiFlix.models.Relatable

@Accessors
@Observable
class SerieManagementAppModel {
	
	Serie serie	
	List<Clasification> availableClassifications
	List<Category> availableCategories
	List<Relatable> availableRelatableContent
	Episode selectedEpisode
	Relatable selectedRelatedContent
	Category selectedAvailableCategory
	Category selectedAssignedCategory
	
	def void removeSelectedEpisode() {
		serie.removeEpisode(selectedEpisode)
	}
	
	def void removeSelectedRelatedContent() {
		serie.removeRelated(selectedRelatedContent)
	}
	
	def List<Category> selectablesCategories() {
		this.availableCategories.filter( elem | !serie.categories.contains(elem) ).toList
	}
	
	def void addSelectedCategory() {
		serie.addCategory(selectedAvailableCategory)
	}
	
	def void removeSelectedAssignedCategory() {
		serie.removeCategory(selectedAssignedCategory)
	}	
	
}
