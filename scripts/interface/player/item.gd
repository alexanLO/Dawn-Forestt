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
