package ar.edu.unq.TraiFlix.models

import ar.edu.unq.TraiFlix.models.id.ContentId
import java.util.ArrayList
import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.format.PeriodFormatterBuilder
import org.uqbar.commons.model.annotations.Observable
import org.joda.time.Duration

@Accessors
@Observable
abstract class Content {
	
	 ContentId id
	 String title
	 Date release
	 List<Assessment> assessments
	 Duration duration
	 String directors
	 String actors
	 String link
	 
	 new(){
	 	this.assessments = new ArrayList
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
		
		 val String[] str =  daysHoursMinutes.print(duration.toPeriod).split(" ")
		 if(str.length == 5){
 		 	this.addCero(str.get(0))+":"+str.get(3)
 		 }
 		 else{
 		 	this.stringSimpleMinute(str.get(0))
 		 }
	 }
	 
	 def stringSimpleMinute(String string){
	 	this.addCero(string)+":00"
	 	
	 }
	 

	def addCero(String str){
		if(str.length == 1){
			"0"+str
		}
		else{
			str
		}
}
	 
}
