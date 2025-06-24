extends CharacterBody2D

@onready var slime: CharacterBody2D = $"."
@onready var slimeAnimation: AnimatedSprite2D = $AnimatedSprite2D
@onready var detectLeft: RayCast2D = $RayCastleft
@onready var detectRight: RayCast2D = $RayCastRight

const SPEED = 60.0
const Jump_Velocity = 400.0
var direction = 0.5
var health = 1

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta


func _process(delta):
	if detectRight.is_colliding():
		direction = -0.5
	if detectLeft.is_colliding():
		direction = 0.5
	if direction > 0:
		slimeAnimation.flip_h = false
	elif direction < 0:
		slimeAnimation.flip_h = true
	position.x += direction * SPEED * delta
	
func _on_hitbox_body_entered(_body: Node2D) -> void:
	$"../../Player".velocity.y = -200
	print("clicked!")
