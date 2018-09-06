package ar.edu.unq.TraiFlix.models

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Serie implements ContentRatingable{
	
	Integer id
	String title
	List<Category> categories
	Clasification clasification
	String creators
	List<ContentRatingable> relateds
	List<Episode> episodes;
	
	
	new(){
		super()
		categories = newArrayList
		relateds = newArrayList
		episodes = newArrayList
	}
	
	
	override getRating() {
		var List<Assessment> assessments = newArrayList
		var Integer sum = 0
		for (Episode epi : episodes) {
			assessments.addAll(epi.assessments)
		}
		for (Assessment ass : assessments) {
			sum = sum + ass.getValue()
		}
		if(sum != 0){
			return sum/assessments.size 
		}
		return 0
	}
	
	
	def getEpisode(Integer id){
		episodes.findFirst[
			elem | elem.id == id
		]
	}
	
	
	def addEpisode(Episode episode) {
		episodes.add(episode)
	}	
	
}
