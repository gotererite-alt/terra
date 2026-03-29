extends Node2D

@export var swing : PackedScene
@export var damage = 1

func attack(pos):
	var swing_ins = swing.instantiate()
	$Spawnpoint.position.x = pos.x * 32
	$Spawnpoint.position.y = pos.y * 32
	add_child(swing_ins)
	swing_ins.position = $Spawnpoint.position
	swing_ins.look_at(get_parent().position)
	swing_ins.rotation -= deg_to_rad(90)
	TurnManager.myturn = false
