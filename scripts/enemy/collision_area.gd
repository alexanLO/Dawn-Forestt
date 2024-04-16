extends Area2D
class_name CollisionArea

@export var timer: Timer
@export var enemy: EnemyTemplate

@export var health: int
@export var invunerability_timer: float


func _on_collision_area_entered(area):
	if area.get_parent() is Player:
		var player_stats: Stats = area.get_parent().get_node("Stats")
		var player_attack: int = player_stats.base_attack + player_stats.bonus_attack
		update_health(player_attack)
	elif area is FireSpell:
		update_health(area.spell_damage)
		set_deferred("monitoring", false)
		timer.start(invunerability_timer)

func _on_timer_timeout():
	set_deferred("monitoring", true)

func update_health(damage: int) -> void:
	health -= damage
	enemy.spawn_floating_text("-", "Damage", damage)
	if health <= 0:
		enemy.can_die = true
		return
	
	enemy.can_hit = true
