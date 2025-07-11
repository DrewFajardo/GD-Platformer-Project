extends CharacterBody2D


const SPEED = 70.0
const JUMP_VELOCITY = -240.0
@onready var textures: AnimatedSprite2D = $textures
@onready var timer: Timer = $Hit_Box/damaged/Timer

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	#if is_on_floor():
		#velocity.y += -200
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0 :
		textures.flip_h = false
	elif direction < 0:
		textures.flip_h = true
	
	if is_on_floor():
		if direction == 0:
			textures.play("idle")
		else:
			textures.play("run")
	else:
		textures.play("jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_hit_box_body_entered(_body):
	velocity.y = -240
	print("you died!")
	Engine.time_scale = 0.5
	timer.start()
	
func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
