//initial beliefs
seq(0).
secs(0).
nsecs(0).
frame_id("uav1/local_origin").
x(8.0).
y(8.0).
z(2.0).
heading(0.0).


!test. //initial goal

+!test: seq(Seq) & secs(Secs) & nsecs(NSecs) & frame_id(Frame_id) & x(X) & y(Y) & z(Z) & heading(Heading)
   <- .print("hello world");
       embedded.mas.bridges.jacamo.defaultEmbeddedInternalAction("roscore1","goto_reference", ["1",Seq,Secs,NSecs,Frame_id,X,Y,Z,Heading]).
      
      
 

      
      
