extends AnimatedSprite2D
class_name EffectTemplate

#Para evitar bug o play vai começar com false

func play_effect() -> void:
	play()


func _on_animation_finished():
	queue_free()
