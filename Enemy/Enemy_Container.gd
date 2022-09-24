extends Node2D

onready var Enemy = load("res://Enemy/Enemy.tscn")
onready var Slime = load("res://Enemy/Slime.tscn")

func _physics_process(_delta):
	if get_child_count() == 0 and Global.level < Global.levels.size():
		var level = Global.levels[Global.level]
		if not level["enemies_spawned"]:
			for pos in level["enemies"]:
				var enemy = Enemy.instance()
				enemy.position = pos
				add_child(enemy)
			level["enemies_spawned"] = true
	if get_child_count() == 0 and Global.level < Global.levels.size():
		var level = Global.levels[Global.level]
		if not level["enemies_spawned"]:
			for pos in level["enemies"]:
				var slime = Slime.instance()
				slime.position = pos
				add_child(slime)
			level["enemies_spawned"] = true
