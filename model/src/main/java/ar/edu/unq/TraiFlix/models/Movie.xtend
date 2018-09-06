package ar.edu.unq.TraiFlix.models

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Movie extends Content implements ContentRatingable{
	
	List<Category> categories
	Clasification clasification
	List<ContentRatingable> relateds
	
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
	
}
