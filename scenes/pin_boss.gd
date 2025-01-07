extends CharacterBody2D
	
var bullet = preload("res://scenes/bullet.tscn")

func _ready() -> void:
	var instance = bullet.instantiate()
	add_child(instance)
		 

func _physics_process(delta: float) -> void:
	move_and_slide()
