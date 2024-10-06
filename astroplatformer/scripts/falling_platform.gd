extends TileMapLayer
var entered = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if entered == true:
		$Timer.start()

func _on_timer_timeout() -> void:
	$AnimationPlayer.play("fall")
	$Timer.stop()
	entered = false


func _on_area_2d_body_entered(_body: Node2D) -> void:
	entered = true

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fall":
		$Timer2.start()
		$Timer2.stop()

func _on_timer_2_timeout() -> void:
	$AnimationPlayer.play("RESET")
