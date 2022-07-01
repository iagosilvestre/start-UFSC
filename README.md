
# start-UFSC

This repo contains the start scripts for SARC-Barinet competition - UFSC team, its implementation of Jason BDI Agents and its fire detection program

* Start Scripts : ./start.sh    and   ./basicstart.sh
* Jason BDI Agents : In /uav_agents
* Fire Detection Program : In /detectRed/build/

Requirements:
* Java >=15 (For Jason BDI Agents)
* [Multi-robot Systems Group UAV system](https://github.com/ctu-mrs/mrs_uav_system)
* ROS (Noetic Recommended)
* Rosbridge
It is recommended that you clone this repo inside the [sarc_environment](https://github.com/2nd-sarc-barinet-aerospace-competition/sarc_environment), 
before runing the scripts you should copy the world files into the mrs_gazebo_common_resources/worlds/ path.

    cp SARC.world       /home/$USER/mrs_workspace/src/simulation/ros_packages/mrs_gazebo_common_resources/worlds/

    cp basic.world       /home/$USER/mrs_workspace/src/simulation/ros_packages/mrs_gazebo_common_resources/worlds/

And before running the Fire detection program and Jason BDI Agents, you must change UNIX permissions:
    cd detectRed/build
    chmod +x detect_redPixel_image
You can check this [video](https://youtu.be/-bLGymzZwzI) for a simulation using the basicstart script.

To execute the SARC environment simulation, you must run the ./start.sh script

    ./start.sh

