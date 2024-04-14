extends EnemyTemplate
class_name Crabby


func _ready() -> void:
	randomize()
	drop_list = {
		"Heal Potion": [
			"res://assets/item/consumable/health_potion.png",
			15, #Chance de drop.
			"Health", #Tipo do item.
			5, #Valor que a poção recupera a vida.
			2 #Valor de venda.
		],
		
		"Mana Potion": [
			"res://assets/item/consumable/mana_potion.png",
			8,
			"Mana", 
			5, 
			5
		],
		
		"Crabby Pincers": [
			"res://assets/item/resource/crabby/crab_pincers.png",
			10,
			"Resource",
			#A chave cria um dicitionary onde pode passar várias informações como craft,
			#atributos do item e etc, pode também deixar vazio caso não queira um item sem valor.
			{}, 
			7
		],
		
		"Crabby Eye": [
			"res://assets/item/resource/crabby/crab_eye.png",
			35,
			"Resource",
			{},
			3
		],
		
		"Crabby Belt": [
			"res://assets/item/equipment/crabby_belt.png",
			5,
			"Equipament",
			{
				"Health": 3,
				"Attack": 1
				},
			30
		],
		
		"Crabby Axe": [
			"res://assets/item/equipment/crabby_axe.png",
			2,
			"Weapon",
			{
				"Attack": 3,
				"Defense": 1
				},
			40
		]
	}
