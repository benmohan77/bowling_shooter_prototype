extends Node

var timer: Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = get_node("Timer")
	timer.one_shot = true
	timer.wait_time = 5.0
	timer.timeout.connect(_on_crack_timer_timeout)
	timer.start()
	
func _on_crack_timer_timeout() -> void:
	var crack = Crack.create_crack(Vector2(0, 400))
	crack.position.y = 0
	crack.position.x = randf_range(750, 1150)
	add_child(crack)
	timer.wait_time = (randi() % 8) + 2
	timer.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_dead() -> void:
	get_tree().reload_current_scene()
