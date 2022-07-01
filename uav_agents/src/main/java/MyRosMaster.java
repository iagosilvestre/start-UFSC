import embedded.mas.bridges.ros.RosMaster;
import embedded.mas.bridges.ros.DefaultRos4EmbeddedMas;
import embedded.mas.bridges.ros.ServiceParameters;
import embedded.mas.bridges.ros.ServiceParam;

import jason.asSyntax.Atom;
import jason.asSyntax.Term;
import jason.asSyntax.ListTerm;
import static jason.asSyntax.ASSyntax.parseList;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class MyRosMaster extends RosMaster {

	public MyRosMaster(Atom id, DefaultRos4EmbeddedMas microcontroller) {

		super(id, microcontroller);

	}

        /* Translate actions into ros topic publications and service requests.
           args:
             - for topic publications: 0. Topic name
                                       1. Topic type
                                       2. Topic value
                                        
             - for service requests: service arguments are the args elements. 
                                     They must be properly handled in the execEmbeddedAction function                                           
             
           obs: args are Strings. The action arguments are send to the ros as strings.
                Type conversions are handled in the "microcontroller" (DefaultRos4EmbeddedMas)       
        */
	@Override
	public boolean execEmbeddedAction(String actionName, Object[] args) {

		if(actionName.equals("goto")){ 
			ServiceParameters p = new ServiceParameters(); //p is the set of parameters of the requested service		  
		    p.addParameter("goal", new Float[]{Float.parseFloat(args[1].toString()), Float.parseFloat(args[2].toString()), Float.parseFloat(args[3].toString()), Float.parseFloat(args[4].toString())} ); //adding a new parameter which is an array of double		   
			serviceRequest("/uav"+args[0]+"/control_manager/goto", p); 
			return true;

		}

		else if(actionName.equals("land")){ //handling the action "move_turtle"

			ServiceParameters p = new ServiceParameters(); 
			serviceRequest("/uav"+args[0]+"/uav_manager/land", p); //send the service request		   
			return true;

		}

		return false;

	}
	
}
