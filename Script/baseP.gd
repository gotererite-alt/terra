extends CharacterBody2D

var range = 32
var IsTurn = true
var input_dir : Vector2
var atk_dir : Vector2
var prep = false
var chr
@onready var characters := {"fighter" : preload("res://Scenes/fighter.tscn")}
@onready var spwn =  $rot/Marker2D

func _ready() -> void:
	chr = characters[TurnManager.character].instantiate()
	add_child(chr)

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
		chr.attack(atk_dir)

func move():
	position += input_dir * range
	prep = false
	TurnManager.myturn = false

func prepped():
	prep = true
	TurnManager.myturn = false
