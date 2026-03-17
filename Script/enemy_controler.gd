extends Node2D

var count
var enemies
signal send

func _ready() -> void:
	send.connect(TurnManager.test)


func _physics_process(delta: float) -> void:
	if TurnManager.myturn == false:
		count = get_child_count()
		enemies = get_children()
		if TurnManager.turns == 0:
			send.emit(self)
			enemies[TurnManager.turns].turn()

func continues():
	if TurnManager.turns >= count:
		TurnManager.myturn = true
		TurnManager.turns = 0
	else :
		enemies[TurnManager.turns].turn()
