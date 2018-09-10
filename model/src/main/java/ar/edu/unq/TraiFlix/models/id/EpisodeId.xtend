package ar.edu.unq.TraiFlix.models.id

class EpisodeId extends GenericContentId {
	
	new() {
		super()
	}
	
	new(Long number) {
		super( number )
	}	
	
	override String prefix() { "EPI" }
	
	override isEpisode() { true }
}