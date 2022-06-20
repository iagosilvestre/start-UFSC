uav_number("5").

!start. //initial goal

+!start : uav_number(M)
   <- .my_name(N);
      .print(N);
      embedded.mas.bridges.jacamo.defaultEmbeddedInternalAction("roscore1","takeoff", [M]).      
     
 

      
      
