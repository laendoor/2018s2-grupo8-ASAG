package ar.edu.unq.TraiFlix.ui.appModels

import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.TraiFlix.models.Episode

@Observable
@Accessors
class EpisodeManagementAppModel  {
		Episode episode
		
	new(Episode model){
		episode = model
		}
			
	}
	

	