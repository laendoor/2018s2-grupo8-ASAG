package ar.edu.unq.TraiFlix.transformer

import org.uqbar.arena.bindings.ValueTransformer
import org.joda.time.Duration


class DurationTransformer implements ValueTransformer<Duration, String> {
	
	override getModelType() {
		Duration
	}
	
	override getViewType() {
		String
	}
	
	override modelToView(Duration valueFromModel) {
		val str = valueFromModel.toString    
		var String[] value = str.split(" ")
		if(value.get(0).length>1){
			value.get(0)+":"+value.get(3)
		}
		else{
			"0"+value.get(0)+":"+value.get(3)
		}
		
	}
	
	override viewToModel(String valueFromView) {
		var String[] value = valueFromView.split(":")

		val min = Integer.parseInt(value.get(0))
		val sec = Integer.parseInt(value.get(1)) 
		Duration.standardMinutes(min).plus(Duration.standardSeconds(sec))
	}

	
}