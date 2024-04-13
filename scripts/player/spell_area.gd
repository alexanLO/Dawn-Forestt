extends Area2D
class_name FireSpell


var spell_damage: int 


func _ready() -> void:
	for children in get_children():
		if children is GPUParticles2D:
			children.emitting = true

func _on_animation_finished(_anim_name: String) -> void:
	queue_free()
