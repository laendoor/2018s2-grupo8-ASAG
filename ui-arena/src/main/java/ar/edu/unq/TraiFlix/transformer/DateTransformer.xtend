package ar.edu.unq.TraiFlix.transformer

import org.uqbar.arena.bindings.ValueTransformer
import java.util.Date
import java.text.SimpleDateFormat

class DateTransformer implements ValueTransformer<Date, String>{
	
	override getModelType() {
		Date
	}
	
	override getViewType() {
		String
	}
	
	override modelToView(Date valueFromModel) {
		val sourceFormat = new SimpleDateFormat("dd/MM/yyyy");
		sourceFormat.format(valueFromModel)
	}
	
	override viewToModel(String valueFromView) {
		val sourceFormat = new SimpleDateFormat("dd/MM/yyyy");
		sourceFormat.parse(valueFromView);
	}
	
}