package ar.edu.unq.api.TraiFlix_api_rest.domain_rest

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import ar.edu.unq.TraiFlix.models.Relatable

@Accessors
class Searched{
	String category
	List<Relatable> data
}
