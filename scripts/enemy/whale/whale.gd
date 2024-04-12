extends EnemyTemplate
class_name  Whale


func _ready() -> void:
	randomize()
	drop_list = {
		"Heal Potion": [
			"res://assets/item/consumable/+1_health_potion.png",
			20, #Chance de drop.
			"Health", #Tipo do item.
			5, #Valor que a poção recupera a vida.
			2 #Valor de venda.
		],
		
		"Mana Potion": [
			"res://assets/item/consumable/+1_mana_potion.png",
			15,
			"Mana", 
			5, 
			5
		],
		
		"Whale Mouth": [
			"res://assets/item/resource/whale/whale_mouth.png",
			45,
			"Resource",
			#A chave cria um dicitionary onde pode passar várias informações como craft,
			#atributos do item e etc, pode também deixar vazio caso não queira um item sem valor.
			{}, 
			2
		],
		
		"Whale Eye": [
			"res://assets/item/resource/whale/whale_eye.png",
			15,
			"Resource",
			{},
			6
		],
		
		"Whale Tail": [
			"res://assets/item/resource/whale/whale_tail.png",
			3,
			"Resource",
			{},
			25
		],
		
		"Whale Mask": [
			"res://assets/item/equipment/whale_mask.png",
			3,
			"Equipament",
			{
				"Mana": 5,
				"Magic Attack": 3
			},
			30
		]
	}
