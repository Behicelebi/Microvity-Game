extends Node2D

var gravity_file = FileAccess.open("user://microgravity.data", FileAccess.READ)
var microgravity = 0
var save_file = FileAccess.open("user://save.data", FileAccess.READ)
var planet = 2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/Control2.label.text = "You are in the microgravity area. Staying in this place for too long ccould \nbe dangerous. Hurry up!"
	$CanvasLayer/Control2.show()
	$CanvasLayer/Control2.start()
	var _file = FileAccess.open("user://save.data", FileAccess.READ)
	planet = _file.get_32()
	if planet == 1 or planet == 3:
		planet += 1
	var _file1 = FileAccess.open("user://save.data", FileAccess.WRITE)
	_file1.store_32(planet)
	if gravity_file != null:
		var _file2 = FileAccess.open("user://microgravity.data", FileAccess.READ)
		microgravity = _file2.get_32()
	else:
		var _file2 = FileAccess.open("user://microgravity.data", FileAccess.WRITE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_next_body_entered(_body: Node2D) -> void:
	microgravity = $CanvasLayer/VBoxContainer/ProgressBar.value
	var _file = FileAccess.open("user://microgravity.data", FileAccess.WRITE)
	_file.store_32(microgravity)
	if planet == 2:
		get_tree().change_scene_to_file("res://scenes/Level 3.tscn")
	elif planet == 4:
		get_tree().change_scene_to_file("res://scenes/Level 4.tscn")

func _on_timer_timeout() -> void:
	if planet == 2:
		$Timer.wait_time = 4
	elif planet == 4:
		$Timer.wait_time = 3
	$CanvasLayer/VBoxContainer/ProgressBar.value += 5
	if $CanvasLayer/VBoxContainer/ProgressBar.value >= 100:
		$Timer.stop()

func _on_music_finished() -> void:
	$Music.play()


func _on_timer_2_timeout() -> void:
	$CanvasLayer/Control2.hide()
	$CanvasLayer/Control2.stop()
