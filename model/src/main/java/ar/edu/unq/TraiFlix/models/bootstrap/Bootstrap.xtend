package ar.edu.unq.TraiFlix.models.bootstrap

import ar.edu.unq.TraiFlix.models.id.ContentId
import java.util.List

interface Bootstrap<T> {
	
	def void add(T instanceT)
	
	def void delete(T intanceT)
	
	def T find(ContentId keyT)
	
	def List<T> load()
	
}