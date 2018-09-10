package ar.edu.unq.TraiFlix.models.id

class SerieId extends GenericContentId {
	
	new() {
		super()
	}
	
	new(Long number) {
		super(number)
	}
	
	override String prefix() { "SER" }
	
	override isSerie() { true }
}