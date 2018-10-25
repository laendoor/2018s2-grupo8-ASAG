package ar.edu.unq.TraiFlix.models

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime

@Accessors
class User {
	Integer id;
	String nick;
	String name;
	DateTime created;
	DateTime dateOfBirth;
	List<User> friends;
	List<Content> watched;
	List<Favourable> favourites;
	List<Ratingable> recommended
	
	
	
	new(){
		friends = new ArrayList
		watched = new ArrayList
		favourites = new ArrayList
		recommended = new ArrayList
	}
	
	def addWatchedContent(Content content) {
		watched.add(content)
	}
	
	def removeWatchedContent(Content content) {
		watched.remove(content)
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
	
	def removeWatchedSerie(Serie serie) {
		watched.filter[ elem | elem.id.isEpisode && (elem as Episode).serie.id == serie.id ]
			.forEach[ episode | this.removeWatchedContent(episode) ]
	}
	
	def addFriend(User user) {
		friends.add(user)
	}
	
	def isFriend(User user) {
		friends.exists[ elem |
			elem.id == user.id
		]
	}
	
	def addFavourite(Favourable content) {
		this.favourites.add(content)
	}
	
	def removeFavourite(Favourable content) {
		this.favourites.remove(content)
	}
	
	
}
