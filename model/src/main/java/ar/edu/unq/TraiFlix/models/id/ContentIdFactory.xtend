package ar.edu.unq.TraiFlix.models.id

import java.security.InvalidParameterException

class ContentIdFactory {
	
	private new(){}
	
	
	public static def ContentId parse(String id) {
		
		var Long number = Long.parseLong(id.substring(MovieId.prefix.length))
		
		switch( id.substring(0,MovieId.prefix.length).toUpperCase ) {
			case MovieId.prefix: return new MovieId(number)
			case SerieId.prefix: return new SerieId(number)
			case EpisodeId.prefix: return new EpisodeId(number)
		}
		
		throw new InvalidParameterException("Prefijo de ID no valido.")
	}
}