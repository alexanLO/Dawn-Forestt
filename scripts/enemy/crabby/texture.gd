extends TextureTemplate
class_name CrabbyTexture

const ATTACK_EFFECT: PackedScene = preload("res://scenes/effect/general_effects/crabby_attack_effect.tscn")

var can_spawn_effect: bool = true


func animate(velocity: Vector2) -> void:
	if  enemy.can_hit or enemy.can_die or enemy.can_attack:
		action_behavior()
	else:
		move_behavior(velocity)

#==================== Moviments ====================

func move_behavior(velocity: Vector2) -> void:
	if velocity.x != 0:
		animation.play("run")
	else:
		animation.play("idle")

#==================== Actions ====================

func action_behavior() -> void:
	if enemy.can_die:
		animation.play("dead")
		enemy.can_hit = false
		enemy.can_attack = false
		attack_area_collision.set_deferred("disabled", true)
		
	elif  enemy.can_hit:
		animation.play("hit")
		enemy.can_attack = false
		attack_area_collision.set_deferred("disabled", true)
	
	elif enemy.can_attack:
		if can_spawn_effect:
			spawn_attack_effect()
			can_spawn_effect = false
		
		animation.play("attack" + enemy.attack_animation_sufflix)

func spawn_attack_effect() -> void:
	var effect = ATTACK_EFFECT.instantiate()
	get_tree().root.call_deferred("add_child", effect)
	effect.global_position = global_position
	effect.play_effect()

#==================== ====================

func _on_animation_finished(anim_name: String) -> void:
	match anim_name:
		"attack_left":
			can_spawn_effect = true
			enemy.can_attack = false
			enemy.set_physics_process(true)
		
		"attack_right":
			can_spawn_effect = true
			enemy.can_attack = false
			enemy.set_physics_process(true)
		
		"hit":
			enemy.can_hit = false
			enemy.can_attack = false
			enemy.set_physics_process(true)
		
		"dead":
			enemy.kill_enemy()
			enemy.can_attack = false
		
		"kill":
			enemy.queue_free()
