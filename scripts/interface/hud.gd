extends CanvasLayer

@onready var inventory: Inventory = $InventoryContainer

func _process(_delta: float) -> void:
		show_inventory()

func show_inventory() -> void:
	if Input.is_action_just_pressed("inventory"):
		if inventory.is_visible:
			inventory.is_visible = false
			inventory.animation.play("hide_container")
			return
			
		if inventory.is_visible == false:
			inventory.is_visible = true
			inventory.animation.play("show_container")
			return
