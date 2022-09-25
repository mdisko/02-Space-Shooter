extends Node2D

onready var Enemy = load("res://Enemy/Enemy.tscn")
onready var Slime = load("res://Enemy/Slime.tscn")
onready var Spider = load("res://Enemy/Spiderboss.tscn")
onready var Eye = load("res://Enemy/Eyeboss.tscn")
onready var AdvancedEnemy = load("res://Enemy/AdvancedShip.tscn")

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
		if not level["slimes_spawned"]:
			for pos in level["slimes"]:
				var slime = Slime.instance()
				slime.position = pos
				add_child(slime)
			level["slimes_spawned"] = true
	if get_child_count() == 0 and Global.level < Global.levels.size():
		var level = Global.levels[Global.level]
		if not level["spiderboss_spawned"]:
			for pos in level["spider"]:
				var spider = Spider.instance()
				spider.position = pos
				add_child(spider)
			level["spiderboss_spawned"] = true
	if get_child_count() == 0 and Global.level < Global.levels.size():
		var level = Global.levels[Global.level]
		if not level["eyeboss_spawned"]:
			for pos in level["eye"]:
				var eye = Eye.instance()
				eye.position = pos
				add_child(eye)
			level["eyeboss_spawned"] = true
	if get_child_count() == 0 and Global.level < Global.levels.size():
		var level = Global.levels[Global.level]
		if not level["advancedship_spawned"]:
			for pos in level["advancedship"]:
				var advancedship = AdvancedEnemy.instance()
				advancedship.position = pos
				add_child(advancedship)
			level["advancedship_spawned"] = true
