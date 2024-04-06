extends Sprite2D
class_name EnemyTexture

@export var animation: AnimationPlayer
@export var enemy: EnemyTemplate
@export var attack_area_collision: CollisionShape2D

func animate(_velocity: Vector2) -> void:
	pass

func _on_animation_finished(anim_name):
	pass # Replace with function body.
