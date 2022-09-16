world_area(250, 250, 0, 0).
num_of_uavs(4).
camera_range(10).
std_altitude(20.0).

!start.

+!start
    <- .print("Started!");
    !calculate_area.
    !calculate_waypoints.
    !generate_trajectory.

+!calculate_area
    :   my_number(N)
        & world_area(H, W, CX, CY)
        & num_of_uavs(NumOfUavs)
    <-  NumOfColumns = NumOfUavs/2;
        RectangleHeight = H/2;
        RectangleWidth = W/NumOfColumns;
        X1 = CX - W/2 + ((N-1) mod NumOfColumns)*RectangleWidth;
        X2 = CX - W/2 + ((N-1) mod NumOfColumns + 1)*RectangleWidth;
        Y1 = -H/2 + (math.floor((N-1)/NumOfColumns))*RectangleHeight;
        Y2 = -H/2 + (math.floor((N-1)/NumOfColumns) + 1)*RectangleHeight;
        +my_area(X1, X2, Y1, Y2);
        .print("Calculating area");
        !calculate_waypoints(1, []).

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
        .print(WayList);
        .wait(3000);
        .print("Finished sleeping");
        !generate_trajectory(WayList).
