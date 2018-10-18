package ar.edu.unq.TraiFlix.models

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.TraiFlix.models.id.EpisodeId
import org.uqbar.commons.model.annotations.Observable
import com.fasterxml.jackson.annotation.JsonIgnore

@Accessors
@Observable
class Episode extends Content implements Ratingable{
	
	@JsonIgnore
	Serie serie;
	Integer season;
	Integer episodeNumber;
	
	new(){
		super.id = new EpisodeId();
	}
	
	
	new (Serie serie){
		this()
		this.serie =serie
	}
	
	new( Serie serie, Integer season, Integer episodeNumber ){
		this()
		this.serie = serie
		this.season = season
		this.episodeNumber = episodeNumber
	}
	
	override def EpisodeId getId() {super.id as EpisodeId}
	
	override getRating() {
		var Integer sum = 0
		for (Assessment critc : assessments) {
			sum = sum + critc.getValue()
		}
		if(sum != 0){
			return sum/assessments.size 
		}
		return 0
	}
	
}
		
	
	

