extends RigidBody2D
class_name PhysicItem

@export var texture: Sprite2D

var player_ref: Player = null

var item_name: String
var item_info_list: Array
var item_texture: CompressedTexture2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	apply_random_impulse()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func apply_random_impulse() -> void:
	apply_impulse(
		Vector2.ZERO,
		Vector2(
			randf_range(-60, 60), #Raio que vai da direita ate a esquerda de onde o item ira voar. 
			-90 #Força que o item vai voar para cima.
		)
	)

func update_item_info( key: String, texture: CompressedTexture2D, item_info: Array) -> void:
	#So ira executar o que está nessa função quando o objeto(self = physicitem) estiver ready.
	#isso é para evitar bugs.
	await(self)
	
	item_name = key
	item_texture = texture
	item_info_list = item_info
	
	texture.texture = texture
	 

func _on_screen_exited():
	queue_free()

func _on_body_entered(body):
	player_ref = body

func _on_body_exited(_body):
	player_ref = null

func _physics_process(delta: float) -> void:
	if player_ref != null and Input.is_action_just_pressed("interect"):
		#Emitir sinal para enviar item para inventario
		queue_free()
