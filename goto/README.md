# Example of ROS-Based agent

## Scenario

This example illustrates a randomly moving turtle agent. The moviment is commanded through a ROS service.



## Requirements
1. ROS (recommended [ROS Noetic](http://wiki.ros.org/noetic))
2. [Rosbridge](http://wiki.ros.org/rosbridge_suite/Tutorials/RunningRosbridge)
3. [Turtlesim](http://wiki.ros.org/turtlesim)


## Running the example

1. Start the roscore
```
roscore
```

2. Launch the bridge between ROS and Java
```
roslaunch rosbridge_server rosbridge_websocket.launch
```

3. Launch the turtlesim simulator
```
rosrun turtlesim turtlesim_node
```

4. Launch the JaCaMo application:

Linux:
```
./gradlew run
```
Windows:
```
gradlew run 
```

## Some notes on the ROS-Jason integration
This integration is part of a broader integration framework available [here](https://github.com/embedded-mas/embedded-mas)

Agents are configured in the jcm file (in this example, [turtle.jcm](https://github.com/embedded-mas/ros-devs/blob/main/examples/services/turtle.jcm)). 
Agents extend the class [`EmbeddedAgent`](https://github.com/embedded-mas/embedded-mas/blob/master/src/main/java/embedded/mas/bridges/jacamo/EmbeddedAgent.java), that extends a [Jason Agent](https://github.com/jason-lang/jason/blob/master/src/main/java/jason/asSemantics/Agent.java). In the example, this extension is implemented in the class [/src/main/java/DemoEmbeddedAgentROS.java](https://github.com/embedded-mas/ros-devs/blob/main/examples/services/src/main/java/DemoEmbeddedAgentROS.java). Each `EmbeddedAgent` has a method `setupSensors()` to define where the perceptions come from.

An agent can connect with multiple ROS core. Additional connectons should be also be defined in [/src/main/java/DemoEmbeddedAgentROS.java](https://github.com/embedded-mas/ros-devs/blob/main/examples/services/src/main/java/DemoEmbeddedAgentROS.java) if necessary (it is not the case in this example). Besides, an agent can connect with non-ros devices (not shown in this example). 


The agents use the [`defaultEmbeddedInternalAction`](https://github.com/embedded-mas/embedded-mas/blob/master/src/main/java/embedded/mas/bridges/jacamo/defaultEmbeddedInternalAction.java) to act upon external devices (requesting ROS services in this example). This internal action is decoupled of any external device or ROS topic. They are supposed to be translated to service requests by the interface between the agent and the proper physical device. I this example, this is done in [/src/main/java/MyRosMaster.java](https://github.com/embedded-mas/ros-devs/blob/main/examples/services/src/main/java/MyRosMaster.java).

