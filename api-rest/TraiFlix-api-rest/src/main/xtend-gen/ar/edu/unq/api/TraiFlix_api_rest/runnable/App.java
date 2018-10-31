package ar.edu.unq.api.TraiFlix_api_rest.runnable;

import ar.edu.unq.TraiFlix.models.TraiFlix;
import ar.edu.unq.api.TraiFlix_api_rest.RestfulServer;
import ar.edu.unq.api.TraiFlix_api_rest.bootstrap.Bootstrap;
import org.uqbar.xtrest.api.XTRest;

@SuppressWarnings("all")
public class App {
  public static void main(final String[] args) {
    final TraiFlix traiflix = new TraiFlix();
    Bootstrap.getInstance().load(traiflix);
    RestfulServer _restfulServer = new RestfulServer(traiflix);
    XTRest.startInstance(9003, _restfulServer);
  }
}
