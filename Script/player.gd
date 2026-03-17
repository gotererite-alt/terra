extends CharacterBody2D

@export var speed = 20
var input_dir : Vector2
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var test = 0
var curr_anim = false


func _physics_process(delta: float) -> void:
	movement(delta)
	anim(delta)
	move_and_slide()

func movement(delta):
	input_dir = Input.get_vector("left","right","up","down")
	var input_ril = input_dir.normalized()
	velocity = input_ril * speed * delta * 75

func anim(delta):
	if input_dir.x == 1:
		sprite.play("side")
		sprite.frame = curr_anim
		sprite.flip_h = false
	elif input_dir.x == -1:
		sprite.play("side")
		sprite.frame = curr_anim
		sprite.flip_h = true
	elif input_dir.y == -1:
		sprite.play("up")
		sprite.frame = curr_anim
	else:
		sprite.play("idle")
		sprite.frame = curr_anim
	test = float(test) + delta
	test = "%.2f"%test
	if float(test) >= 1/2.5:
		if curr_anim == false:
			curr_anim = true
		else :
			curr_anim = false
		test = 0
