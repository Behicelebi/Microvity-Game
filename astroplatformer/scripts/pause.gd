extends Control
var resumed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		if resumed == false:
			resumed = true
			$".".show()
			Engine.time_scale = 0


func _on_resume_pressed() -> void:
	resumed = false
	$".".hide()
	Engine.time_scale = 1


func _on_quit_to_title_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Menu.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
