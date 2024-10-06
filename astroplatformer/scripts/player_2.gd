class_name Player2 extends CharacterBody2D

@export var SPEED : float = 500.0
@export var JUMP_VELOCITY : float = -500.0
@export var WALL_JUMP_PUSHBACK : float = 100.0
@export var GRAVITY : float = 980
var last_direction : int = 0
var entered : bool = false
var direction_x = 0
var direction_y = 0
var touching := false
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var grab_points: Node2D = $"../Grab Points"
var grab_array : Array = []

func _ready():
	for i in grab_points.get_children():
		grab_array.append(i)

func _physics_process(_delta: float) -> void:

	if entered == true and is_on_wall():
		velocity.y=0
	
	if Input.is_action_pressed("ui_left") and last_direction==0:
		animated_sprite_2d.flip_h = false
		last_direction = -1
	elif Input.is_action_pressed("ui_right") and last_direction==0:
		animated_sprite_2d.flip_h = true
		last_direction = 1
	elif Input.is_action_pressed("ui_up") and last_direction==0:
		last_direction = -2
	elif Input.is_action_pressed("ui_down") and last_direction==0:
		last_direction = 2
	
	if is_on_wall():
		if direction_x == 1:
			direction_x = -1
		elif direction_x == -1:
			direction_x = 1
		if last_direction == 1:
			last_direction = -1
		elif last_direction == -1:
			last_direction = 1
		velocity.x = direction_x * SPEED
		#last_direction = !last_direction
	if is_on_ceiling() or is_on_floor():
		if direction_y == 1:
			direction_y = -1
		elif direction_y == -1:
			direction_y = 1
		if last_direction == 2:
			last_direction = -2
		elif last_direction == -2:
			last_direction = 2
		velocity.y = direction_y * SPEED
	if $"../Grab Points/Grab Point".entered or $"../Grab Points/Grab Point2".entered or $"../Grab Points/Grab Point3".entered or $"../Grab Points/Grab Point4".entered or $"../Grab Points/Grab Point5".entered or $"../Grab Points/Grab Point6".entered or $"../Grab Points/Grab Point7".entered or $"../Grab Points/Grab Point8".entered or $"../Grab Points/Grab Point9".entered or $"../Grab Points/Grab Point10".entered or $"../Grab Points/Grab Point11".entered or $"../Grab Points/Grab Point12".entered or $"../Grab Points/Grab Point13".entered or $"../Grab Points/Grab Point14".entered or $"../Grab Points/Grab Point15".entered or $"../Grab Points/Grab Point16".entered or $"../Grab Points/Grab Point17".entered or $"../Grab Points/Grab Point18".entered:
		animated_sprite_2d.play("default")
		touching = true
		velocity.y = 0
		velocity.x = 0
		last_direction = 0
		direction_x = 0
		direction_y = 0
	else:
		touching = false
	if touching and Input.is_action_pressed("ui_left"):
		direction_x = -1
	elif touching and Input.is_action_pressed("ui_right"):
		direction_x = 1
	if touching and Input.is_action_pressed("ui_up"):
		direction_y = -1
	elif touching and Input.is_action_pressed("ui_down"):
		direction_y = 1
	
	if last_direction == -1:
		velocity.x = -1 * SPEED
	elif last_direction == 1:
		velocity.x = 1 * SPEED
	elif last_direction == 2:
		velocity.y = 1 * SPEED
	elif last_direction == -2:
		velocity.y = -1 * SPEED
	
	if direction_x and Input.is_action_pressed("ui_jump"):
		animated_sprite_2d.play("jump")
		velocity.x = direction_x * SPEED
	if direction_y and Input.is_action_pressed("ui_jump"):
		animated_sprite_2d.play("jump")
		velocity.y = direction_y * SPEED

	move_and_slide()
