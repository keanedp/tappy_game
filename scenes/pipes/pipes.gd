extends Node2D


class_name Pipes


const SCROLL_SPEED: float = 120.0

func _process(delta: float) -> void:
	position.x -= SCROLL_SPEED * delta
	check_offscreen()


func check_offscreen() -> void:
	if position.x < -500.0:
		queue_free()


func _on_screen_exited() -> void:
	print("pipe exited screen")
	set_process(false)
	queue_free()
