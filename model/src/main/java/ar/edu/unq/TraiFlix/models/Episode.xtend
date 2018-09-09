package ar.edu.unq.TraiFlix.models

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.TraiFlix.models.id.EpisodeId

@Accessors
class Episode extends Content implements RatingableAndRecommenable{
	
	Serie serie;
	Integer season;
	Integer EpisodeNumber;
	
	override def EpisodeId getId() {super.id as EpisodeId}
	
	override getRating() {
		var Integer sum = 0
		for (Assessment critc : assessments) {
			sum = sum + critc.getValue()
		}
		return sum/assessments.size
	}
	
	override isAMovie() {
		false
	}
	
	override isAEpisode() {
		true
	}
	
	override recommend() {
		serie
	}
	
	
	
}
