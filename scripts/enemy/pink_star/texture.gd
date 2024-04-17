extends TextureTemplate
class_name PinkTexture


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
		
	elif  enemy.can_hit:
		animation.play("hit")
		enemy.can_attack = false
		
	elif enemy.can_attack:
		animation.play("attack_anticipation")
		enemy.set_physics_process(false)

#==================== ====================

func _on_animation_finished(anim_name: String) -> void:
	match anim_name:
		"attack_left":
			enemy.can_attack = false
			enemy.set_physics_process(true)
		"attack_right":
			enemy.can_attack = false
			enemy.set_physics_process(true)
		"attack_anticipation":
			animation.play("attack" + enemy.attack_animation_sufflix)
		"hit":
			enemy.can_hit = false
			enemy.set_physics_process(true)
		"dead":
			enemy.kill_enemy()
		"kill":
			enemy.queue_free()
