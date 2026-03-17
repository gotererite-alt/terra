extends Node

var myturn = true
var counting = 0


func test(num):
	if counting >= num:
		myturn = true
		counting = 0

func counter():
	counting += 1
