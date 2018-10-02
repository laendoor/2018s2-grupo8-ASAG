package ar.edu.unq.TraiFlix.models.id

class MovieId extends GenericContentId {
	
	public static final String prefix = "MOV"
	
	new() {
		super()
	}
	
	new(Long number) {
		super( number )
	}	
	
	override def String prefix() { MovieId.prefix }
	
	override isMovie() { true }
}