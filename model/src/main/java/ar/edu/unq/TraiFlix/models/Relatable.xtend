package ar.edu.unq.TraiFlix.models

import java.util.List

interface Relatable {
	def String title()
	
	def String contentType()
	
	def void addRelated(Relatable related)
	
	def void removeRelated(Relatable related)
	
	def List<Relatable> getRelateds()
}



	