#include "ros/ros.h"
#include "math.h"
#include <sensor_msgs/Image.h>
#include <iostream>
#include <vector>

// Define a global client that can request services
ros::ServiceClient client;

// This function calls the command_robot service to drive the robot in the specified direction

// This callback function continuously executes and reads the image data
void process_image_callback(const sensor_msgs::Image img){

    int red_pixel = 200;
    int red_height,red_width;
    bool red_pixel_found = false;

    // Loop through each pixel in the image and check if there's a red  one
    int uav_column;
    for(int i = 0; i < img.height; i++){
        for(int j = 0; j < img.width; j++){
            if(img.data[i*img.step + j*3] >= 200 && img.data[i*img.step + j*3 + 1] <= 60 && img.data[i*img.step + j*3 + 2] <= 60 ){
                red_pixel_found = true;
                red_height = i;
                red_width = j;
                break;
            }
        }
    }

    if(red_pixel_found){
      if(img.frame_id=="uav1/bluefox_optflow_optical"){
        //publica topico uav1 encontrou fogo
        uav1_detect.publish("UAV1 detected");
      }
      if(img.frame_id=="uav2/bluefox_optflow_optical"){
        //publica topico uav2 encontrou fogo
        uav2_detect.publish("UAV2 detected");
      }
      if(img.frame_id=="uav3/bluefox_optflow_optical"){
        //publica topico uav3 encontrou fogo
        uav3_detect.publish("UAV3 detected");
      }
      if(img.frame_id=="uav4/bluefox_optflow_optical"){
        //publica topico uav4 encontrou fogo
        uav4_detect.publish("UAV4 detected");
      }
      if(img.frame_id=="uav5/bluefox_optflow_optical"){
        //publica topico uav5 encontrou fogo
        uav5_detect.publish("UAV5 detected");
      }
      if(img.frame_id=="uav6/bluefox_optflow_optical"){
        //publica topico uav6 encontrou fogo
        uav6_detect.publish("UAV6 detected");
      }
        //Tratamento de encontrar pixel vermelho
}
}

int main(int argc, char** argv){

    // Initialize the process_image node and create a handle to it
    ros::init(argc, argv, "process_image");
    ros::NodeHandle n;


    ros::Publisher uav1_detect = n.advertise<std_msgs::String>("uav1_detect", 10);
    ros::Publisher uav2_detect = n.advertise<std_msgs::String>("uav2_detect", 10);
    ros::Publisher uav3_detect = n.advertise<std_msgs::String>("uav3_detect", 10);
    ros::Publisher uav4_detect = n.advertise<std_msgs::String>("uav4_detect", 10);
    ros::Publisher uav5_detect = n.advertise<std_msgs::String>("uav5_detect", 10);
    ros::Publisher uav6_detect = n.advertise<std_msgs::String>("uav6_detect", 10);
    ros::Rate loop_rate(10);
    // Define a client service capable of requesting services from command_robot
    //client = n.serviceClient<ball_chaser::DriveToTarget>("/ball_chaser/command_robot");

    // Subscribe to /camera/rgb/image_raw topic to read the image data inside the process_image_callback function
    ros::Subscriber sub1 = n.subscribe("/uav1/bluefox_optflow/image_raw", 10, process_image_callback);
    ros::Subscriber sub2 = n.subscribe("/uav2/bluefox_optflow/image_raw", 10, process_image_callback);
    ros::Subscriber sub3 = n.subscribe("/uav3/bluefox_optflow/image_raw", 10, process_image_callback);
    ros::Subscriber sub4 = n.subscribe("/uav4/bluefox_optflow/image_raw", 10, process_image_callback);
    ros::Subscriber sub5 = n.subscribe("/uav5/bluefox_optflow/image_raw", 10, process_image_callback);
    ros::Subscriber sub6 = n.subscribe("/uav6/bluefox_optflow/image_raw", 10, process_image_callback);

    // Handle ROS communication events
    ros::spin();

    return 0;
}
