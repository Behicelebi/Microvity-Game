extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_music_finished() -> void:
	$Music.play()

func _on_sign_entered() -> void:
	$CanvasLayer/Control2.label.text = "You did it! \nYou went through some planets and learned about microgravity!"
	$CanvasLayer/Control2.show()
	$CanvasLayer/Control2.start()

func _on_sign_exited() -> void:
	$CanvasLayer/Control2.hide()
	$CanvasLayer/Control2.stop()
