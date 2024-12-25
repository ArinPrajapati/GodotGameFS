extends CharacterBody2D


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 150.0 
const JUMP_VELOCITY = -300.0     

# https://www.youtube.com/watch?v=LOhfqjmasi0 continue from here 

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

# Direction is : 1 , 0  , -1
	var direction := Input.get_axis("move_left", "move_right")
	
	
 # flip the sprite

	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		
		
	# jump animation
	if is_on_floor():
		#play animation 
		if direction == 0:
			animated_sprite_2d.play("idle")
		else: 
			animated_sprite_2d.play("run") 
	else:
		animated_sprite_2d.play("Jump")
	
	
	
	# apply movement 
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
