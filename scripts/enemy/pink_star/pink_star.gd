extends EnemyTemplate
class_name PinkStar


func _ready() -> void:
	randomize()
	drop_list = {
		"Heal Potion": [
			"res://assets/item/consumable/health_potion.png",
			15, 
			"Health", 
			5, 
			2 
		],
		
		"Mana Potion": [
			"res://assets/item/consumable/mana_potion.png",
			8,
			"Mana", 
			5, 
			5
		],
		
		"Pink Star Mouth": [
			"res://assets/item/resource/pink_star/pink_star_mouth.png",
			10,
			"Resource",
			{}, 
			7
		],
		
		"Pink Star Belt": [
			"res://assets/item/equipment/pink_star_belt.png",
			35,
			"Equipament",
			{},
			3
		],
		
		"Pink Star Bow": [
			"res://assets/item/equipment/pink_star_bow.png",
			5,
			"Equipament",
			{
				"Health": 3,
				"Attack": 1
				},
			30
		],
		
		"Pink Star Shield": [
			"res://assets/item/equipment/pink_star_shield.png",
			2,
			"Weapon",
			{
				"Attack": 3,
				"Defense": 1
				},
			40
		]
	}
