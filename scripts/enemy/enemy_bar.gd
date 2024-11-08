extends Control
class_name EnemyHealthBar

@export var health_bar: TextureProgressBar

var current_health: int

func init_bar(bar_value: int) -> void:
	# Isso faz ter um sinal para que a barra so apareça quando instanciar o inimigo.
	await get_parent().ready
	
	health_bar.max_value = bar_value
	health_bar.value = bar_value
	current_health = bar_value


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_bar(value: int) -> void:
	call_tween(value)
	current_health = value

func call_tween(new_value: int) -> void:
	var tween := get_tree().create_tween()
	var property_tweener: PropertyTweener = tween.tween_property(
		health_bar,
		"value",
		new_value,
		0.4
	)
	property_tweener.set_trans(Tween.TRANS_QUAD)   # Tipo de transição (quadrática)
	property_tweener.set_ease(Tween.EASE_IN_OUT)   # Suavização
