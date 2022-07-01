//initial beliefs
my_number_string("1").
world_area(250, 250, 0, 0).
num_of_uavs(4).
camera_range(10).
std_altitude(20.0).
std_heading(0.0).
input_id(0).
use_heading(false).
fly_now(false).
stop_at_waypoints(false).
loop(false).
over_constraints(false).
over_max_velocity_hor(0.0).
over_max_acceleration_hor(0.0).
over_max_jerk_hor(0.0).
over_max_velocity_ver(0.0).
over_max_acceleration_ver(0.0).
over_max_jerk_ver(0.0).
relax_heading(false).
land_position(0.0, 0.0).

//rules
current_pos(CX, CY, CZ) :- uav1_odometry_odom_gps(header(seq(_),stamp(secs(_),nsecs(_)),frame_id(_)),child_frame_id(_),pose(pose(position(x(CX),y(CY),z(CZ)),orientation(x(_),y((_)),z((_)),w((_)))),covariance(_)),twist(twist(linear(x(_),y(_),z((_))),angular(x(_),y((_)),z((_)))),covariance(_))).
current_header(Seq, Secs, Nsecs) :- uav1_odometry_odom_gps(header(seq(Seq),stamp(secs(Secs),nsecs(Nsecs)),frame_id(_)),child_frame_id(_),pose(pose(position(x(_),y(_),z(_)),orientation(x(_),y((_)),z((_)),w((_)))),covariance(_)),twist(twist(linear(x(_),y(_),z((_))),angular(x(_),y((_)),z((_)))),covariance(_))).

//initial goals
!start.

//plans
+!start
    <- .print("Started!");
      !calculate_area;
      !calculate_waypoints(1, []);
      !generate_trajectory.
      //!start_trajectory.


// Calculating area
+!calculate_area
    :   my_number(N)
        & world_area(H, W, CX, CY)
        & num_of_uavs(NumOfUavs)
    <-  +status("Calculating");
        NumOfColumns = NumOfUavs/2;
        RectangleHeight = H/2;
        RectangleWidth = W/NumOfColumns;
        X1 = CX - W/2 + ((N-1) mod NumOfColumns)*RectangleWidth;
        X2 = CX - W/2 + ((N-1) mod NumOfColumns + 1)*RectangleWidth;
        Y1 = -H/2 + (math.floor((N-1)/NumOfColumns))*RectangleHeight;
        Y2 = -H/2 + (math.floor((N-1)/NumOfColumns) + 1)*RectangleHeight;
        +my_area(X1, X2, Y1, Y2);
        .print("Calculating area").

// Calculating waypoints
+!calculate_waypoints(C, OldWayList)
    :   camera_range(CR)
        & my_area(X1, X2, Y1, Y2)
        & X2 - (C+2)*CR/2 >= X1
        & std_altitude(Z)
    <-  Waypoints = [
                        [X1 + C*CR/2, Y1 + CR/2, Z]
                        , [X1 + C*CR/2, Y2 - CR/2, Z]
                        , [X1 + (C+2)*CR/2, Y2 - CR/2, Z]
                        , [X1 + (C+2)*CR/2, Y1 + CR/2, Z]
                    ];
        .concat(OldWayList, Waypoints, NewWayList);
        .print("Calculating waypoints");
        !calculate_waypoints(C+4, NewWayList).

+!calculate_waypoints(_, WayList)
    <-  .print("Finished calculating waypoints");
        +waypoints_list(WayList);
        .print(WayList);
        .wait(3000);
        .print("Finished sleeping").

// Generating Trajectory
+!generate_trajectory
   :  waypoints_list(WayList)
      & my_frame_id(Frame_id)
      & input_id(II)
      & use_heading(UH)
      & fly_now(FN)
      & stop_at_waypoints(SAW)
      & loop(Loop)
      & over_constraints(OC)
      & over_max_velocity_hor(OMVH)
      & over_max_acceleration_hor(OMAH)
      & over_max_jerk_hor(OMJH)
      & over_max_velocity_ver(OMVV)
      & over_max_acceleration_ver(OMAV)
      & over_max_jerk_ver(OMJV)
      & relax_heading(RH)
      & std_heading(Heading)
      & my_number(N)
   <- .print("generating_trajectory");
      embedded.mas.bridges.jacamo.defaultEmbeddedInternalAction("roscore1","generate_trajectory", [N, 0, 0, 0, Frame_id, II, UH, FN, SAW, Loop, OC, OMVH, OMAH, OMJH, OMVV, OMAV, OMJV, RH, WayList, Heading]);
      .wait(1000).

// Go to trajectory start and start following trajectory
+!start_trajectory
   :  my_number_string(N)
   <- -status(_);
      +status("going_to_trajectory_start");
      .print("Going to the start of the trajectory").
//       embedded.mas.bridges.jacamo.defaultEmbeddedInternalAction("roscore1","goto_trajectory_start", [N]);
//       .wait(10000);
//       -status(_);
//       +status("following_trajectory");
//       .print("Started trajectory tracking");
//       embedded.mas.bridges.jacamo.defaultEmbeddedInternalAction("roscore1","start_trajectory_tracking", [N]).

// // Check if finished trajectory
// +current_pos(CX, CY, CZ)
//    :  status("following_trajectory")
//       & waypoints_list[_|T]
//       & [X, Y] = T
//       & diff(D)
//       & abs(CX - X) <= D
//       & abs(CY - Y) <= D
//    <- -status(_);
//       +status("waiting");
//       +finished_trajectory(true);
//       .print("finished_trajectory");
//       !wait_for_others.

// // fire_found, go to fire area
// +found_fire(X, Y)[source(UAV)]
//    <- .print("Fire found by ", UAV);
//       +fire_extinguished(X, Y, false);
//       !stop_trajectory_tracking;
//       !goto_fire(X, Y).

// // Stop trajectory
// +!stop_trajectory_tracking
//    :  my_number_string(N)
//    <- -status(_);
//       +status("stopped_trajectory");
//       .print("Stoping trajectory tracking");
//       embedded.mas.bridges.jacamo.defaultEmbeddedInternalAction("roscore1","stop_trajectory_tracking", [N]).

// // go to fire area
// +!goto_fire(X, Y)
//    :  current_pos(CX, CY, _)
//       & diff(D)
//       & abs(CX - X) >= D
//       & abs(CY - Y) >= D
//       & current_header(Seq, Secs, Nsecs)
//       & my_frame_id(Frame_id)
//       & std_altitude(Z)
//       & std_heading(Heading)
//       & my_number_string(N)
//    <- -status(_);
//       +status("going_to_fire_area");
//       .print("Going to the fire");
//       embedded.mas.bridges.jacamo.defaultEmbeddedInternalAction("roscore1","goto_reference", [N, Seq, Secs, Nsecs, Frame_id, X, Y, Z, Heading]).
//       !goto_fire(X, Y).

// +!goto_fire(X, Y)
//    :  current_pos(CX, CY, _)
//       & diff(D)
//       & abs(CX - X) < D
//       & abs(CY - Y) < D
//    <- -status(_);
//       +status("arrived_at_fire_area");
//       .print("Arrived the fire");
//       !extinguish_fire.

// +!extinguish_fire
//    : fire_extinguished(X, Y, false)
//    <- .print("Extinguishing fire");
//       //call service;
//       !extinguish_fire.

// +!extinguish_fire
//    : fire_extinguished(X, Y, true)
//    <- .print("Extinguishing fire");
//       //call service;
//       !fire_extinguished(X, Y).

// +!fire_extinguished(X, Y)
//    :  finished_trajectory(FT)
//       & all_finished(AF)
//       & land_position(LX, LY)
//    <- .print("Fire extinguished");
//       .print("Going to land position");
//       !goto_landing_position(LX, LY).

// +fire_extinguished(X, Y)
//    :  finished_trajectory(FT)
//    <- .print("Fire extinguished");
//       .print("Going to land position");
//       !wait_for_others.

// +fire_extinguished(X, Y)
//    <- .print("Fire extinguished");
//       .print("Going to land position");
//       !resume_trajectory_tracking(LX, LY).

// +resume_trajectory_tracking
//    :  my_number_string(N)
//    <- -status(_);
//       +status("following_trajectory");
//       .print("Resuming trajectory tracking");
//       embedded.mas.bridges.jacamo.defaultEmbeddedInternalAction("roscore1","resume_trajectory_tracking", [N]).

// +!wait_for_others
//    :  fire_found(X, Y)
//    <- .print("Fire found by ", UAV);
//       +fire_extinguished(X, Y, false);
//       !goto_fire(X, Y).

// +!wait_for_others
//    :  finished_trajectory(true)
//    <- .print("All finished, going to land position");
//       !goto_landing_position(LX, LY).

// +!goto_landing_position(X, Y)
//    :  current_pos(CX, CY, _)
//       & diff(D)
//       & abs(CX - X) >= D
//       & abs(CY - Y) >= D
//    <- .print("Going to landing position");
//       !goto_landing_position(X, Y).

// +!goto_landing_position(X, Y)
//    :  current_pos(CX, CY, _)
//       & diff(D)
//       & abs(CX - X) < D
//       & abs(CY - Y) < D
//    <- .print("Arrived at landing position");
//       !land.

// +!land
//    :  my_number_string(N)
//    <- .print("Landing");
//       embedded.mas.bridges.jacamo.defaultEmbeddedInternalAction("roscore1","stop_trajectory_tracking", [N]).