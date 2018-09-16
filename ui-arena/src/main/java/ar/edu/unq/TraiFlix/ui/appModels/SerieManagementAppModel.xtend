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
	RelatableToTableAdapter selectedRelatedContent
	Category selectedAvailableCategory
	Category selectedAssignedCategory
	boolean readOnly

	new(TraiFlix model) {
		super(model)
		serie = new Serie => [
					title = "El titulo"
					clasification = new Clasification("ATP")
					addCategory( new Category("Estrenos") )
					creators = "Los creadores"
					addEpisode( new Episode(it,1,1) => [
							title = "Capitulo 1"
						] )
					addEpisode( new Episode(it,1,2) => [
							title = "Capitulo 2"
					] )					
				]
		readOnly = false
	}
	
	def List<Clasification> availableClassifications() {
		model.classifications
	}
	
	def List<Relatable> availableRelatableContents() {
		model.getRelatableContent(serie).map[ elem | new RelatableToTableAdapter(elem) ]
	}
	
	@Dependencies("serie.categories")
	def List<Category> selectablesCategories() {
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
		serie.removeRelated(selectedRelatedContent.relatable)
	}	
	
}
