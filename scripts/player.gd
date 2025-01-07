extends CharacterBody2D
class_name Player

@export var max_health = 3
@onready var health = 3
var gutter_stunned: bool = false

const MULTIPLIER: Vector2 = Vector2(200, 200)

signal player_damaged(damage: int)
signal dead()

func _physics_process(delta: float) -> void:
#	Godot goes x,y from top left, so down is positive y
	if !gutter_stunned:
		var direction: Vector2 = Input.get_vector("player_left", "player_right", "player_up", "player_down")
		velocity = direction * MULTIPLIER

	move_and_slide()
	
func damage_player(damage: int) -> void:
	health -= damage
	player_damaged.emit(damage)
	if health <= 0:
		dead.emit()

func gutter_hit():
	damage_player(1)
	gutter_stunned = true
	velocity = Vector2(0, 0)
	position.x = 960
	if not is_inside_tree():
		return
	await get_tree().create_timer(0.5).timeout
	gutter_stunned = false
