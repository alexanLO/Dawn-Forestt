extends Area2D
class_name CollisionArea

@export var health: int
@export var invunerability_timer: Timer
@export var enemy: EnemyTemplate


func update_health(damage: int) -> void:
	health -= damage
	if health <= 0:
		enemy.can_die = true
		return
	
	enemy.can_hit = true


func _on_area_entered(area):
	if area.get_parent() is Player:
		var player_stats: Stats = area.get_parent().get_node("Stats")
		var player_attack: int = player_stats.base_attack + player_stats.bonus_attack
		update_health(player_attack)
