extends CharacterBody2D

@onready var slime: CharacterBody2D = $"."
@onready var slimeAnimation: AnimatedSprite2D = $AnimatedSprite2D
@onready var detectLeft: RayCast2D = $RayCastleft
@onready var detectRight: RayCast2D = $RayCastRight
@onready var check_above: RayCast2D = $hitbox/slimeHead/CheckAbove

const SPEED = 100.0
const Jump_Velocity = 400.0
var direction = 1
var health = 1

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta


func _process(delta):
	if detectRight.is_colliding():
		direction = -1
	if detectLeft.is_colliding():
		direction = 1
	if direction > 0:
		slimeAnimation.flip_h = false
	elif direction < 0:
		slimeAnimation.flip_h = true

	position.x += direction * SPEED * delta

func _on_hitbox_body_entered(body):
	$"../../Player".position.y = -100
	slime.queue_free()
