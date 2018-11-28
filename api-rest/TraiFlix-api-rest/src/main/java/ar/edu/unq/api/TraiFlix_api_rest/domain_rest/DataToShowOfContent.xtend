package ar.edu.unq.api.TraiFlix_api_rest.domain_rest

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.TraiFlix.models.id.ContentId
import java.util.Date
import com.fasterxml.jackson.annotation.JsonFormat

@Accessors
class DataToShowOfContent {
	ContentId id
	String title
	String link
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy")
	Date release
	
	new(ContentId id, String title, String link, Date release){
		this.id = id;
		this.title = title;
		this.link = link;
		this.release = release;
	}
}