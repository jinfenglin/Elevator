<head1>Elevator Stimulation</head1>
<p>
  My model is slightly different from what pito suggest. Components are not registered to Simulation class directly. Buidling instance will register to simulation class, it is the basic simulation unit in my implementation, so it is very easy to expand it into a multi-building stimulation. Floor and elevators are all regulated by building, although there is no explicit register method, they will be registered at the initialization. Elevator and floor get to known each other through the building, it control the overall information, while floor and elevator provide method to regulate queries of their personal information. 
  I tried my best to make the interfaces of each class to be consistence,every class have a clock_tick method, but they are called with hierarchy.  
  It is the final deliverable for Engineering course. Details about the assignment please check follow link:
<a href="http://cosi105-2015.s3-website-us-west-2.amazonaws.com/content/topics/pa/pa_elevator/">Elevator Assignment</a>
</p>



[![Code Climate](https://codeclimate.com/github/jinfenglin/Elevator/badges/gpa.svg)](https://codeclimate.com/github/jinfenglin/Elevator)
