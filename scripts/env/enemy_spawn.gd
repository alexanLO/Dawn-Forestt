extends Node2D
class_name EnemySpawner

@export var spawn_timer: Timer

@export var enemy_list: Array[Array]
@export var spawn_cooldown: float
@export var can_respawn: bool

@export var enemy_amount: int
@export var left_gap_position: int
@export var right_gap_position: int

var enemy_count: int = 0

