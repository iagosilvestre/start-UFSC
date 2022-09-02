#include "ros/ros.h"
#include "math.h"
#include <sensor_msgs/Image.h>
#include <std_msgs/String.h>
#include <std_msgs/Int8.h>
#include <iostream>
#include <vector>
#include <sstream>
#include <string>

// Define a global client that can request services
ros::ServiceClient client;
const int uavQty=6;
ros::Publisher detect_fire[uavQty];// = n.advertise<std_msgs::String>("detect_fire", 10);
//ros::Publisher landPos[uavQty];
ros::Subscriber subsc[uavQty];
// This function calls the command_robot service to drive the robot in the specified direction

// This callback function continuously executes and reads the image data
void process_image_callback(const sensor_msgs::Image img){

    int red_pixel = 200;
    int red_height,red_width;
    //bool red_pixel_found = false;
    int redQty=0;
    // ros::Publisher wuav5_detect = n.advertise<std_msgs::String>("wuav5_detect", 10);
    ros::Rate loop_rate(10);
    std_msgs::Int8 msg;


    // Loop through each pixel in the image and check if there's a red  one
    int uav_column;
    for(int i = 0; i < img.height; i++){
        for(int j = 0; j < img.width; j++){
            if(img.data[i*img.step + j*3] >= 200 && img.data[i*img.step + j*3 + 1] <= 60 && img.data[i*img.step + j*3 + 2] <= 60 ){
                //red_pixel_found = true;
                redQty+=1;
                red_height = i;
                red_width = j;
                break;
            }
        }
    }
    //std::cout << redQty << "\n";
    for(int i=1;i<=uavQty;i++){
        std::stringstream frameframe,uav2;
        frameframe << "uav" << i <<"/bluefox_optflow_optical";
        uav2 << "UAV"<<i;
        std::string uav = uav2.str();
        std::string frame = frameframe.str();
        if (img.header.frame_id==frame){
          //if(red_pixel_found){
          if(redQty>=50){
          //publica topico uav1 encontrou fogo
          // printf("debug uav 1 detect\n");
            msg.data = i;
            detect_fire[i].publish(msg);
          }
          else{
            msg.data = 0;
            //printf("debug uav 1 no fire\n");
            detect_fire[i].publish(msg);
          }
        }
    }

}
int main(int argc, char** argv){
	// Initialize the process_image node and create a handle to it
	ros::init(argc, argv, "process_image");
	ros::NodeHandle n;

	for(int i=1;i<=uavQty;i++){ //Rotina para criar topicos que contem a posicao de pouso respectiva para cada drone
		std::stringstream ss,dfdf,subsub;
		ss << "landPos_" << i;
		dfdf << "detect_fire_uav" << i;
    subsub << "/uav" << i <<"/bluefox_optflow/image_raw";
		std::string s = ss.str();
		std::string df = dfdf.str();
    std::string sub = subsub.str();
		detect_fire[i] = n.advertise<std_msgs::Int8>(df, 10);
		//landPos[i]=n.advertise<std_msgs::String>(s, 10);
    // Subscribe to /camera/rgb/image_raw topic to read the image data inside the process_image_callback function
    subsc[i] = n.subscribe(sub, 10, process_image_callback);
	}
	ros::spin();
	// }
	return 0;
	}
