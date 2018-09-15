package ar.edu.unq.TraiFlix.models

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Category {
	
	String name
	
	new(String name){
		this.name = name;
	}
	
	override String toString() {
		name
	}
	
	override boolean equals(Object otherCategory) {
		name.equals( (otherCategory as Category).name )
	}
}
