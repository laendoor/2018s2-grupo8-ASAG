package ar.edu.unq.api.TraiFlix_api_rest.domain_rest

import java.util.List
import ar.edu.unq.TraiFlix.models.Category
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class NamesCategories {
	
	List<String> names
	
	def void setNamesToShow(List<Category> categories){
		names = categories.map[ c | c.name].toList()
	}
	
}