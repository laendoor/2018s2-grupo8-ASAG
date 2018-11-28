package ar.edu.unq.TraiFlix.models

import ar.edu.unq.TraiFlix.models.id.ContentId

interface Ratingable {
	
	def Integer getRating();
	
	def ContentId contentId();
		
}