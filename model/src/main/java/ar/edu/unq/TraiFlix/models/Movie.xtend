package ar.edu.unq.TraiFlix.models

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Movie extends Content{
	
	List<Category> categories
	Clasification clasification
	List<Content> relateds
	
	new(){
		super()
		categories = newArrayList
		relateds = newArrayList
	}

	def getRating() {
		var Integer sum = 0
		for (Assessment critc : assessments) {
			sum = sum + critc.getValue()
		}
		return sum/assessments.size
	}

	
	
	
	
}
