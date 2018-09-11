package ar.edu.unq.TraiFlix.models

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class Movie extends Content implements RatingableAndRecommenable{
	
	List<Category> categories
	Clasification clasification
	List<RatingableAndRecommenable> relateds
	
	new(){
		super()
		categories = newArrayList
		relateds = newArrayList
	}

	override getRating() {
		var Integer sum = 0
		for (Assessment critc : assessments) {
			sum = sum + critc.getValue()
		}
		return sum/assessments.size
	}

	def movieHasCategory(Category category){
		categories.contains(category)
	}
	
	def clasificationIs(Clasification clasification1){
		clasification == clasification1
	}
	
	override isAMovie() {
		true
	}
	
	override isAEpisode() {
		false
	}
	
	override recommend() {
		this
	}
	
}
