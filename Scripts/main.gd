extends Node2D

@onready var temp_data: Label = $CanvasLayer/GridContainer/TempData
@onready var distance_data: Label = $CanvasLayer/GridContainer/DistanceData

func _process(delta: float) -> void:
	temp_data.text = str(round(PlayerStats.player_temp))
	distance_data.text = str(round(PlayerStats.player_distance))
