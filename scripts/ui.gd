extends Node


func _on_player_player_health_changed(new_health: int, change: int) -> void:
	var text = ""
	for n in new_health:
		text = text + "X"
	get_node("Panel/Health").text = text
