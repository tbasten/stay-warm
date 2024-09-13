extends Node2D
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var scale_timer: Timer = $ScaleTimer

var is_scaling : bool = false

func _ready() -> void:
	scale_timer.connect("timeout", _on_ScaleTimer_timeout)
	scale_timer.start()

func _on_ScaleTimer_timeout() -> void:
	if is_scaling:
		# Reverse the scale
		point_light_2d.scale.x += randf_range(0.01,0.02)
		point_light_2d.scale.y += randf_range(0.00,0.0001)
	else:
		# Initial scale change
		point_light_2d.scale.x = 3.6
		point_light_2d.scale.y = 2
	
	# Toggle the scaling state
	is_scaling = !is_scaling

	# Restart the timer
	scale_timer.wait_time = float(randf_range(0.05,0.4))
	scale_timer.start()
