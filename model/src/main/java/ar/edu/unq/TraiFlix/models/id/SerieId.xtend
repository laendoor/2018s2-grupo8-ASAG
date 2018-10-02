package ar.edu.unq.TraiFlix.models.id

class SerieId extends GenericContentId {
	
	public static final String prefix = "SER"
	
	new() {
		super()
	}
	
	new(Long number) {
		super(number)
	}
	
	override String prefix() { SerieId.prefix }
	
	override isSerie() { true }
}