extends CharacterBody2D
class_name Player

const MULTIPLIER: Vector2 = Vector2(200, 200)
const BOOST_SPEED: Vector2 = Vector2(0, -200)

@export var max_health = 3
@onready var health = 3

var stunned: bool = false
#var boosting: bool = false
#var boost_cooldown: bool = false

signal player_health_changed(new_health: int, change: int)
signal dead()

#func _unhandled_input(event: InputEvent) -> void:
	#if Input.is_action_just_pressed("boost") and not boost_cooldown:
		#print("boosting")
		#boosting = true
		#await get_tree().create_timer(1.0).timeout
		#boosting = false
		#print("cooldown")
		#boost_cooldown = true
		#await get_tree().create_timer(3.0).timeout
		#print("cooldown over")
		#boost_cooldown = false
		

func _physics_process(delta: float) -> void:
#	Godot goes x,y from top left, so down is positive y
	if !stunned:
		var direction: Vector2 = Input.get_vector("player_left", "player_right", "player_up", "player_down")
		velocity = direction * MULTIPLIER
		#if boosting:
			#velocity = velocity + BOOST_SPEED
	else:
		velocity = Vector2(0, 0)

	move_and_slide()
	
func damage_player(damage: int) -> void:
	print("-" + str(damage) + "hp")
	health -= damage
	player_health_changed.emit(health, -damage)
	if health <= 0:
		dead.emit()
		
func crack_hit():
	stun(1.0)
		
func bullet_hit():
	damage_player(1)
	stun()
	
func stun(timeout: float = 0.5):
	stunned = true
	if not is_inside_tree():
		return
	await get_tree().create_timer(timeout).timeout
	stunned = false
	

func gutter_hit():
	damage_player(1)
	velocity = Vector2(0, 0)
	position.x = 960
	stun()
	
