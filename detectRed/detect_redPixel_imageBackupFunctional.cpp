#include "ros/ros.h"
#include "math.h"
#include <sensor_msgs/Image.h>
#include <std_msgs/String.h>
#include <iostream>
#include <vector>

// Define a global client that can request services
ros::ServiceClient client;
ros::Publisher wuav_detect;// = n.advertise<std_msgs::String>("wuav_detect", 10);
// This function calls the command_robot service to drive the robot in the specified direction

// This callback function continuously executes and reads the image data
void process_image_callback(const sensor_msgs::Image img){

    int red_pixel = 200;
    int red_height,red_width;
    bool red_pixel_found = false;
    // ros::Publisher wuav5_detect = n.advertise<std_msgs::String>("wuav5_detect", 10);
    ros::Rate loop_rate(10);
    std_msgs::String msg;
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
      if(img.header.frame_id=="uav1/bluefox_optflow_optical"){
        //publica topico uav1 encontrou fogo
        //uav1_detect.publish("UAV1 detected");
        printf("debug uav 1 detect\n");
        msg.data = "UAV1 detected";
        wuav_detect.publish(msg);
      }
      if(img.header.frame_id=="uav2/bluefox_optflow_optical"){
        //publica topico uav2 encontrou fogo
        printf("debug uav 2 detect\n");
        msg.data = "UAV2 detected";
        wuav_detect.publish(msg);
      }
      if(img.header.frame_id=="uav3/bluefox_optflow_optical"){
        //publica topico uav3 encontrou fogo
        printf("debug uav 3 detect\n");
        msg.data = "UAV3 detected";
        wuav_detect.publish(msg);
      }
      if(img.header.frame_id=="uav4/bluefox_optflow_optical"){
        //publica topico uav4 encontrou fogo
        printf("debug uav 4 detect\n");
        msg.data = "UAV4 detected";
        wuav_detect.publish(msg);
      }
      if(img.header.frame_id=="uav5/bluefox_optflow_optical"){
        //publica topico uav5 encontrou fogo
        printf("debug uav 5 detect\n");
        msg.data = "UAV5 detected";
        wuav_detect.publish(msg);
      }
      // if(img.frame_id=="uav6/bluefox_optflow_optical"){
      //   //publica topico uav6 encontrou fogo
      //   uav6_detect.publish("UAV6 detected");
      // }
        //Tratamento de encontrar pixel vermelho
}
    else{
      msg.data = "No fire detected";
      wuav_detect.publish(msg);
    }
}

int main(int argc, char** argv){

    // Initialize the process_image node and create a handle to it
    ros::init(argc, argv, "process_image");
    ros::NodeHandle n;
    wuav_detect = n.advertise<std_msgs::String>("wuav_detect", 10);

    // Subscribe to /camera/rgb/image_raw topic to read the image data inside the process_image_callback function
    ros::Subscriber sub1 = n.subscribe("/uav1/bluefox_optflow/image_raw", 10, process_image_callback);
    ros::Subscriber sub2 = n.subscribe("/uav2/bluefox_optflow/image_raw", 10, process_image_callback);
    ros::Subscriber sub3 = n.subscribe("/uav3/bluefox_optflow/image_raw", 10, process_image_callback);
    ros::Subscriber sub4 = n.subscribe("/uav4/bluefox_optflow/image_raw", 10, process_image_callback);
    ros::Subscriber sub5 = n.subscribe("/uav5/bluefox_optflow/image_raw", 10, process_image_callback);
    // ros::Subscriber sub6 = n.subscribe("/uav5/bluefox_optflow/image_raw", 10, process_image_callback);
    // while(1){
      // if(detectedBy==1){

      // }
    // Handle ROS communication events
    ros::spin();
// }
    return 0;
}
