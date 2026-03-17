extends CharacterBody2D

var range = 32
var IsTurn = true
var input_dir : Vector2
var atk_dir : Vector2
var prep = false
@export var swing : PackedScene
@onready var spwn =  $rot/Marker2D

func _physics_process(delta: float) -> void:
	if TurnManager.myturn == true:
		action()
		move_and_slide()
		velocity = Vector2.ZERO


func action():
	input_dir = Input.get_vector("left","right","up","down")
	atk_dir = Input.get_vector("Aleft","Aright","Aup","Adown")
	if input_dir != Vector2(0,0) and abs(input_dir) != Vector2(1,1).normalized():
		move()
	elif Input.is_action_just_pressed("space") and prep == false:
		prepped()
	elif atk_dir != Vector2(0,0) and prep == true:
		attack()

func move():
	position += input_dir * range
	prep = false
	TurnManager.myturn = false

func prepped():
	prep = true
	TurnManager.myturn = false

func attack():
	var swing_ins = swing.instantiate()
	if atk_dir.y == 0:
		$rot.rotation_degrees = 90 * atk_dir.x
	elif atk_dir.y == 1 :
		$rot.rotation_degrees = 180
	elif atk_dir.y == -1:
		$rot.rotation = 0
	$rot.add_child(swing_ins)
	swing_ins.position = spwn.position
	TurnManager.myturn = false
