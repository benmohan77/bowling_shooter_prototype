class_name Crack
extends Area2D

@export var velocity: Vector2 = Vector2(0, 0)

static func create_crack(velocity: Vector2) -> Crack:
	var new_crack: Crack = load("res://scenes/crack.tscn").instantiate()
	new_crack.velocity = velocity
	return new_crack


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.crack_hit()

func _physics_process(delta: float) -> void:
	var adjusted = velocity * delta
	position = position + adjusted
