uav_number("4").

!start. //initial goal

+!start : uav_number(M)
   <- .my_name(N);
      .print(N).
      //embedded.mas.bridges.jacamo.defaultEmbeddedInternalAction("roscore1","takeoff", [M]).      
     
 

      
      