package ar.edu.unq.api.TraiFlix_api_rest.runnable

import org.uqbar.xtrest.api.XTRest
import ar.edu.unq.TraiFlix.models.TraiFlix
import ar.edu.unq.api.TraiFlix_api_rest.RestfulServer
import ar.edu.unq.api.TraiFlix_api_rest.bootstrap.Bootstrap

class App {
	
	def static void main(String[] args) {
		val traiflix = new TraiFlix();
		Bootstrap.instance.load(traiflix) 		
		
		
        XTRest.startInstance(9003, new RestfulServer(traiflix))
    }
}