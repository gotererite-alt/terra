extends Node2D

signal done
signal atk()
@export var actor : CharacterBody2D
@export var player : CharacterBody2D
var buffer = 0
var colliding = {}
var prepped = false

func _ready() -> void:
	done.connect(TurnManager.enemy_done)
	atk.connect(actor.attack)
	randomize()

func _on_raycasting_ping(list) -> void:
	colliding = list

func action():
	if colliding.values().has([&"players"]):
		attack()
	else :
		movement()


func movement():
	var directions = []
	var result = []
	var failsafe = []
	
	var go_to = actor.player_pos
	var dir = go_to - actor.position
	var x_dir = sign(dir.x)
	var y_dir = sign(dir.y)
	
	for b in colliding:
		if colliding[b] != null and &"obstacle" in colliding[b]:
			result.append(b)
			failsafe.append(b)
	
	if x_dir != 0:
		directions.append(Vector2(x_dir,0))
	if y_dir != 0:
		directions.append(Vector2(0,y_dir))
	
	for i in directions.duplicate():
		if i in result:
			directions.erase(i)
	
	if directions.size() == 0:
		if y_dir == 0:
			directions.append(Vector2(0,1))
			directions.append(Vector2(0,-1))
		elif x_dir == 0:
			directions.append(Vector2(1,0))
			directions.append(Vector2(-1,0))
		else :
			directions.append(Vector2(-x_dir,0))
			directions.append(Vector2(0,-y_dir))
			for i in directions.duplicate():
				if i in result:
					directions.erase(i)
	if directions.size() > 0:
		var move = directions.pick_random()
		actor.position += move * 32
	done.emit()

func attack():
	var res
	for b in colliding:
		if colliding[b] == [&"players"]:
			res = b
	atk.emit(res)
	done.emit()

func _on_enemy_ping() -> void:
	action()
