package ar.edu.unq.TraiFlix.models

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.TraiFlix.models.id.MovieId
import java.util.ArrayList

@Observable
@Accessors
class Movie extends Content implements Ratingable, Relatable, Favourable {
	
	List<Category> categories
	Clasification clasification
	List<Relatable> relateds
	
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
		if(assessments.size == 0){
			return 0
		}
		return sum/assessments.size
	}

	def movieHasCategory(Category category){
		categories.exists[elem | elem.name == category.name]
	}
	
	def clasificationIs(Clasification clasification1){
		clasification.name == clasification1.name
	}
	
	override title() {
		super.title
	}
	
	override contentType() {
		class.simpleName
	}
	
	override addRelated(Relatable related) {
		relateds.add(related)
	}
	
	override removeRelated(Relatable related) {
		relateds.remove(related)
	}
	
	override contentId() {
		this.id
	}
		
}
