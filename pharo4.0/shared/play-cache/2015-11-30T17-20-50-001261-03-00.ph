"| proxy systemState |proxy := XMLRPCProxy withUrl:'http://localhost:11311'.systemState := (proxy invokeMethod:'getSystemState' withArgs:{'/script'}).nodes:=OrderedCollection new.topics:=OrderedCollection new.systemState  third first collect:[:e | self halt.]."Graph new createGraph: (Adapter new getData)."Adapter new getData inspect""http://wiki.ros.org/ROS/Master_API"