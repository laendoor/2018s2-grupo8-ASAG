package ar.edu.unq.TraiFlix.models.id

class EpisodeId extends GenericContentId {
	
	public static final String prefix = "EPI"
	
	new() {
		super()
	}
	
	new(Long number) {
		super( number )
	}	
	
	override String prefix() { EpisodeId.prefix }
	
	override isEpisode() { true }
}