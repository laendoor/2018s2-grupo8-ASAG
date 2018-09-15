package ar.edu.unq.TraiFlix.models

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Clasification {
	
	String name
	
	new(String name){
		this.name = name
	}
	
	override String toString() {
		name
	}
	
	override boolean equals(Object otherClassification) {
		name.equals( (otherClassification as Clasification).name )
	}
}
