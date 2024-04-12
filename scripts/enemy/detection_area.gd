extends Area2D
class_name DetectionArea

@export var enemey: EnemyTemplate


func _on_body_entered(body: Player) -> void:
	enemey.player_ref = body

func _on_body_exited(_body: Player) -> void:
	enemey.player_ref = null
