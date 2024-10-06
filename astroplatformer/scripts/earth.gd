extends Node2D
@onready var dialog: Control = $CanvasLayer/Control2
var save_file = FileAccess.open("user://save.data", FileAccess.READ)
var planet = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var _file = FileAccess.open("user://save.data", FileAccess.WRITE)
	_file.store_32(planet)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_audio_stream_player_finished() -> void:
	$Music.play()


func _on_next_body_entered(_body: Node2D) -> void:
	get_tree().change_scene_to_file("res://scenes/Level 2.tscn")

func _on_sign_entered() -> void:
	dialog.label.text = "Earth, the safest place we know. Normal gravity, a protective atmosphere, \nand breathable air. But watch out for natural disasters and climate \nchanges. Stay relaxed, but always be alert."
	$CanvasLayer/Control2.show()
	$CanvasLayer/Control2.start()

func _on_sign_exited() -> void:
	$CanvasLayer/Control2.hide()
	$CanvasLayer/Control2.stop()
