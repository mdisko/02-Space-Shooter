extends KinematicBody2D

onready var Slime = load("res://Enemy/Slime.tscn")

var health = 5

var velocity = Vector2(0, -100.0)

func _ready():
	velocity.rotated(randf()*2*PI)
	velocity *= (randf()/2 + 1/2)

func _physics_process(delta):
	position += velocity * delta
	position.x = wrapf(position.x, 0, Global.VP.x)
	position.y = wrapf(position.y, 0, Global.VP.y)

var Effects = null
onready var Explosion = load("res://Effects/Explosion.tscn")

var score = 100

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
