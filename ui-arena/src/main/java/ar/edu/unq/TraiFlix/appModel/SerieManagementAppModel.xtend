package ar.edu.unq.TraiFlix.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.TraiFlix.models.Serie
import java.util.List
import ar.edu.unq.TraiFlix.models.Category
import ar.edu.unq.TraiFlix.models.Clasification
import ar.edu.unq.TraiFlix.models.Content

@Accessors
@Observable
class SerieManagementAppModel {
	
	Serie serie	
	List<Clasification> availableClassifications
	List<Category> availableCategories
	List<Content> availableContents
	
}