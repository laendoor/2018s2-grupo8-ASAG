package ar.edu.unq.TraiFlix.ui.runnable

import ar.edu.unq.TraiFlix.models.Movie
import ar.edu.unq.TraiFlix.models.Serie
import java.util.ArrayList
import java.util.List

class DummyData {

	
	def static crearMovies() {
		var List<Movie> res = new ArrayList
		res.add(new Movie => [
			title = "Las tortugas pinja"
		] ) 
		return res
		}
//	def crearSerie() {
//		var res = newArrayList
//		res.add(new Serie=> [
//			title = "et"
//			
//		]) 
//		return res
//		}
	
	
}
