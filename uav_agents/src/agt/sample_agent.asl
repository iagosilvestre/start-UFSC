
/* The plans below illustrate the reading of integer values and the writing to ros topics */
+value1(V) 
   <- .print("Read value 1: ", V);
      .wait(100);
      //execute "update_topic2" upon "roscore1". Such action is translated to rostopic pub in MyDemoDevice class
      embedded.mas.bridges.jacamo.defaultEmbeddedInternalAction("roscore1","update_value2", V+1 ).

+value2(V)
   <- .print("Read topic 2: ", V);
      .wait(100);
      //execute "action1" upon "roscore1". Such action is translated to rostopic writing in MyDemoDevice class
      embedded.mas.bridges.jacamo.defaultEmbeddedInternalAction("roscore1","update_value1",V+1 ).
     
/* The plans below illustrate the reading of string values and the writing to ros topics */      
+current_time(V) : .time(H,M,S) & .concat(H,":",M,":",S,Msg)
   <-.print("Read time ", V, " - ", Msg);
     .wait(2000);
     embedded.mas.bridges.jacamo.defaultEmbeddedInternalAction("roscore1","update_time",Msg).
     
      
      
