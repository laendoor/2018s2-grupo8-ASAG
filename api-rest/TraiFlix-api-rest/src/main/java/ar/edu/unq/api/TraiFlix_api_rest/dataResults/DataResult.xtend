package ar.edu.unq.api.TraiFlix_api_rest.dataResults

import com.fasterxml.jackson.annotation.JsonProperty

class DataResult {
	private Object data
	
	new(Object data) {
		this.data = data	
	}
	
	@JsonProperty
	def data() {
		this.data
	} 
}
