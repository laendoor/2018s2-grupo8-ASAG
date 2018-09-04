package ar.edu.unq.TraiFlix.models

import java.util.List
import java.util.Date
import java.util.Calendar
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Content {
	
	 Integer id
	 String title
	 Date release
	 List<Assessment> assessments
	 Calendar duration
	 List<Director> directors
	 List<Actor> actors
	 String link
	 
	 new(){
	 	assessments = newArrayList
	 	directors = newArrayList
	 	actors = newArrayList
	 } 
	 
	 def addAssessment(Assessment critic){
	 	assessments.add(critic)
	 }
	 
	 
}
