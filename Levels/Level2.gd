extends Node2D

onready var Slime = load("res://Enemy/Slime.tscn")

func _ready():
	Global.update_lives(0)
	Global.update_score(0)
	Global.next_level()

