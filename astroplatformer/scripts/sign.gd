extends Sprite2D
signal entered
signal exited
var entered1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_2d_body_entered(_body: Node2D) -> void:
	entered1 = true
	entered.emit()


func _on_area_2d_body_exited(_body: Node2D) -> void:
	entered1 = false
	exited.emit()
