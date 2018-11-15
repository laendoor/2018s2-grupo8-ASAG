package ar.edu.unq.api.TraiFlix_api_rest.domain_rest

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import ar.edu.unq.TraiFlix.models.Ratingable

@Accessors
class CategoryToShow{
	String category
	List<Ratingable> data
}