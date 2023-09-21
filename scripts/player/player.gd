extends KinematicBody2D
class_name Player

onready var player_sprite: Sprite = get_node("Texture")

var velocity: Vector2 #Ele guarda dois valores (x, y)

export(int) var speed

#Godot recomenda usar essa funcão para objetos que usam a física. Funções proprias da godot não precisa especificar
#se é void ou não.
# warning-ignore:unused_argument
func _physics_process(delta: float):
	horizontal_moviment_env()
	#Esse é um metódo do KinematicBody que aplica uma velocidade linear ao objeto e apartir disso ele vai movimentar 
	#o personagem, a vantagem é que além de movimentar o personagem, ele vai slidar. Slide faz com que ele se movimente
	#e quando ele encontrar uma colisão dependendo dos parâmetros ele vai executar determinadas ações, se não 
	#especificar um parâmetro quando ele encontrar uma colisão ele vai parar.
	velocity = move_and_slide(velocity)
	player_sprite.animate(velocity)
	
func horizontal_moviment_env() -> void:
	#Vai retorna qual é a direção. Se for pra esquerda é -1, se for para a direita é 1 e se pressionar
	#os dois ou nenhum vai ser 0.
	var input_direction: float = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = input_direction * speed
	
