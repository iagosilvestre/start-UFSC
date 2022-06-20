/**

**/

import java.util.Collection;

import embedded.mas.bridges.jacamo.JSONWatcherDevice;
import embedded.mas.bridges.jacamo.IPhysicalInterface;
import embedded.mas.bridges.jacamo.DefaultDevice;
import embedded.mas.bridges.jacamo.LiteralDevice;
import embedded.mas.bridges.ros.DefaultRos4EmbeddedMas;
import jason.asSyntax.Atom;
import jason.asSyntax.Literal;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;



public class MyRosMaster extends LiteralDevice {

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
		if(actionName.equals("takeoff")){ //handling the action "takeoff"
		   try{		    
		    JsonNode params = new ObjectMapper().readTree("{}"); //build a JSON with the service parameters		    
		    ((DefaultRos4EmbeddedMas) microcontroller).serviceRequest("/uav"+args[0]+"/uav_manager/takeoff", params); //send the service request		   
		   } catch (JsonMappingException e) {
			e.printStackTrace();
		   } catch (JsonProcessingException e) {
			e.printStackTrace();
		   }
		}
		return true;
	public boolean execEmbeddedActionB(String actionName, Object[] args) {		
		if(actionName.equals("teste")){ //handling the action "move_turtle"

		   ServiceParameters p = new ServiceParameters(); //p is the set of parameters of the requested service
		   p.addParameter("arrayOfFloatParameter", new Float[]{(Float)args[0], (Float)args[1]} ); //adding a new parameter which is an array of double		   
		   serviceRequest("/uav"+args[0]+"/control_manager/goto",p); 
		   return true;
		}
		return false;
	}
	}
	
}
