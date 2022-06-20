import embedded.mas.bridges.jacamo.EmbeddedAgent;
import embedded.mas.bridges.jacamo.JSONDevice;
import embedded.mas.bridges.jacamo.DefaultDevice;
import embedded.mas.bridges.ros.DefaultRos4EmbeddedMas;

import jason.asSyntax.Atom;

import java.util.ArrayList;

public class DemoEmbeddedAgentROS extends EmbeddedAgent {
	
	private ArrayList<String> nodes = new ArrayList<String>();
	private ArrayList<String> topics = new ArrayList<String>();

	@Override
	public void initAg() {
		super.initAg();
	}

	@Override
	protected void setupSensors() {
	
		
               /*
               //Testing topic-belief conversion. Uncomment and verify Jason mind inspector to check it out.
               
               addTopic("turtle1/cmd_vel", "geometry_msgs/Twist");
               addTopic("turtle1/color_sensor", "turtlesim/Color");
               addTopic("turtle1/pose", "turtlesim/Pose");
               */
               
               /* roscore1 is a connection with a ros master. Instantiate new DefaultRos4EmbeddedMas connect the agent with more ros masters*/
		DefaultRos4EmbeddedMas roscore1 = new DefaultRos4EmbeddedMas("ws://localhost:9090",nodes, topics);		
   	        MyRosMaster rosMaster = new MyRosMaster(new Atom("roscore1"), roscore1);
		this.addSensor(rosMaster);
		
	}



	private void addTopic(String topicName, String topicType){
	   nodes.add(topicName); 
	   topics.add(topicType);
	}
}	
