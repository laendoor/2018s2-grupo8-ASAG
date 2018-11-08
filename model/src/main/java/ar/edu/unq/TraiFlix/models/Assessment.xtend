package ar.edu.unq.TraiFlix.models

import org.eclipse.xtend.lib.annotations.Accessors
import com.fasterxml.jackson.annotation.JsonIgnore

@Accessors
class Assessment {
	@JsonIgnore
	User user
	Integer value
	String observation

	new(User cli, Integer valoration, String critic) {
		user = cli
		value = valoration
		observation = critic
	}

}
