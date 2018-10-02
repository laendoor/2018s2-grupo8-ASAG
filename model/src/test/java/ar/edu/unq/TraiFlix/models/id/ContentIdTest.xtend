package ar.edu.unq.TraiFlix.models.id

import org.junit.Test
import static org.junit.Assert.*
import org.junit.Before
import java.security.InvalidParameterException

class ContentIdTest {
	
	@Before
	def void setUp() {			
	}
	
	@Test
	def synchronized void createAutoGeneratedMovieId() {
		var id = new MovieId
		
		assertEquals( String.format("MOV%010d", MovieId.NextNumber-1), id.value )
	}
	
	@Test
	def synchronized void createMovieIdWithForcedValue() {
		var id1 = new MovieId(70l)
		
		// se genera el id solicitado...		
		assertEquals( "MOV0000000070", id1.value )
		
		//una solicitud posterior de autogenerado asigna el numero siguiente...  
		var id2 = new MovieId
		assertEquals( "MOV0000000071", id2.value )
	}
	
	@Test
	def synchronized void createAutoGeneratedSerieId() {
		var id = new SerieId
		
		assertEquals( String.format("SER%010d", SerieId.NextNumber-1), id.value )
	}
	
	@Test
	def synchronized void createSerieIdWithForcedValue() {
		var id1 = new SerieId(20l)
		
		// se genera el id solicitado...		
		assertEquals( "SER0000000020", id1.value )
	}
	
	@Test
	def synchronized void createAutoGeneratedEpisodeId() {
		var id = new EpisodeId
		
		assertEquals( String.format("EPI%010d", EpisodeId.NextNumber-1), id.value )
	}
	
	@Test
	def synchronized void createEpisodeIdWithForcedValue() {
		var id1 = new EpisodeId(30l)
		
		// se genera el id solicitado...		
		assertEquals( "EPI0000000030", id1.value )
	}
	
	@Test
	def movieIdTypes() {
		var id = new MovieId
		
		assertTrue( id.isMovie )
		assertFalse( id.isSerie )
		assertFalse( id.isEpisode )
	}
	
	@Test
	def serieIdTypes() {
		var id = new SerieId
		
		assertTrue( id.isSerie )
		assertFalse( id.isMovie )
		assertFalse( id.isEpisode )
	}
	
	@Test
	def episodeIdTypes() {
		var id = new EpisodeId
		
		assertTrue( id.isEpisode )
		assertFalse( id.isSerie )
		assertFalse( id.isMovie )
	}
	
	@Test
	def movieIdFromFactory() {
		assertTrue( ContentIdFactory.parse("MOV0000000001").isMovie() )
	}
	
	@Test
	def serieIdFromFactory() {
		assertTrue( ContentIdFactory.parse("SER0000000001").isSerie() )
	}
	
	@Test
	def episodeIdFromFactory() {
		assertTrue( ContentIdFactory.parse("EPI0000000001").isEpisode() )
	}
	
	@Test( expected = InvalidParameterException )
	def void unknownTypeIdFromFactory() {
		ContentIdFactory.parse("KKK0000000001")
	}
}