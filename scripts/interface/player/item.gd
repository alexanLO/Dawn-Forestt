extends TextureRect
class_name InterfaceItem

signal empty_slot
#signal item clicked

@onready var item_texture: TextureRect = $Texture
@onready var item_amount: Label = $Amount
@onready var item_index: int = get_index()

var type_value: int
var sell_price: int
var amount: int = 0

var can_click: bool = false

var item_dictionary: Dictionary = {}

var item_name: String = ""
var item_type: String
var item_image_path: String

var texture_list: Array = [
	"res://assets/interface/intentory/item_background/type_1.png",
	"res://assets/interface/intentory/item_background/type_2.png",
	"res://assets/interface/intentory/item_background/type_3.png"
]

func _ready() -> void:
	#Deixar a textura dos slots random
	randomize()
	var random_index: int = randi() % texture_list.size()
	texture = load(texture_list[random_index])


func _on_mouse_entered() -> void:
	can_click = true
	modulate.a = 0.5


func _on_mouse_exited() -> void:
	can_click = false
	modulate.a = 1.0
	pass # Replace with function body.

func update_item(item: String, item_image: TextureRect, item_info: Array) -> void:
	item_image_path = item_info[0]
	item_type = item_info[1]
	
	match  item_type:
		"Equipament":
			amount = 1
			item_dictionary = item_info[2]
			
		"Weapon":
			amount = 1
			item_dictionary = item_info[2]

		"Resource":
			amount += item_info[4]
			type_value = item_info[2]

		"Health":
			amount += item_info[5]
			type_value -= item_info[2]

		"Mana":
			amount += item_info[5]
			type_value -= item_info[2]
		
	sell_price = item_info[3]
	item_name = item
	item_amount.text = str(amount)
	item_texture = item_image
	
	if amount != 0 and item_type != "Equipament" and item_type != "Weapon":
		item_amount.show()
		item_texture.show()
		return
		
	if item_type == "Equipament" and item_type == "Weapon":
		item_texture.show()
		return

func update_slot() -> void:
	item_amount.hide()
	item_texture.hide()
	
	amount = 0
	item_name = ""
	item_type = ""
	type_value = 0
	sell_price = 0
	item_image_path = ""
