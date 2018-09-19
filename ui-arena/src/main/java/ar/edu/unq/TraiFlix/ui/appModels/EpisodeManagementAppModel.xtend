package ar.edu.unq.TraiFlix.ui.appModels

import ar.edu.unq.TraiFlix.models.Serie
import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.TraiFlix.models.Episode
import org.joda.time.DateTime

@Observable
@Accessors
class EpisodeManagementAppModel  {
		Episode episode
		
	new(Episode model){
		episode = model
		}
			
	}
	

	