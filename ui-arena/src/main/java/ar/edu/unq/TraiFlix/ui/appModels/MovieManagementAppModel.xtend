package ar.edu.unq.TraiFlix.ui.appModels

import ar.edu.unq.TraiFlix.models.Category
import ar.edu.unq.TraiFlix.models.Movie
import ar.edu.unq.TraiFlix.models.Relatable
import ar.edu.unq.TraiFlix.models.TraiFlix
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class MovieManagementAppModel extends AppModel implements ContentManagementAppModel {

	Movie movie
	Relatable selectedRelatedContent
	Category selectedAvailableCategory
	Category selectedAssignedCategory

	new(TraiFlix model) {
		super(model)
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

}
