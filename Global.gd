extends Node

var VP = Vector2.ZERO
var score = 0
var lives = 5
var level = -1

var levels = [
	{
		"title":"Level 1 - Tutorial",
		"subtitle":"Find and destory all the asteroids",
		"asteroids":[Vector2(100,100),Vector2(980,500)],
		"enemies":[],
		"timer":100,
		"asteroids_spawned":false,
		"enemies_spawned":false
	},
	{
		"title":"Level 2 - Slime Space Party",
		"subtitle":"Crash the party!",
		"asteroids":[Vector2(100,100),Vector2(980,500),Vector2(800,200)],
		"enemies":[Vector2(150,500)],
		"timer":100,
		"asteroids)spawned":false,
		"enemies_spawned":false
	},
	{
		"title":"Level 3 - Enemy Spotted!",
		"subtitle":"Destroy the enemy ship and avoid asteroids.",
		"asteroids":[Vector2(100,100),Vector2(980,500),Vector2(800,200)],
		"enemies":[Vector2(150,500)],
		"timer":100,
		"asteroids)spawned":false,
		"enemies_spawned":false
	}
]

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	randomize()
	VP = get_viewport().size
	var _signal = get_tree().get_root().connect("size_changed", self, "_resize")
	reset()
	
func _physics_process(_delta):
	var A = get_node_or_null("/root/Game/Asteroid_Container")
	var E = get_node_or_null("/root/Game/Enemy_Container")
	if A != null and E != null:
		var L = levels[level]
		if L["asteroids_spawned"] and A.get_child_count() == 0 and L["enemies_spawned"] and E.get_child_count() == 0:
			next_level()

func reset():
	score = 0
	lives = 5
	level = -1
	for l in levels:
		l["asteroids_spawned"] = false
		l["enemies_spawned"] = false

func _unhandled_input(_event):
	if Input.is_action_pressed("quit"):
		get_tree().quit()



func _resize():
	VP = get_viewport().size


func update_score(s):
	score += s
	var Score = get_node_or_null("/root/Game/UI/HUD/Score")
	if Score != null:
		Score.text = "Score: " + str(score)

func update_lives(l):
	lives += l
	if lives <= 0:
		var _scene = get_tree().change_scene("res://UI/EndGame.tscn")
	var Lives = get_node_or_null("/root/Game/UI/HUD/Lives")
	if Lives != null:
		Lives.text = "Lives: " + str(lives)

func next_level():
	level += 1
	if level >= levels.size():
		var _scene = get_tree().change_scene("res://UI/EndGame.tscn")
	else:
		var Level_Label = get_node_or_null("/root/Game/UI/Level")
		if Level_Label != null:
			Level_Label.show_labels()
