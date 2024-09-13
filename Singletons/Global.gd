extends Node

var player: CharacterBody2D
var campfire: Node2D

func _ready():
	player = get_node("/root/Main/Player")
	campfire = get_node("/root/Main/CampFire")

func calculate_distance() -> float:
	if player and campfire:
		return (player.global_position - campfire.global_position).length()
	else:
		return INF
