extends Area2D
class_name DetectionArea

@export var enemy: EnemyTemplate

func _on_body_entered(body: Player) -> void:
	enemy.player_ref = body

func _on_body_exited(_body: Player) -> void:
	enemy.player_ref = null
