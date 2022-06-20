import embedded.mas.bridges.jacamo.EmbeddedAgent;
import embedded.mas.bridges.jacamo.JSONDevice;
import embedded.mas.bridges.jacamo.DefaultDevice;
import embedded.mas.bridges.ros.DefaultRos4EmbeddedMas;

import jason.asSyntax.Atom;

import java.util.ArrayList;

public class DemoEmbeddedAgentROS extends EmbeddedAgent {
	
	private ArrayList<String> topicNames = new ArrayList<String>();
	private ArrayList<String> topicTypes = new ArrayList<String>();

	@Override
	public void initAg() {
		super.initAg();
	}

	@Override
	protected void setupSensors() {
	
		
               
               /* Defining topics to be converted to beliefs. 
                  ========================================== */
               /* turtle1/pose is a ros topic composed of 5 fields: x, y, theta, linear_velocity, and angular_velocity (type rostopic echo /turtle1/pose in a terminal to check it out).
                  The agent perceives changes in the topic values and changes its belief with respect to them. 
                  The corresponding belief is turtle1_pose(x(X),y(Y),theta(T),linear_velocity(L),angular_velocity(V)), where X,Y,T,L and V are float values (see the Jason mind inspector to check it out.                 	
               */
               addTopic("turtle1/pose", "turtlesim/Pose"); 
               
               
               /* turtle1/color_sensor is a ros topic composed of 3 fields: r, g, and b.
                  The corresponding belief is turtle1_color_sensor(r(R),g(G),b(B)), where R, G and B are integer values.
               */
               addTopic("turtle1/color_sensor", "turtlesim/Color");
               
               
               /* roscore1 is a connection with a ros master. Instantiate new DefaultRos4EmbeddedMas connect the agent with more ros masters*/
		DefaultRos4EmbeddedMas roscore1 = new DefaultRos4EmbeddedMas("ws://localhost:9090",topicNames, topicTypes);		
   	        MyRosMaster rosMaster = new MyRosMaster(new Atom("roscore1"), roscore1);
		this.addSensor(rosMaster);
		
	}



	private void addTopic(String topicName, String topicType){
	   topicNames.add(topicName); 
	   topicTypes.add(topicType);
	}
}	
