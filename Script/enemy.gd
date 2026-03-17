extends CharacterBody2D

@export var swin : PackedScene
@export var player :CharacterBody2D
var player_pos

func _physics_process(delta: float) -> void:
	player_pos = player.position

func attack(pos):
	var swin_ins = swin.instantiate()
	$spwnpoint.position.x = pos.x * 32
	$spwnpoint.position.y = pos.y * 32
	add_child(swin_ins)
	swin_ins.position = $spwnpoint.position
	swin_ins.look_at(position)
	swin_ins.rotation -= deg_to_rad(90)
