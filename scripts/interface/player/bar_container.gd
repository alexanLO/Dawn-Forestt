extends Control
class_name BarCointainer

@export var health_bar: TextureProgressBar
@export var mana_bar: TextureProgressBar
@export var exp_bar: TextureProgressBar

var current_health: int
var current_mana: int
var current_exp: int


func init_bar(health: int, mana: int, max_exp: int) -> void:
	#Configuração do valor max inicial do personagem baseado no que esta la na cena do player:
	health_bar.max_value = health
	mana_bar.max_value = mana
	exp_bar.max_value = max_exp
	
	#Configuração do valor atual:
	health_bar.value = health
	mana_bar.value = mana
	exp_bar.value = 0
	
	current_health = health
	current_health = mana
	current_health = 0

#Confiuguração para aumentar os status de vida, mana do personagem com base no up level e equipamento:
func increase_max_value(type: String, max_value: int, value: int) -> void:
	match type:
		"Health":
			health_bar.max_value = max_value
			health_bar.value = value
			current_health = value
		"Mana":
			mana_bar.max_value = max_value
			mana_bar.value = value
			current_mana = value

#Configuração para aumentar visualmente o valor da barra de vida, mana e exp:
func update_bar(type: String, value: int) -> void:
	match  type:
		"HealthBar":
			call_tween(health_bar, current_health, value)
			#diz qual o novo valor da barra:
			current_health = value 
		"ManaBar":
			call_tween(mana_bar, current_mana, value)
			current_mana = value
		"ExpBar":
			call_tween(exp_bar, current_exp, value)
			current_exp = value

#Vai pegar  o valor antigo e colocar o valor novo:
func call_tween(bar: TextureProgressBar, initial_value: int, final_value: int) -> void:
	#O tween inicia instantaneamente após você criá-lo então depois de você chamar o tween_property
	#ele já vai iniciar, diferentemente da versão anterior e vocês NÃO devem criar o tween no onready var.
	var tween: Tween = create_tween()
	tween.tween_property(
		bar,
		"value",
		final_value,
		0.2 #Duração do aumento de barra.
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	
	var _start: bool = tween.start()
