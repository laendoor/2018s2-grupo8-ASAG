package ar.edu.unq.TraiFlix.models

import java.util.List
import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

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
	List<Ratingable> recommended
	
	
	
	new(){
		friends = new ArrayList
		watched = new ArrayList
		favorite = new ArrayList
		recommended = new ArrayList
	}
	
	def seeContent(Content content) {
		watched.add(content)
	}
	
	def watchedMovies() {
		 watched.filter[elem | 
		 	elem.id.isMovie
		 ]
	}
	
	def watchedSeries() {	
		watched.filter[ elem | elem.id.isEpisode ]
				.map[ elem | (elem as Episode).serie ]
				.toSet;
	}
	
	def watchedAndFinishedSeries() {
		watchedSeries().filter[ elem | watched.containsAll(elem.episodes) ].toList
	}
	
	def isFriend(User user) {
		friends.exists[ elem |
			elem.id == user.id
		]
	}
	
	
	
}
