extends CharacterBody2D

func _ready() -> void:
	var bullet_timer = get_node("Timer")
	bullet_timer.wait_time = 2.0
	bullet_timer.timeout.connect(_on_bullet_timer_timeout)
	bullet_timer.start()
	
func _on_bullet_timer_timeout() -> void:
	var rand = randi() % 2
	match rand:
		0:
			single_bullet()
		1:
			triple_spread_bullet()
	
func single_bullet() -> void:
	add_child(Bullet.create_bullet(Vector2(0, 50)))
	
func triple_spread_bullet() -> void:
	add_child(Bullet.create_bullet(Vector2(-20, 50)))
	add_child(Bullet.create_bullet(Vector2(0, 50)))
	add_child(Bullet.create_bullet(Vector2(20, 50)))


func _physics_process(delta: float) -> void:
	move_and_slide()
