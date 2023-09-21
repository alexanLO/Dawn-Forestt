extends KinematicBody2D
class_name Player

onready var player_sprite: Sprite = get_node("Texture")

var velocity: Vector2 #Ele guarda dois valores (x, y)
var jump_count: int = 0
var landing: bool = false

export(int) var jump_speed
export(int) var player_gravity
export(int) var speed

#Godot recomenda usar essa funcão para objetos que usam a física. Funções proprias da godot não precisa especificar
#se é void ou não.
# warning-ignore:unused_argument
func _physics_process(delta: float):
	horizontal_moviment_env()
	vertical_moviment_env()
	gravity(delta)
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

func vertical_moviment_env() -> void:
	#Essa condição é necessária para resetar os pulos e a pessoa poder da mais 2 pulos, se essa condição
	#for colocada depois do ins_action_just... ele vai passar a dar 3 pulos.
	if is_on_floor():
		jump_count = 0
	#Essa condição faz o jogador das 2 pulos e ele analisa se a pessoa aperta o espaço e segurar ou
	#aperta rapidamente ele faça apenas uma vez a ação.
	if Input.is_action_just_pressed("ui_select") and jump_count < 2:
		jump_count += 1
		velocity.y = jump_speed

#Aplicando a velocidade em y, delta e valor de gravidade a cada frame.
func gravity(delta: float) -> void:
	velocity.y += delta*player_gravity
	#Limitador de velocidade de queda na vertical.
	if velocity.y >= player_gravity:
		velocity.y = player_gravity
