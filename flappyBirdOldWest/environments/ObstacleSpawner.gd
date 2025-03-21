extends Node2D

onready var timer = $Timer

var Obstacle = preload("res://Characters/Environments/Obstacles.tscn")

func _ready():
	randomize()

func _on_Timer_timeout():
	spawn_obstacles()
	
func spawn_obstacles():
	var obstacle = Obstacle.instance()
	add_child(obstacle)
	obstacle.position.y = randi()%400 + 150
