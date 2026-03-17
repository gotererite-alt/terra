extends Node

var myturn = true
var curr_controller
var turns = 0


func test(ctrl):
	curr_controller = ctrl

func enemy_done():
	if myturn == false:
		turns += 1
		curr_controller.continues()
		
