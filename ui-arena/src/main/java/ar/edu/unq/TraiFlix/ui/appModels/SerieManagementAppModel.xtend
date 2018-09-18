package ar.edu.unq.TraiFlix.ui.appModels

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.TraiFlix.models.Serie
import java.util.List
import ar.edu.unq.TraiFlix.models.Category
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
	List<Category> availableCategories
	boolean viewMode

	new(TraiFlix model, Serie serie) {
		super(model)
		this.serie = serie
		updateAvailableCategories
		viewMode = false
	}
	
	def availableClassifications() {
		model.classifications
	}
	
	def availableRelatableContents() {
		model.getRelatableContent(serie)
	}

	private def updateAvailableCategories() {
		availableCategories = model.categories.filter( elem | !serie.categories.contains(elem) ).toList
	}
	
	def void addSelectedAvailableCategory() {
		serie.addCategory(selectedAvailableCategory)
		updateAvailableCategories
	}
	
	def void removeSelectedAssignedCategory() {
		serie.removeCategory(selectedAssignedCategory)
		updateAvailableCategories
	}
	
	def void removeSelectedEpisode() {
		serie.removeEpisode(selectedEpisode)
	}
	
	def void removeSelectedRelatedContent() {
		serie.removeRelated(selectedRelatedContent)
	}	
	
	@Dependencies("serie.title","serie.categories","serie.clasification")
	def getCanSave() {
		(serie.getTitle()!==null) && (serie.getTitle().trim.length>0) && (serie.categories.size>0) && (serie.clasification!==null)
	}
	
}
