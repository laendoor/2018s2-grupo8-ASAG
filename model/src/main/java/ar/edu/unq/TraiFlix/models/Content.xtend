package ar.edu.unq.TraiFlix.models

import ar.edu.unq.TraiFlix.models.id.ContentId
import java.util.ArrayList
import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.Period
import org.joda.time.format.PeriodFormatterBuilder
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
abstract class Content {
	
	 ContentId id
	 String title
	 Date release
	 List<Assessment> assessments
	 Period duration
	 List<Director> directors
	 List<Actor> actors
	 String link
	 
	 new(){
	 	this.assessments = new ArrayList
	 	this.directors = new ArrayList
	 	this.actors = new ArrayList
	 } 
	 
	 def addAssessment(Assessment critic){
	 	assessments.add(critic)
	 }	 
	 
	 def timeToString(){
	 	val daysHoursMinutes = new PeriodFormatterBuilder()
	 		.appendHours()
		    .appendSuffix(" Hour", " Horas")
		    .appendSeparator(", ")
		    .appendMinutes()
		    .appendSuffix(" minute", " Minutos")
		    .appendSeparator(" y ")
		    .appendSeconds()
		    .appendSuffix(" second", " Segundos")
		    .toFormatter();
		
		 daysHoursMinutes.print(duration);
	 }
	 
}
