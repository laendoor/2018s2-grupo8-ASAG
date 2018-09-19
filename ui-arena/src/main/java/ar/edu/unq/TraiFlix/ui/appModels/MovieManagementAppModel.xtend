package ar.edu.unq.TraiFlix.ui.appModels

import ar.edu.unq.TraiFlix.models.Category
import ar.edu.unq.TraiFlix.models.Movie
import ar.edu.unq.TraiFlix.models.Relatable
import ar.edu.unq.TraiFlix.models.TraiFlix
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.util.List

@Accessors
@Observable
class MovieManagementAppModel extends AppModel implements ContentManagementAppModel {

	Movie movie
	Relatable selectedRelatedContent
	Category selectedAvailableCategory
	Category selectedAssignedCategory
	List<Category> availableCategories
	boolean readOnly
	

	new(TraiFlix model) {
		super(model)
		movie = new Movie()
		updateAvailableCategories
		readOnly = false
		
	}

	override availableClassifications() {
		model.classifications
	}

	override availableRelatableContents() {
		model.getRelatableContent(movie)
	}

	override selectablesCategories() {
		model.categories
	}

	override addSelectedCategory() {
		movie.categories.add(selectedAvailableCategory)
	}

	override removeSelectedAssignedCategory() {
		movie.categories.remove(selectedAssignedCategory)
	}

	override removeSelectedRelatedContent() {
		movie.relateds.remove(selectedRelatedContent)
	}
	
	override updateAvailableCategories() {
		availableCategories = model.categories.filter( elem | !movie.categories.contains(elem) ).toList
	}
	
	override void addSelectedAvailableCategory() {
		movie.categories.add(selectedAvailableCategory)
		updateAvailableCategories
	}

}
