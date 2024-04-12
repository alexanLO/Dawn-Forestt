extends CharacterBody2D
class_name EnemyTemplate

@export var texture: Sprite2D
@export var floor_ray: RayCast2D
@export var animation: AnimationPlayer

var can_die: bool = false
var can_hit: bool = false
var can_attack: bool = false

var player_ref: Player = null

@export var speed: int
@export var gravity_speed: int
#Limite de qquando ele vai alcançar o player para atacar.
@export var proximity_threshould: int 
@export var raycast_default_position: int


func _physics_process(delta: float) -> void:
	gravity(delta)
	move_behavior()
	verify_position()
	move_and_slide()
	texture.animate(velocity)


#==================== Moviments ====================

func move_behavior() -> void:
	if player_ref != null:
		var distance: Vector2 = player_ref.global_position - global_position
		var direction: Vector2 = distance.normalized()
		#Condição para o inimigo atacar pela distancia que ele está do inimigo:
		if abs(distance.x) <= proximity_threshould:
			#Para não atacar andando:
			velocity.x = 0 
			can_attack = true
		elif floor_collision() and not can_attack:
			velocity.x = direction.x * speed
		#Para o inimigo parar e não cair do penhasco:
		else :
			velocity.x = 0
		#Para não executar o que está abaixo:
		return 
	velocity.x = 0

func verify_position() -> void:
	if player_ref != null:
		#Ele pega o sign do que tem a frente:
		var direction: float = sign(player_ref.global_position.x - global_position.x)
		
		if direction > 0:
			texture.flip_h = true
			floor_ray.position.x = abs(raycast_default_position)
		elif direction < 0:
			texture.flip_h = false
			#Como o valor já [e negativo não precisa passar o abs() para torna positivo:
			floor_ray.position.x = raycast_default_position

#É para certificar que o inimigo vai ficar colado no chão e não flutuando
func gravity(delta: float) -> void:
	velocity.y += delta * gravity_speed

func floor_collision() -> bool:
	if floor_ray.is_colliding():
		return true
	
	return false

func kill_enemy() -> void:
	animation.play("kill")
