extends CharacterBody2D

@onready var slimeAnimation: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 100.0

var gravuity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = Vector2 (1,0)
var health = 1

func _physics_process(delta):
	
func _set_animation():
	if direction.x > 0:
		slimeAnimation.flip_h = false
	elif direction.x < 0:
		slimeAnimation.flip_h = true
