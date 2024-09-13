extends CharacterBody2D
@onready var player_animation: AnimatedSprite2D = $PlayerAnimation
@export var speed = 400  # speed in pixels/sec

func move_character(delta) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	
	if Input.is_action_pressed("right"):
		player_animation.flip_h = false
		player_animation.play("walk")
		
	elif Input.is_action_pressed("left"):
		player_animation.flip_h = true
		player_animation.play("walk")
		
	elif Input.is_action_pressed("up"):
		player_animation.play("walk_up")
		
	elif Input.is_action_pressed("down"):
		player_animation.play("walk_down")
	else:
		player_animation.play("idle")
	move_and_slide()

func _physics_process(delta):
	move_character(delta)

func _process(delta: float) -> void:
	PlayerStats.player_distance = Global.calculate_distance()
	if PlayerStats.player_distance > 100:
		remove_playerTemp(delta,0.5)

func remove_playerTemp(delta: float, speed):
	var temp = PlayerStats.player_temp
	temp -= speed * delta
	PlayerStats.player_temp = temp
