extends Node2D


class_name Pipes


const OFFSCREEN: float = -500.0


func _process(delta: float) -> void:
	position.x -= GameManager.SCROLL_SPEED * delta
	check_offscreen()


func check_offscreen() -> void:
	if position.x < OFFSCREEN:
		queue_free()


func _on_screen_exited() -> void:
	print("pipe exited screen")
	set_process(false)
	queue_free()
