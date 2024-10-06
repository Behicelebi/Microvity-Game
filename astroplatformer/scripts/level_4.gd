extends Node2D
var initial_speed
var gravity_file = FileAccess.open("user://microgravity.data", FileAccess.READ)
var microgravity = 0


var save_file = FileAccess.open("user://save.data", FileAccess.READ)
var planet = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initial_speed = $CharacterBody2D.SPEED
	var _file = FileAccess.open("user://save.data", FileAccess.WRITE)
	_file.store_32(planet)
	$CharacterBody2D.GRAVITY = 887
	microgravity = gravity_file.get_32()
	$CharacterBody2D.SPEED -= ($CharacterBody2D.SPEED * microgravity)/100
	print($CharacterBody2D.SPEED)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_music_finished() -> void:
	$Music.play()


func _on_next_body_entered(_body: Node2D) -> void:
	get_tree().change_scene_to_file("res://scenes/The End.tscn")


func _on_death_body_entered(_body: Node2D) -> void:
	$CharacterBody2D.position = Vector2(1015,-86)

func _on_sign_entered() -> void:
	$CanvasLayer/Control2.label.text = "Uranus is freezing, with an average temperature of -224°C. Gravity is 89% \nof Earth's, but the atmosphere is full of methane and hydrogen, making it \nimpossible to breathe. Massive storms are another challenge. Make sure \nyour gear is fully prepared to avoid freezing."
	$CanvasLayer/Control2.show()
	$CanvasLayer/Control2.start()

func _on_sign_exited() -> void:
	$CanvasLayer/Control2.hide()
	$CanvasLayer/Control2.stop()

func _on_timer_timeout() -> void:
	if $CharacterBody2D.SPEED >= initial_speed:
		$Timer.stop()
	$CharacterBody2D.SPEED += (initial_speed - $CharacterBody2D.SPEED)/30
