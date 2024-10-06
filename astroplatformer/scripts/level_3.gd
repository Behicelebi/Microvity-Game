extends Node2D
var initial_speed
@onready var mars_bg_2: Sprite2D = $MarsBg2
var layer := 1
var speedOffset := 0.1
@onready var character_body_2d: Player = $CharacterBody2D
@onready var camera_2d: Camera2D = $Camera2D
var gravity_file = FileAccess.open("user://microgravity.data", FileAccess.READ)
var microgravity = 0


var save_file = FileAccess.open("user://save.data", FileAccess.READ)
var planet = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initial_speed = $CharacterBody2D.SPEED
	var _file = FileAccess.open("user://save.data", FileAccess.WRITE)
	_file.store_32(planet)
	microgravity = gravity_file.get_32()
	$CharacterBody2D.GRAVITY = 370
	$CharacterBody2D.SPEED -= ($CharacterBody2D.SPEED * microgravity)/100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_music_finished() -> void:
	$Music.play()


func _on_next_body_entered(_body: Node2D) -> void:
	get_tree().change_scene_to_file("res://scenes/Level 2.tscn")

func _on_sign_entered() -> void:
	$CanvasLayer/Control2.label.text = "On Mars, gravity is only 38% of Earth's. You might experience muscle and\n bone loss, so be careful. The atmosphere is very thin, exposing you to \nradiation. Prepare for dust storms and make sure you stay in protective\n environments."
	$CanvasLayer/Control2.show()
	$CanvasLayer/Control2.start()

func _on_sign_exited() -> void:
	$CanvasLayer/Control2.hide()
	$CanvasLayer/Control2.stop()

func _on_timer_timeout() -> void:
	if $CharacterBody2D.SPEED >= initial_speed:
		$Timer.stop()
	$CharacterBody2D.SPEED += (initial_speed - $CharacterBody2D.SPEED)/30
