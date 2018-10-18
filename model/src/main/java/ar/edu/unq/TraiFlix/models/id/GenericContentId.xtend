package ar.edu.unq.TraiFlix.models.id

import java.util.concurrent.atomic.AtomicLong
import com.fasterxml.jackson.annotation.JsonValue

abstract class GenericContentId implements ContentId, Comparable<ContentId> {	
	
	private static AtomicLong nextNumber = new AtomicLong(1)
	private Long number
	private String value
	
	new() {
		this( nextNumber.getAndIncrement() )
	}
	
	new( Long number ) {
		this.number = number
		synchronized(this) {
			if( number > nextNumber.longValue )
				nextNumber.set(number+1)
		}
		this.value = prefix() + String.format("%010d", number )
	}
	
	static def Long NextNumber() {
		nextNumber.get()
	}
	
	protected abstract def String prefix();
		
	override def String value() {
		this.value
	}
	
	override String toString() {
		this.value
	}
	
	override boolean equals(Object object) {
		value.equals( (object as ContentId).value )		
	}	
	
	override int compareTo(ContentId otherId) {
        this.value.compareTo(otherId.value)
    }
		
	override def boolean isMovie(){ false }
	override def boolean isSerie(){ false }
	override def boolean isEpisode(){ false }
	
	@JsonValue
    protected def toJson() {
        this.value
    }	
	
}
