class_name Bullet
extends Area2D

@export var velocity: Vector2 = Vector2(0, 0)

static func create_bullet(velocity: Vector2) -> Bullet:
	var new_bullet: Bullet = load("res://scenes/bullet.tscn").instantiate()
	new_bullet.velocity = velocity
	return new_bullet

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.bullet_hit()
		
func _physics_process(delta: float) -> void:
	var adjusted = velocity * delta
	position = position + adjusted
