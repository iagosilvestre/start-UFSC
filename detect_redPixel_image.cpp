#include "ros/ros.h"
#include "math.h"
#include <sensor_msgs/Image.h>

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

        //Tratamento de encontrar pixel vermelho
}
}

int main(int argc, char** argv){

    // Initialize the process_image node and create a handle to it
    ros::init(argc, argv, "process_image");
    ros::NodeHandle n;

    // Define a client service capable of requesting services from command_robot
    //client = n.serviceClient<ball_chaser::DriveToTarget>("/ball_chaser/command_robot");

    // Subscribe to /camera/rgb/image_raw topic to read the image data inside the process_image_callback function
    ros::Subscriber sub1 = n.subscribe("/uav1/bluefox_optflow/image_raw", 10, process_image_callback);
    ros::Subscriber sub2 = n.subscribe("/uav2/bluefox_optflow/image_raw", 10, process_image_callback);
    ros::Subscriber sub3 = n.subscribe("/uav3/bluefox_optflow/image_raw", 10, process_image_callback);
    ros::Subscriber sub4 = n.subscribe("/uav4/bluefox_optflow/image_raw", 10, process_image_callback);
    ros::Subscriber sub5 = n.subscribe("/uav5/bluefox_optflow/image_raw", 10, process_image_callback);

    // Handle ROS communication events
    ros::spin();

    return 0;
}
