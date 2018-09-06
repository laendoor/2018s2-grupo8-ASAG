package ar.edu.unq.TraiFlix.models

interface RatingableAndRecommenable {
	
	def Integer getRating();
	
	def RatingableAndRecommenable recommend();
}