extends Area2D

@export var velocity: Vector2 = Vector2(0, -100)

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.bullet_hit()
		
func _physics_process(delta: float) -> void:
	var adjusted = velocity * delta
	position = position - adjusted
