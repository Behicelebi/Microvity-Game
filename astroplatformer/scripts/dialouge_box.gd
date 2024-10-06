extends Control
@onready var label: Label = $Label
var finished = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func start():
	finished = false
	$AnimationPlayer.play("dialog")
	$AudioStreamPlayer.play()

func stop():
	$AnimationPlayer.stop()
	$AudioStreamPlayer.stop()

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	finished = true
	$AudioStreamPlayer.stop()


func _on_audio_stream_player_finished() -> void:
	if finished == false:
		$AudioStreamPlayer.play()
