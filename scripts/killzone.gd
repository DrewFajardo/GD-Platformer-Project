extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body:Node2D):
	print("you died!")
	Engine.time_scale = 0.5
	body.get_node("hitbox").queue_free()
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()


func _on_area_entered(area: Area2D) -> void:
	area.get_node("killzone").queue_free()
