package ar.edu.unq.api.TraiFlix_api_rest.domain_rest

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class UserToAndFrom{
	String userFrom
	String userTo
	
	new(){}
	
	new(String user1, String user2){
		userFrom = user1
		userTo = user2
	}
}