package ar.edu.unq.TraiFlix.models

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.TraiFlix.models.id.MovieId
import java.util.ArrayList

@Observable
@Accessors
class Movie extends Content implements Ratingable {
	
	List<Category> categories
	Clasification clasification
	List<Ratingable> relateds
	
	new(){
		super()
		categories = new ArrayList
		relateds = new ArrayList
		super.id = new MovieId()
 	}
 
	override def MovieId getId() {super.id as MovieId}
	
	override getRating() {
		var Integer sum = 0
		for (Assessment critc : assessments) {
			sum = sum + critc.getValue()
		}
		return sum/assessments.size
	}

	def movieHasCategory(Category category){
		categories.exists[elem | elem.name == category.name]
	}
	
	def clasificationIs(Clasification clasification1){
		clasification.name == clasification1.name
	}
		
}
