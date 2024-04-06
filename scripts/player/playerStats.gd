extends Node
class_name Stats

@export var player = Player
@export var collision_area: Area2D

@export var invencibility_timer: Timer

var shielding: bool = false

var base_health: int = 15
var base_mana: int = 10
var base_attack: int = 1
var base_magic_attack: int = 3
var base_defense: int = 1

var bonus_health: int = 0
var bonus_mana: int = 0
var bonus_attack: int = 0
var bonus_magic_attack: int = 0
var bonus_defense: int = 0

var current_health: int
var current_mana: int

var max_health: int
var max_mana: int

var current_exp: int = 0

var level: int = 1
#O Dictionary é como se fosse uma lista, rém apartir da chave do dictionary pode ser acessado um valor.
var level_dict: Dictionary = {
	#As chave são os niveis e o numero é a quantidade de exp que precisa.
	"1": 25,
	"2": 33,
	"3": 49,
	"4": 66,
	"5": 93,
	"6": 135,
	"7": 186,
	"8": 251,
	"9": 356
}

func _ready() -> void:
	current_health = base_health + bonus_health
	max_health = current_health
	
	current_mana = base_mana + bonus_mana
	max_mana = current_mana

func update_exp(value: int) -> void:
	current_exp += value
	if current_exp >= level_dict[str(level)] and level < 9:
		var leftover: int = current_exp - level_dict[str(level)]
		current_exp = leftover
		level += 1
		on_level_up()

func on_level_up() -> void:
	current_health = base_health + bonus_health
	current_mana = base_mana + bonus_mana

func update_health(type: String, value: int) -> void:
	match type:
		"Increase":
			current_health += value
			if current_health >= max_health:
				current_health = max_health
		"Decrease":
			verify_shield(value)
			if current_health <= 0:
				player.dead = true
			else:
				player.on_hit = true
				player.attacking = false

func verify_shield(value: int) -> void:
	if shielding:
		if (base_defense + bonus_defense) >= value:
			return
			
		var damage = abs((base_defense + bonus_defense) - value)
		if damage > 0:
			current_health -= damage
			
	else:
		current_health -= value

func update_mana(type: String, value: int) -> void:
	match type:
		"Increase":
			current_mana += value
			if current_mana >= max_mana:
				current_mana = max_mana 
				
		"Decrease":
			current_mana -= value

func _on_InvecibilityTimer_timeout() -> void:
	collision_area.set_deferred("monitoring", true)

func _on_collision_area_entered(area):
		if area.name == "EnemyAttackArea":
			update_health("Decrease", area.damage)
			collision_area.set_deferred("monitoring", false)
			invencibility_timer.start(area.invencibility_timer)
