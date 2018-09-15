package ar.edu.unq.TraiFlix.models

interface Relatable {
	def String title()
	
	def String contentType()
	
	def void addRelated(Relatable related)
	
	def void removeRelated(Relatable related)
}



	