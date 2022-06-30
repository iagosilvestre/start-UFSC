#include "ros/ros.h"
#include "math.h"
#include <sensor_msgs/Image.h>
#include <std_msgs/String.h>
#include <iostream>
#include <vector>
#include <sstream>
#include <string>

// Define a global client that can request services
ros::ServiceClient client;
const int uavQty=6;
ros::Publisher detect_fire[uavQty];// = n.advertise<std_msgs::String>("detect_fire", 10);
ros::Publisher landPos[uavQty];
// This function calls the command_robot service to drive the robot in the specified direction

// This callback function continuously executes and reads the image data
void process_image_callback(const sensor_msgs::Image img){

    int red_pixel = 200;
    int red_height,red_width;
    bool red_pixel_found = false;
    // ros::Publisher wuav5_detect = n.advertise<std_msgs::String>("wuav5_detect", 10);
    ros::Rate loop_rate(10);
    std_msgs::String msg;
    float landZeroX=-102.0;
    float landZeroY=-111.0;
    float landingX,landingY;
    std_msgs::String landingXY;
    std::stringstream xyxy;

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


      if(img.header.frame_id=="uav1/bluefox_optflow_optical"){
        if(red_pixel_found){
        //publica topico uav1 encontrou fogo
        // printf("debug uav 1 detect\n");
        msg.data = "UAV1";
        detect_fire[1].publish(msg);
      }
      else{
        msg.data = "no fire";
        detect_fire[1].publish(msg);
      }
      }
      else if(img.header.frame_id=="uav2/bluefox_optflow_optical"){
        if(red_pixel_found){
        //publica topico uav2 encontrou fogo
        // printf("debug uav 2 detect\n");
        msg.data = "UAV2";
        detect_fire[2].publish(msg);
      }
      else{
        msg.data = "no fire";
        detect_fire[2].publish(msg);
      }
      }
      else if(img.header.frame_id=="uav3/bluefox_optflow_optical"){
        if(red_pixel_found){
        //publica topico uav3 encontrou fogo
        // printf("debug uav 3 detect\n");
        msg.data = "UAV3";
        detect_fire[3].publish(msg);
      }
        else{
          msg.data = "no fire";
          detect_fire[3].publish(msg);
        }
      }
      else if(img.header.frame_id=="uav4/bluefox_optflow_optical"){
        if(red_pixel_found){
        //publica topico uav4 encontrou fogo
        // printf("debug uav 4 detect\n");
        msg.data = "UAV4";
        detect_fire[4].publish(msg);
      }
        else{
          msg.data = "no fire";
          detect_fire[4].publish(msg);
        }
      }
      else if(img.header.frame_id=="uav5/bluefox_optflow_optical"){
        if(red_pixel_found){
        //publica topico uav5 encontrou fogo
        // printf("debug uav 5 detect\n");
        msg.data = "UAV5";
        detect_fire[5].publish(msg);
      }
        else{
          msg.data = "no fire";
          detect_fire[5].publish(msg);
        }
      }
      else if(img.header.frame_id=="uav6/bluefox_optflow_optical"){
        if(red_pixel_found){
      // publica topico uav6 encontrou fogo
      // printf("debug uav 6 detect\n");
      msg.data = "UAV6";
      detect_fire[6].publish(msg);
    }
    else{
      msg.data = "no fire";
      detect_fire[6].publish(msg);
    }
    }

    // else{
    //   msg.data = "No fire detected by UAV:"; //falta implementar
    //   detect_fire.publish(msg);
    // }


    for(int i=1;i<=uavQty;i++){  //Calcula a posicao de pouso dos drones e bota no topico
      int lane=(i/4)+1; // Divisao inteira por 4, inicia em 1
  		int pos=i%4; // Resto da divisao por 4

  		if(pos==1){
  		  landingX=landZeroX;
  		  landingY=landZeroY+(1.5*lane);
  		}
  		else if(pos==2){
  		  landingX=landZeroX+(1.5*lane);
  		  landingY=landZeroY;
  		}
  		else if(pos==3){
  		  landingX=landZeroX;
  		  landingY=landZeroY-(1.5*lane);
  		}
  		else{ //pos==0 uavN multiplo de 4
  		  landingX=landZeroX-(1.5*(lane-1));
  		  landingY=landZeroY;
  		}
  		xyxy << landingX << "," << landingY;
  		std::string xy = xyxy.str();
  		// std::cout <<  "UAV:"<< i << ", pos: "<< xy << "\n"; //Debug posicoes
  		landingXY.data = xy;
  		landPos[i].publish(landingXY);
      xyxy.str(std::string());
    }
}
int main(int argc, char** argv){
	// Initialize the process_image node and create a handle to it
	ros::init(argc, argv, "process_image");
	ros::NodeHandle n;

	for(int i=1;i<=uavQty;i++){ //Rotina para criar topicos que contem a posicao de pouso respectiva para cada drone
		std::stringstream ss,dfdf;
		ss << "landPos_" << i;
		dfdf << "detect_fire_uav" << i;
		std::string s = ss.str();
		std::string df = dfdf.str();
		detect_fire[i] = n.advertise<std_msgs::String>(df, 10);
		landPos[i]=n.advertise<std_msgs::String>(s, 10);
	}


	// Subscribe to /camera/rgb/image_raw topic to read the image data inside the process_image_callback function
	ros::Subscriber sub1 = n.subscribe("/uav1/bluefox_optflow/image_raw", 10, process_image_callback);
	ros::Subscriber sub2 = n.subscribe("/uav2/bluefox_optflow/image_raw", 10, process_image_callback);
	ros::Subscriber sub3 = n.subscribe("/uav3/bluefox_optflow/image_raw", 10, process_image_callback);
	ros::Subscriber sub4 = n.subscribe("/uav4/bluefox_optflow/image_raw", 10, process_image_callback);
	ros::Subscriber sub5 = n.subscribe("/uav5/bluefox_optflow/image_raw", 10, process_image_callback);
	ros::Subscriber sub6 = n.subscribe("/uav6/bluefox_optflow/image_raw", 10, process_image_callback);
	// Handle ROS communication events
	ros::spin();
	// }
	return 0;
	}
