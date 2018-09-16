package ar.edu.unq.TraiFlix.ui.appModels

import java.util.List
import ar.edu.unq.TraiFlix.models.Relatable
import ar.edu.unq.TraiFlix.models.Clasification
import ar.edu.unq.TraiFlix.models.Category

interface ContentManagementAppModel {
	
	def List<Clasification> availableClassifications();
		
	def List<Relatable> availableRelatableContents();
		
	def List<Category> selectablesCategories();
	
	def void addSelectedCategory();
	
	def void removeSelectedAssignedCategory();
	
	def void removeSelectedRelatedContent();

}