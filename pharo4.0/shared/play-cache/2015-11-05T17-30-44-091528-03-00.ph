nodeA := Node new.nodeB := Node new.nodeC := Node new.nodeD := Node new.nodeA nameNode: 'A'.nodeB nameNode: 'B'.nodeC nameNode: 'C'.nodeD nameNode: 'D'.nodeA pub: nodeB.nodeA pub: nodeC.nodeB pub: nodeC.nodeArray := OrderedCollection new.nodeArray add: nodeA.nodeArray add: nodeB.nodeArray add: nodeC.nodeArray add: nodeD.v := Graph new.v createGraph: nodeArray.