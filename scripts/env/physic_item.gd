extends RigidBody2D
class_name PhysicItem

@export var sprite: Sprite2D
#Aqui foi usado o preload porque o efeito vai carregar antes do objeto estiver rodando.
const COLLECT_EFFECT: PackedScene = preload("res://scenes/effect/general_effects/collect_item.tscn")

var player_ref: Player = null

var item_name: String
var item_info_list: Array
var item_texture: CompressedTexture2D


func _ready() -> void:
	randomize()
	apply_random_impulse()

func apply_random_impulse() -> void:
	apply_impulse(
		Vector2.ZERO,
		Vector2(
			randi_range(-60, 60), #Raio que vai da direita ate a esquerda de onde o item ira voar. 
			-90 #Força que o item vai voar para cima.
		)
	)

func update_item_info( key: String, texture: CompressedTexture2D, item_info: Array) -> void:
	#So ira executar o que está nessa função quando o objeto(self = physicitem) estiver ready.
	#isso é para evitar bugs.
	await self.ready
	
	item_name = key
	item_texture = texture
	item_info_list = item_info
	
	sprite.texture = texture

func spawn_effect() -> void:
	var collect_effect: EffectTemplate = COLLECT_EFFECT.instantiate()
	get_tree().root.add_child(collect_effect)
	collect_effect.global_position = global_position
	collect_effect.play_effect()

#==================== Signals ====================

#Para o item excluir quando o player for pra longe
func _on_screen_exited():
	queue_free()

#Envia o item
func _on_body_entered(body):
	player_ref = body

#Esse sinal só é util se você quiser que o player aperte um botão para poder coletar o item, caso o contrario não precisa dele.
func _on_body_exited(_body):
	player_ref = null

#=================================================

func _process(delta: float) -> void:
	if player_ref != null and Input.is_action_just_pressed("interect"):
		#Emitir sinal para enviar item para inventario
		spawn_effect()
		queue_free()
