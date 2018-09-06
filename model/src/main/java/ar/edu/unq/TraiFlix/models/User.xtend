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
	List<Content> watched;
	List<Content> favorite;
	
	
	new(){
		friends = newArrayList
		watched = newArrayList
		favorite = newArrayList
	}
	
	def seeContent(Content content) {
		watched.add(content)
	}
	
	def watchedMovies() {
		 watched.filter[elem | elem instanceof Movie ]
	}
	
	
}
