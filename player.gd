extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var DOUBLE_JUMP = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite : AnimatedSprite2D = $animation

func _init():
	pass

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		
		velocity.y += gravity * delta
		if velocity.y > 0:
			animated_sprite.play("down")
		else:
			animated_sprite.play("up")
	else:
		animated_sprite.play("run")
		DOUBLE_JUMP=0
		


	# Handle Jump.
	if (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up")) and is_on_floor():
		velocity.y = JUMP_VELOCITY
		DOUBLE_JUMP +=1
	elif (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up")) and DOUBLE_JUMP==1:
		velocity.y = JUMP_VELOCITY
		DOUBLE_JUMP +=1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
	#	velocity.x = direction * SPEED
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
