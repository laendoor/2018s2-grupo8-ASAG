package ar.edu.unq.TraiFlix.filters

import org.uqbar.arena.filters.TextFilter
import org.uqbar.arena.widgets.TextInputEvent

class DurationFilter implements TextFilter {
	
	override accept(TextInputEvent event) {
		event.potentialTextResult.matches("^\\d+:?\\d{0,2}?$")
	}
	

}