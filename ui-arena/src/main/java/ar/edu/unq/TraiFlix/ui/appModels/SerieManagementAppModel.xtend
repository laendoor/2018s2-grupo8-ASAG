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
	boolean editMode

	new(TraiFlix model, Serie serie) {
		super(model)
		this.serie = serie
		updateAvailableCategories
		editMode = true
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
	
	def void addEpisode(Episode episode) {
		serie.addEpisode(episode)
	}
	
	def void removeSelectedEpisode() {
		serie.removeEpisode(selectedEpisode)
	}
	
	def void removeSelectedRelatedContent() {
		serie.removeRelated(selectedRelatedContent)
	}
		
	@Dependencies("serie.title","serie.categories","serie.clasification")
	def canSave() {
		(serie.getTitle()!==null) && (serie.getTitle().trim.length>0) && (serie.categories.size>0) && (serie.clasification!==null)
	}
	
}
