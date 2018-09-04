package ar.edu.unq.TraiFlix.models


class Episode extends Content {
	
	Integer season;
	Integer EpisodeNumber;
	
	
	def getRating() {
		var Integer sum = 0
		for (Assessment critc : assessments) {
			sum = sum + critc.getValue()
		}
		return sum/assessments.size
	}
	
}
