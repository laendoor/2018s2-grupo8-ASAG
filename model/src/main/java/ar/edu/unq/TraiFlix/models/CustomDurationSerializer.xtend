package ar.edu.unq.TraiFlix.models

import com.fasterxml.jackson.databind.ser.std.StdSerializer
import org.joda.time.Duration
import com.fasterxml.jackson.core.JsonGenerator
import com.fasterxml.jackson.databind.SerializerProvider
import java.io.IOException
import org.joda.time.format.PeriodFormatterBuilder
import org.joda.time.PeriodType

public class CustomDurationSerializer extends StdSerializer<Duration>{

    new(){
        this(null)
    }

    new(Class<Duration> t) {
        super(t);
    }
    
    override serialize(Duration duration, JsonGenerator jsonGenerator,
                          SerializerProvider serializerProvider) throws IOException {
		var formatter = new PeriodFormatterBuilder()
		        .appendHours()
		        .appendSuffix("h ")
		        .appendMinutes()
		        .appendSuffix("m")
		        .toFormatter()
		
		var period = duration.toPeriod();
		var dayTimePeriod = period.normalizedStandard(PeriodType.dayTime());
		
        jsonGenerator.writeString( formatter.print(dayTimePeriod) );
    }

}