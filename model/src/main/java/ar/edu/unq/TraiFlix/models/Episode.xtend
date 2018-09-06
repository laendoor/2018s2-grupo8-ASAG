package ar.edu.unq.TraiFlix.models

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Episode extends Content implements ContentRatingable{
	
	Serie serie;
	Integer season;
	Integer EpisodeNumber;
		
	override getRating() {
		var Integer sum = 0
		for (Assessment critc : assessments) {
			sum = sum + critc.getValue()
		}
		return sum/assessments.size
	}
	
}
