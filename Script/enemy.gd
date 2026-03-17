extends CharacterBody2D

@export var swin : PackedScene
@export var player :CharacterBody2D
var player_pos
var wait = false
var timer = 0
signal ping

func _physics_process(delta: float) -> void:
	player_pos = player.position
	if wait == true:
		if timer >= 0.5:
			wait = false
			timer = 0
			ping.emit()
		else :
			timer += delta

func attack(pos):
	var swin_ins = swin.instantiate()
	$spwnpoint.position.x = pos.x * 32
	$spwnpoint.position.y = pos.y * 32
	add_child(swin_ins)
	swin_ins.position = $spwnpoint.position
	swin_ins.look_at(position)
	swin_ins.rotation -= deg_to_rad(90)

func turn():
	wait = true
