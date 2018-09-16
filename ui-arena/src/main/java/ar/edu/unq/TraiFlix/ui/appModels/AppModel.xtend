package ar.edu.unq.TraiFlix.ui.appModels

import ar.edu.unq.TraiFlix.models.TraiFlix

import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.TraiFlix.models.bootstrap.Bootstrap

@Accessors
@Observable
abstract class AppModel {
	
	TraiFlix model

	new(TraiFlix model){
		this.model = model
		var boot = Bootstrap.instance
		this.model.movies = boot.movies
		this.model.series = boot.series
		this.model.categories = boot.categories
		this.model.classifications = boot.clasifications
	}
	
}