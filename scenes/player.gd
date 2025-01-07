extends CharacterBody2D


const MULTIPLIER: Vector2 = Vector2(200, 200)
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
#	Godot goes x,y from top left, so down is positive y
	var direction: Vector2 = Input.get_vector("player_left", "player_right", "player_up", "player_down")
	
	velocity = direction * MULTIPLIER

	move_and_slide()
