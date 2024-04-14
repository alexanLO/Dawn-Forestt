extends Sprite2D
class_name TextureTemplate

@export var animation: AnimationPlayer
@export var enemy: EnemyTemplate
@export var attack_area_collision: CollisionShape2D


func animate(_velocity: Vector2) -> void:
	pass # Replace with function body.	

func _on_animation_finished(_anim_name: String) -> void:
	pass # Replace with function body.
