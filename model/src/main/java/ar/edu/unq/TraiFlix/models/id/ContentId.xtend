package ar.edu.unq.TraiFlix.models.id

interface ContentId {

	def String value()
	

	def boolean isMovie()	
	def boolean isSerie()	
	def boolean isEpisode()
	
}