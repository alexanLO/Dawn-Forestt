extends Label
class_name FloatingText


var tween: Tween = create_tween()

var mass: int = 20
var value: int 

var velocity: Vector2
var gravity: Vector2 = Vector2.UP

var type: String = ""
var type_sign: String = ""

@export var heal_color: Color
@export var mana_color: Color
@export var exp_color: Color
@export var damage_color: Color


func _ready() -> void:
	randomize()
	velocity = Vector2(
		randi_range(-10, 10),
		-30
	)
	
	floatint_text()

func floatint_text() -> void:
	text = type_sign + str(value)
	match type:
		"Heal":
			modulate = heal_color
		
		"Mana":
			modulate = mana_color
		
		"Exp":
			modulate = exp_color
		
		"Damage":
			modulate = damage_color
	
	#interpolate()
#
#func interpolate() -> void:
	##Surge o objeto
	#tween.interpolate_property(
		#self,
		#"rect_scale",
		#Vector2(0.0, 0.0),
		#Vector2(1.0, 1.0),
		#0.3,
		#Tween.TRANS_LINEAR,
		#Tween.EASE_OUT,
	#)
	#
	##Diminui a scale
	#tween.interpolate_property(
		#self,
		#"rect_scale",
		#Vector2(1.0, 1.0),
		#Vector2(0.4, 0.4),
		#1.0,
		#Tween.TRANS_LINEAR,
		#Tween.EASE_OUT,
		#0.6
	#)

	#Diminui a visibilidade
	#tween.interpolate_property(
		#self,
		#"modulate:a",
		#1.0,
		#0.0,
		#0.3,
		#Tween.TRANS_LINEAR,
		#Tween.EASE_OUT,
		##Tempo de delay do tween
		#0.7 
	#)
	#
	#tween.play()
	##await(tween, "tween_all_completed")
	#queue_free()

func _process(delta: float) -> void:
	velocity += gravity * mass * delta
	position += velocity * delta
