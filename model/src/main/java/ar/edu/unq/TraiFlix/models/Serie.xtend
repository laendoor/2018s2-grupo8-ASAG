package ar.edu.unq.TraiFlix.models

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.TraiFlix.models.id.SerieId
import ar.edu.unq.TraiFlix.models.id.EpisodeId
import org.uqbar.commons.model.annotations.Observable
import java.util.ArrayList
import com.fasterxml.jackson.annotation.JsonIgnore

@Accessors
@Observable
class Serie implements Ratingable, Relatable, Favourable {
	
	SerieId id
	String title
	List<Category> categories
	Clasification clasification
	String creators
	List<Relatable> relateds
	@JsonIgnore
	List<Episode> episodes;
	
	
	new(){
		super()
		id = new SerieId()
		categories = new ArrayList
		relateds = new ArrayList
		episodes = new ArrayList

	}
	
	
	override getRating() {
		var List<Assessment> assessments = new ArrayList()
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
	
	
	def getEpisode(EpisodeId id){
		episodes.findFirst[
			elem | elem.id == id
		]
	}
	
	
	def addEpisode(Episode episode) {
		episodes.add(episode)
	}
	
	
	def removeEpisode(Episode episode) {
		episodes.remove(episode)
	}
	
	
	def quantityOfSeasonsSerie(){
		episodes.map[elem |
			elem.season
		].max
	}
	
	def quantityOfEpisodesSereie(){
		episodes.size
	}
	
	def serieHasCategory(Category category){
		categories.exists[elem | elem.name == category.name]
	}
	
	def clasificationIs(Clasification clasification1){
		clasification.name == clasification1.name
	}
	
	def addCategory(Category category) {
		categories.add(category)
	}
	
	def removeCategory(Category category) {
		categories.remove(category)
	}
	
	override title() {
		this.title
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
	
	def hasEpisodeWithId(EpisodeId id1){
		this.episodes.exists[elem | elem.id.equals(id1)]
	}
	
	def episode(EpisodeId id1){
		this.episodes.findFirst[elem | elem.id.equals(id1)]
	}
	
}
