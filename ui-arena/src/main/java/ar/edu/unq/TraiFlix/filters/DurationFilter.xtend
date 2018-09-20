package ar.edu.unq.TraiFlix.filters

import org.uqbar.arena.filters.TextFilter
import org.uqbar.arena.widgets.TextInputEvent

class DurationFilter implements TextFilter {
	
	override accept(TextInputEvent event) {
		event.potentialTextResult.matches("^\\d+:?([1-5]?[0-9]?|0[0-9])$")
	}
	

}