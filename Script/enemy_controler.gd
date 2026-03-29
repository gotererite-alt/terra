extends Node2D

var count
var enemies
signal send
var init = false

func _ready() -> void:
	send.connect(TurnManager.test)

func _physics_process(delta: float) -> void:
	if TurnManager.myturn == false:
		count = get_child_count()
		enemies = get_children()
		if TurnManager.turns == 0 and init == false:
			send.emit(self)
			enemies[TurnManager.turns].turn()
			init = true

func continues():
	if TurnManager.turns >= count:
		TurnManager.myturn = true
		TurnManager.turns = 0
	else :
		enemies[TurnManager.turns].turn()
