extends Node2D

var SPEED = 215

signal score

func _physics_process(delta):
	position.x += -SPEED * delta
		
func _on_Walls_body_entered(body):
	if body is Player:
		if body.has_method("die"):
			body.die()
			
func _on_ScoreArea_body_exited(body):
	if body is Player:
		emit_signal("score")
