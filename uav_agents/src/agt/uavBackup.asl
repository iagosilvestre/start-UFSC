//////////////// Initial beliefs
status("None").
world_area(250, 250, 0, 0).
num_of_uavs(6).
camera_range(50).
std_altitude(20.0).
std_heading(0.0).
land_point(-102.0, -111.0).
land_radius(10.0).
diff(1).


//////////////// Rules
current_position(CX, CY, CZ) :- my_frame_id(Frame_id) & uav1_odometry_gps_local_odom(header(seq(Seq),stamp(secs(Secs),nsecs(Nsecs)),frame_id(Frame_id)),child_frame_id(CFI),pose(pose(position(x(CX),y(CY),z(CZ)),orientation(x(OX),y((OY)),z((OZ)),w((OW)))),covariance(CV)),twist(twist(linear(x(LX),y(LY),z((LZ))),angular(x(AX),y((AY)),z((AZ)))),covariance(CV2))).
current_position(CX, CY, CZ) :- my_frame_id(Frame_id) & uav2_odometry_gps_local_odom(header(seq(Seq),stamp(secs(Secs),nsecs(Nsecs)),frame_id(Frame_id)),child_frame_id(CFI),pose(pose(position(x(CX),y(CY),z(CZ)),orientation(x(OX),y((OY)),z((OZ)),w((OW)))),covariance(CV)),twist(twist(linear(x(LX),y(LY),z((LZ))),angular(x(AX),y((AY)),z((AZ)))),covariance(CV2))).
current_position(CX, CY, CZ) :- my_frame_id(Frame_id) & uav3_odometry_gps_local_odom(header(seq(Seq),stamp(secs(Secs),nsecs(Nsecs)),frame_id(Frame_id)),child_frame_id(CFI),pose(pose(position(x(CX),y(CY),z(CZ)),orientation(x(OX),y((OY)),z((OZ)),w((OW)))),covariance(CV)),twist(twist(linear(x(LX),y(LY),z((LZ))),angular(x(AX),y((AY)),z((AZ)))),covariance(CV2))).
current_position(CX, CY, CZ) :- my_frame_id(Frame_id) & uav4_odometry_gps_local_odom(header(seq(Seq),stamp(secs(Secs),nsecs(Nsecs)),frame_id(Frame_id)),child_frame_id(CFI),pose(pose(position(x(CX),y(CY),z(CZ)),orientation(x(OX),y((OY)),z((OZ)),w((OW)))),covariance(CV)),twist(twist(linear(x(LX),y(LY),z((LZ))),angular(x(AX),y((AY)),z((AZ)))),covariance(CV2))).
current_position(CX, CY, CZ) :- my_frame_id(Frame_id) & uav5_odometry_gps_local_odom(header(seq(Seq),stamp(secs(Secs),nsecs(Nsecs)),frame_id(Frame_id)),child_frame_id(CFI),pose(pose(position(x(CX),y(CY),z(CZ)),orientation(x(OX),y((OY)),z((OZ)),w((OW)))),covariance(CV)),twist(twist(linear(x(LX),y(LY),z((LZ))),angular(x(AX),y((AY)),z((AZ)))),covariance(CV2))).
current_position(CX, CY, CZ) :- my_frame_id(Frame_id) & uav6_odometry_gps_local_odom(header(seq(Seq),stamp(secs(Secs),nsecs(Nsecs)),frame_id(Frame_id)),child_frame_id(CFI),pose(pose(position(x(CX),y(CY),z(CZ)),orientation(x(OX),y((OY)),z((OZ)),w((OW)))),covariance(CV)),twist(twist(linear(x(LX),y(LY),z((LZ))),angular(x(AX),y((AY)),z((AZ)))),covariance(CV2))).

current_position(CX, CY, CZ) :- my_frame_id(Frame_id) & uav7_odometry_gps_local_odom(header(seq(Seq),stamp(secs(Secs),nsecs(Nsecs)),frame_id(Frame_id)),child_frame_id(CFI),pose(pose(position(x(CX),y(CY),z(CZ)),orientation(x(OX),y((OY)),z((OZ)),w((OW)))),covariance(CV)),twist(twist(linear(x(LX),y(LY),z((LZ))),angular(x(AX),y((AY)),z((AZ)))),covariance(CV2))).
current_position(CX, CY, CZ) :- my_frame_id(Frame_id) & uav8_odometry_gps_local_odom(header(seq(Seq),stamp(secs(Secs),nsecs(Nsecs)),frame_id(Frame_id)),child_frame_id(CFI),pose(pose(position(x(CX),y(CY),z(CZ)),orientation(x(OX),y((OY)),z((OZ)),w((OW)))),covariance(CV)),twist(twist(linear(x(LX),y(LY),z((LZ))),angular(x(AX),y((AY)),z((AZ)))),covariance(CV2))).
current_position(CX, CY, CZ) :- my_frame_id(Frame_id) & uav9_odometry_gps_local_odom(header(seq(Seq),stamp(secs(Secs),nsecs(Nsecs)),frame_id(Frame_id)),child_frame_id(CFI),pose(pose(position(x(CX),y(CY),z(CZ)),orientation(x(OX),y((OY)),z((OZ)),w((OW)))),covariance(CV)),twist(twist(linear(x(LX),y(LY),z((LZ))),angular(x(AX),y((AY)),z((AZ)))),covariance(CV2))).
current_position(CX, CY, CZ) :- my_frame_id(Frame_id) & uav10_odometry_gps_local_odom(header(seq(Seq),stamp(secs(Secs),nsecs(Nsecs)),frame_id(Frame_id)),child_frame_id(CFI),pose(pose(position(x(CX),y(CY),z(CZ)),orientation(x(OX),y((OY)),z((OZ)),w((OW)))),covariance(CV)),twist(twist(linear(x(LX),y(LY),z((LZ))),angular(x(AX),y((AY)),z((AZ)))),covariance(CV2))).
current_position(CX, CY, CZ) :- my_frame_id(Frame_id) & uav11_odometry_gps_local_odom(header(seq(Seq),stamp(secs(Secs),nsecs(Nsecs)),frame_id(Frame_id)),child_frame_id(CFI),pose(pose(position(x(CX),y(CY),z(CZ)),orientation(x(OX),y((OY)),z((OZ)),w((OW)))),covariance(CV)),twist(twist(linear(x(LX),y(LY),z((LZ))),angular(x(AX),y((AY)),z((AZ)))),covariance(CV2))).
current_position(CX, CY, CZ) :- my_frame_id(Frame_id) & uav12_odometry_gps_local_odom(header(seq(Seq),stamp(secs(Secs),nsecs(Nsecs)),frame_id(Frame_id)),child_frame_id(CFI),pose(pose(position(x(CX),y(CY),z(CZ)),orientation(x(OX),y((OY)),z((OZ)),w((OW)))),covariance(CV)),twist(twist(linear(x(LX),y(LY),z((LZ))),angular(x(AX),y((AY)),z((AZ)))),covariance(CV2))).



near(X, Y) :- current_position(CX, CY, CZ)
              & diff(D)
              & math.abs(CX - X) <= D
              & math.abs(CY - Y) <= D.
my_number_string(S) :- my_number(N)
                       & .term2string(N, S).

+detect_fire_uav1(N) : my_number(N) <- !detected_fire(N).
+detect_fire_uav2(N) : my_number(N) <- !detected_fire(N).
+detect_fire_uav3(N) : my_number(N) <- !detected_fire(N).
+detect_fire_uav4(N) : my_number(N) <- !detected_fire(N).
+detect_fire_uav5(N) : my_number(N) <- !detected_fire(N).
+detect_fire_uav6(N) : my_number(N) <- !detected_fire(N).

//////////////// Start
!start.

+!start
    <- .wait(100);
      .print("Started!");
      !calculate_land_position;//trajectory
      !calculate_area;
      !calculate_waypoints(1, []);// pode ser unido com os outros
      !follow_trajectory(0).


//////////////// Calculating land position
+!calculate_land_position
   :  my_number(N)
      & land_point(LX, LY)
      & land_radius(R)
      & num_of_uavs(NumOfUavs)
   <- .print("Calculating landing position");
      -+status("calculating_land_position");
      NumOfColumns = NumOfUavs/2;
      RectangleHeight = R/2;
      RectangleWidth = R/NumOfColumns;
      My_landing_x = LX - R/2 + RectangleWidth/2 + ((N-1) mod NumOfColumns)*RectangleWidth;
      My_landing_y = LY - R/2 + RectangleHeight/2 + (math.floor((N-1)/NumOfColumns))*RectangleHeight;
      +my_landing_position(My_landing_x, My_landing_y).


//////////////// Calculating area
+!calculate_area
    :   my_number(N)
        & world_area(H, W, CX, CY)
        & num_of_uavs(NumOfUavs)
    <-  .print("Calculating area");
        +status("calculating_area");
        NumOfColumns = NumOfUavs/2;
        RectangleHeight = H/2;
        RectangleWidth = W/NumOfColumns;
        X1 = CX - W/2 + ((N-1) mod NumOfColumns)*RectangleWidth;
        X2 = CX - W/2 + ((N-1) mod NumOfColumns + 1)*RectangleWidth;
        Y1 = CY - H/2 + (math.floor((N-1)/NumOfColumns))*RectangleHeight;
        Y2 = CY - H/2 + (math.floor((N-1)/NumOfColumns) + 1)*RectangleHeight;
        +my_area(X1, X2, Y1, Y2).


//////////////// Calculating waypoints
+!calculate_waypoints(C, OldWayList)
    :   camera_range(CR)
        & my_area(X1, X2, Y1, Y2)
        & X2 - (C+2)*CR/2 >= X1
        & std_altitude(Z)
    <-  .print("Calculating waypoints");
        -+status("calculating_waypoints");
        Waypoints = [
                        [X1 + C*CR/2, Y1 + CR/2, Z]
                        , [X1 + C*CR/2, Y2 - CR/2, Z]
                        , [X1 + (C+2)*CR/2, Y2 - CR/2, Z]
                        , [X1 + (C+2)*CR/2, Y1 + CR/2, Z]
                    ];
        .concat(OldWayList, Waypoints, NewWayList);
        !calculate_waypoints(C+4, NewWayList).

+!calculate_waypoints(_, WayList)
    <-  .print("Finished calculating waypoints");
        +waypoints_list(WayList);
        +waypoints_list_len(.length(WayList));
        .print("Waypoints list: ", WayList).


//////////////// Follow trajectory
+!follow_trajectory(CW)
   :  waypoints_list_len(CW)
      & my_number(N)
   <- .broadcast(tell, finished_trajectory(N));
      +finished_trajectory(N);
      -+status("finished_trajectory");
      .print("finished_trajectory");
      !wait_for_others.

+!follow_trajectory(CW)
   :  waypoints_list(WL)
      & waypoints_list_len(Len)
      & CW < Len
   <- -+status("following_trajectory");
      .print("following_trajectory");
      .nth(CW, WL, [X, Y, Z]);
      !check_near(X, Y, Z, "waypoint");
      !follow_trajectory(CW+1).


//////////////// Waiting
+!wait_for_others
   :  my_number(N)
      & my_landing_position(LX, LY)
      & .count(finished_trajectory(_), C)
      & num_of_uavs(C)
   <- -+status("waiting");
      .print("All finished, going to land position");
      !goto_landing_position(LX, LY).

+!wait_for_others
   <- -+status("waiting");
      .print("Still waiting");
      .wait(1000);
      !wait_for_others.


//////////////// Landing
+!goto_landing_position(X, Y)
   : std_altitude(Z)
   <- -+status("going_to_land_position");
      !check_near(X, Y, Z, "land position");
      !land.

+!land
   :  my_number_string(N)
   <- .print("Landing");
      -+status("landing")
      embedded.mas.bridges.jacamo.defaultEmbeddedInternalAction("roscore1", "land", [N]).


//////////////// Fire Strategy
+!detected_fire(N)
   :  my_number(N)
      & current_position(CX, CY, CZ)
      & .intend(follow_trajectory(CW))
      & not status("combating_fire")
      & not fire_extinguished
   <- .suspend(follow_trajectory(CW));
      -+status("combating_fire");
      .print("Fire found by ", N, ". Suspending trajectory.")
      .broadcast(tell, found_fire(N, CX, CY));
	  //acao de combate ao fogo/ na simulacao muda a cor do VANT/ no caso da implementacao real tem que ter uma funcao
      !goto_fire_position(CX, CY, N*5); // Esse daqui nao parece fazer sentido/testar na simulacao
      .wait(10000);   
      +fire_extinguished;
      .resume(follow_trajectory(CW));
      .print("Fire extinguished. Resuming trajectory").

+!detected_fire(N)  // nao parece fazer sentido
   :  my_number(N)
      & current_position(CX, CY, CZ)
      & .intend(wait_for_others)
      & not status("combating_fire")
      & not fire_extinguished
   <- .suspend(wait_for_others);
      -+status("combating_fire");
      .print("Fire found by ", N, ". Suspending waiting.")
      .broadcast(tell, found_fire(N, CX, CY));
      !goto_fire_position(CX, CY, N*5);
      .wait(10000);
      +fire_extinguished;
      .resume(wait_for_others);
      .print("Fire extinguished. Resuming waiting").  // nao parece fazer sentido

+found_fire(N, X, Y)
   : not my_number(N)
      & .intend(follow_trajectory(CW))
      & not status("combating_fire")
      & not fire_extinguished
   <- .suspend(follow_trajectory(CW));
      -+status("combating_fire");
      .print("Fire found by ", N, ". Suspending trajectory.")
      !goto_fire_position(X+N, Y, N*5);
	  //acao de combate ao fogo/ na simulacao muda a cor do VANT/ no caso da implementacao real tem que ter uma funcao
      .wait(10000);
      +fire_extinguished;
      .resume(follow_trajectory(CW));
      .print("Fire extinguished. Resuming trajectory").

+found_fire(N, X, Y)
   : not my_number(N)
      & .intend(wait_for_others)
      & not status("combating_fire")
      & not fire_extinguished
   <- .suspend(wait_for_others);
      -+status("combating_fire");
      .print("Fire found by ", N, ". Suspending waiting.")
      !goto_fire_position(X+N, Y, N*5);
	  //acao de combate ao fogo/ na simulacao muda a cor do VANT/ no caso da implementacao real tem que ter uma funcao
      .wait(10000);
      +fire_extinguished;
      .resume(wait_for_others);
      .print("Fire extinguished. Resuming waiting").

+!goto_fire_position(X, Y, Z)
   <- !check_near(X, Y, Z, "fire position").


//////////////// Check Near
+!check_near(X, Y, Z, S)
   :  near(X, Y)
   <- .print("Arrived at ", S).

+!check_near(X, Y, Z, S)
   :  my_number_string(N)
      & std_heading(Heading)
   <- embedded.mas.bridges.jacamo.defaultEmbeddedInternalAction("roscore1","goto", [N, X, Y, Z, Heading]);
      .wait(200);
      !check_near(X, Y, Z, S).


//////////////// Handling plan failure
+!detected_fire(_).
+!found_fire(_, _, _).
