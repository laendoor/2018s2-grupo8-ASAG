package ar.edu.unq.TraiFlix.models

import java.util.List
import java.util.Date
import java.util.Calendar
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.TraiFlix.models.id.ContentId
import java.util.ArrayList
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
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
	 	assessments = new ArrayList()
	 	directors = new ArrayList()
	 	actors = new ArrayList()
	 } 
	 
	 def addAssessment(Assessment critic){
	 	assessments.add(critic)
	 }
	 
	 
	 
}
