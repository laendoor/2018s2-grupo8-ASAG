package ar.edu.unq.TraiFlix.filters

import org.uqbar.arena.filters.TextFilter
import org.uqbar.arena.widgets.TextInputEvent
import java.util.ArrayList

class LinkTextFilter implements TextFilter{
	
	override accept(TextInputEvent event) {
		    val expected = new ArrayList(
		    	#["(?:\\.[a-zA-Z0-9-]+)*)", "[a-zA-Z0-9-]+)"]
		    )
           	val regex = expected.reverse.fold("")[result, element| '''(«element»«result»)?''']
                
            event.potentialTextResult.matches(regex)
	}
	
}