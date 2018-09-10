package ar.edu.unq.TraiFlix.models.id

class MovieId extends GenericContentId {
	
	new() {
		super()
	}
	
	new(Long number) {
		super( number )
	}	
	
	override String prefix() { "MOV" }
	
	override isMovie() { true }
}