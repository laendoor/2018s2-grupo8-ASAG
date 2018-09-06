package ar.edu.unq.TraiFlix.models

import java.util.List
import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class User {
	Integer id;
	String nick;
	String name;
	Date created;
	Date dateOfBirth;
	List<User> friends;
	List<Content> seen;
	List<Content> favorite;
	
	
	new(){
		friends = newArrayList
		seen = newArrayList
		favorite = newArrayList
	}
	
	def seeContent(Content content) {
		seen.add(content)
	}
	
	def moviesSeen() {
		 seen.filter[elem | elem instanceof Movie ]
	}
	
	
}
