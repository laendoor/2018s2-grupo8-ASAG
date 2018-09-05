package ar.edu.unq.TraiFlix.models


class Episode extends Content implements ContentRatingable{
	
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
