package ar.edu.unq.TraiFlix.models

import java.util.List
import java.util.Date
import java.util.Calendar
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.TraiFlix.models.id.ContentId
import java.util.ArrayList

@Accessors
abstract class Content {
	
	 ContentId id
	 String title
	 Date release
	 List<Assessment> assessments
	 Calendar duration
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
	 
	 
	 
}
