package ar.edu.unq.TraiFlix.models

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Category {
	
	String name
	
	new(String name){
		this.name = name;
	}
	
}
