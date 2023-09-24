extends Sprite
class_name PlayerTexture

var normal_attack: bool = false
var defending_off: bool = false
var crouching_off: bool = false
var sufflix: String = "_right"

export(NodePath) onready var animation = get_node(animation) as AnimationPlayer
export(NodePath) onready var player = get_node(player) as KinematicBody2D

func animate(direction: Vector2) -> void:
	verify_position(direction)
	
	if player.attacking or player.defending or player.crouching or player.next_to_wall():
		action_behavior()
	elif direction.y != 0:
		vertical_behavior(direction)
	elif player.landing == true:
		animation.play("landing")
		player.set_physics_process(false) #a função physics_process será encerrada, não aplicando seus metodos
	else:
		horizontal_behavior(direction)
	

func verify_position(direction: Vector2) -> void:
	if direction.x > 0:
		flip_h = false
		sufflix = "_right"
		player.direction = -1 #Força para sair da parede, ela tem que ser inversa da direção olhando.
		position = Vector2.ZERO #wall slide directio
		player.wall_ray.cast_to = Vector2(5.5, 0)		
	elif direction.x < 0:
		flip_h = true
		sufflix = "_left"
		player.direction = 1 #Força para sair da parede, ela tem que ser inversa da direção olhando.
		position = Vector2(-2, 0) #wall slide directio
		player.wall_ray.cast_to = Vector2(-7.5, 0)

func action_behavior() -> void:
	if player.next_to_wall():
		animation.play("wall_slide")
	elif player.attacking and normal_attack:
		animation.play("attack" + sufflix)
	#O defense_off e o crouching_off é para quando a pessoa segurar o botão o personagem continuar defendendo ou agachado.
	elif player.defending and defending_off:
		animation.play("defense")
		defending_off = false
	elif player.crouching and crouching_off:
		animation.play("crouch")
		crouching_off = false

func horizontal_behavior(direction: Vector2) -> void:
	if direction.x != 0:
		animation.play("run")
	else:
		animation.play("idle")
		

func vertical_behavior(direction: Vector2) -> void:
	if direction.y > 0:
		player.landing = true
		animation.play("fall")
	elif direction.y < 0:
		animation.play("jump")

func _on_Animation_animation_finished(anim_name: String):
	match anim_name:
		"landing":
			player.landing = false
			player.set_physics_process(true) #Physics_process irá voltar a funcionar apos o landing.
		"attack_left":
			normal_attack = false
			player.attacking = false
		"attack_right":
			normal_attack = false
			player.attacking = false
