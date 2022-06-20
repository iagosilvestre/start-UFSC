uav_number("1").

!start. //initial goal

+!start : uav_number(N)
   <- .print("Hello world");
      embedded.mas.bridges.jacamo.defaultEmbeddedInternalAction("roscore1","takeoff", [N]).      
     
 

      
      
