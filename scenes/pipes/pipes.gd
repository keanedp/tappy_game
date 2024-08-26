extends Node2D


class_name Pipes


const OFFSCREEN: float = -500.0


func _ready() ->  void:
	SignalManager.on_plane_died.connect(_on_plane_died)


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


func _on_plane_died() -> void:
	print("pipes on plane died")
	set_process(false)
