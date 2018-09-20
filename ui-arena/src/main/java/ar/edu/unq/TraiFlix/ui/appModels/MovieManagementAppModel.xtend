package ar.edu.unq.TraiFlix.ui.appModels

import ar.edu.unq.TraiFlix.models.Category
import ar.edu.unq.TraiFlix.models.Movie
import ar.edu.unq.TraiFlix.models.Relatable
import ar.edu.unq.TraiFlix.models.TraiFlix
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class MovieManagementAppModel extends AppModel implements ContentManagementAppModel {

	Movie movie
	Relatable selectedRelatedContent
	Category selectedAvailableCategory
	Category selectedAssignedCategory
	List<Category> availableCategories
	

	new(TraiFlix model, Movie movie1) {
		super(model)
		movie = movie1
		updateAvailableCategories
		
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

	
	@Dependencies("movie.title","movie.categories","movie.clasification","movie.release",
		"movie.directors","movie.actors","movie.link","movie.duration"
	)
	def canSave() {
		(movie.getTitle()!==null) && (movie.getTitle().trim.length>0) && 
		(movie.categories.size>0) && (movie.clasification!==null) &&
		(movie.release !== null) && 
		(movie.directors !== null) && (movie.directors.trim.length>0)
		(movie.actors !== null) && (movie.actors.trim.length>0) &&
		((movie.link === null) || (movie.link.trim.length>0)) &&
		((movie.link === null) || (movie.duration !== null))
	}

}
