class_name Player extends CharacterBody2D


@export var SPEED : float = 400.0
@export var JUMP_VELOCITY : float = -500.0
@export var WALL_JUMP_PUSHBACK : float = 100.0
@export var GRAVITY : float = 980
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var last_direction : int = 0
var entered : bool = false


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and entered==false:
		velocity.y += GRAVITY * delta
		#velocity += get_gravity() * delta #

	if entered == true and is_on_wall():
		animated_sprite_2d.play("climb")
		velocity.y=0
	
	if Input.is_action_pressed("ui_left"):
		animated_sprite_2d.flip_h = false
		last_direction = -1
	elif Input.is_action_pressed("ui_right"):
		animated_sprite_2d.flip_h = true
		last_direction = 1
	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		if is_on_floor():
			animated_sprite_2d.play("walk")
		velocity.x = direction * SPEED
	else:
		if is_on_floor():
			animated_sprite_2d.play("default")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	#if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
		
	#elif Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right"):
		
	#if not is_on_floor():
		
	#if is_on_floor() and (Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right")):
	#	animated_sprite_2d.play("walk")
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_jump"):
		animated_sprite_2d.play("jump")
		$"../Walk".play()
		if is_on_floor() and entered==false:
			velocity.y = JUMP_VELOCITY
		if entered==true:
			velocity.y = JUMP_VELOCITY
			if last_direction == 1:
				velocity.x -= 1000
			elif last_direction == -1:
				velocity.x += 1000
			entered=false
	elif Input.is_action_just_released("ui_jump"):
		if not is_on_floor() and velocity.y<0 and entered==false:
			velocity.y = 0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	

	move_and_slide()

func _on_area_2d_body_entered(_body: Node2D) -> void:
	entered = true

func _on_area_2d_body_exited(_body: Node2D) -> void:
	entered = false
