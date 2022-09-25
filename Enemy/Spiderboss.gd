extends KinematicBody2D

onready var Spider_Bullet = load("res://Enemy/Spider_Bullet.tscn")
var nose = Vector2(0,-60)
var health = 20

var Effects = null
onready var Explosion = load("res://Effects/Explosion.tscn")

var score = 500

func damage(d):
	health -= d
	if health <= 0:
		Effects = get_node_or_null("/root/Game/Effects")
		if Effects != null:
			var explosion = Explosion.instance()
			Effects.add_child(explosion)
			explosion.global_position = global_position
		queue_free()
		Global.update_score(score)

func _on_Timer_timeout():
	var Player = get_node_or_null("/root/Game/Player_Container/Player")
	Effects = get_node_or_null("/root/Game/Effects")
	if Player != null and Effects != null:
		var dir = global_position.angle_to_point(Player.global_position) - PI/2
		var spiderbullet = Spider_Bullet.instance()
		spiderbullet.global_position = global_position + nose.rotated(dir)
		spiderbullet.rotation = dir
		Effects.add_child(spiderbullet)
