extends Node2D

var count
signal send

func _ready() -> void:
	send.connect(TurnManager.test)

func _physics_process(delta: float) -> void:
	if TurnManager.myturn == false:
		count = get_child_count()
		send.emit(count)
