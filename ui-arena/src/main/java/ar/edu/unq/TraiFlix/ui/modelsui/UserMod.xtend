package ar.edu.unq.TraiFlix.ui.modelsui

import org.joda.time.DateTime
import org.joda.time.LocalDate
import org.joda.time.Period
import org.joda.time.format.DateTimeFormat
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class UserMod {
	String name
	String nick
	DateTime birtday
	DateTime registration
	
	
	def registrationString(){
		DateTimeFormat.forPattern("yyyy-MM-dd").print(registration);
		
	}
	def age(){
		Period.fieldDifference(birtday.toLocalDate, LocalDate.now).getYears();
	}
	
	
	
}