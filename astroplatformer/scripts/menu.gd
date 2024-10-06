extends Control
var save_file = FileAccess.open("user://save.data", FileAccess.READ)
var planet = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.time_scale = 1
	if save_file != null:
		load_game()
	else:
		var _file = FileAccess.open("user://save.data", FileAccess.WRITE)
	print(planet)

func load_game():
	var _file = FileAccess.open("user://save.data", FileAccess.READ)
	planet = _file.get_32()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Game.tscn")


func _on_music_finished() -> void:
	$Music.play()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_credits_pressed() -> void:
	$VBoxContainer.hide()
	$Label.hide()
	$Back.show()
	$"Credits Label".show()
	$"Credits Label2".show()

func _on_back_pressed() -> void:
	$VBoxContainer.show()
	$Label.show()
	$Back.hide()
	$"Credits Label".hide()
	$"Credits Label2".hide()


func _on_play_2_pressed() -> void:
	if planet==1:
		get_tree().change_scene_to_file("res://scenes/Game.tscn")
	elif planet==2:
		get_tree().change_scene_to_file("res://scenes/Level 2.tscn")
	elif planet==3:
		get_tree().change_scene_to_file("res://scenes/Level 3.tscn")
	elif planet==4:
		get_tree().change_scene_to_file("res://scenes/Level 2.tscn")
	elif planet==5:
		get_tree().change_scene_to_file("res://scenes/Level 4.tscn")
	elif planet==6:
		get_tree().change_scene_to_file("res://scenes/Level 2.tscn")
