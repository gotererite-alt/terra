extends Node2D

var list = {}
signal ping

func _process(delta: float) -> void:
	var temp
	
	if $Left.get_collider() != null:
		temp = $Left.get_collider()
		list[Vector2(-1,0)] = temp.get_groups()
	else :
		list[Vector2(-1,0)] = null
	
	if $Right.get_collider() != null:
		temp = $Right.get_collider()
		list[Vector2(1,0)] = temp.get_groups()
	else :
		list[Vector2(1,0)] = null
	
	if $Up.get_collider() != null:
		temp = $Up.get_collider()
		list[Vector2(0,-1)] = temp.get_groups()
	else :
		list[Vector2(0,-1)] = null
	
	if $Down.get_collider() != null:
		temp = $Down.get_collider()
		list[Vector2(0,1)] = temp.get_groups()
	else :
		list[Vector2(0,1)] = null
	
	if TurnManager.myturn == false:
		ping.emit(list)
