uav_number("1").

!start. //initial goal

+!start : uav_number(M)
   <- .my_name(N);
      .print(N);
      .concat("[-72.0, 35.0, 30.0, 0.0]",X);
      embedded.mas.bridges.jacamo.defaultEmbeddedInternalAction("roscore1","goto", [X]).      
     
 

      
      
