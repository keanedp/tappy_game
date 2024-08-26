extends Node2D


const PIPES = preload("res://scenes/pipes/pipes.tscn")


@onready var spawn_timer: Timer = $SpawnTimer
@onready var pipe_spawn_upper: Marker2D = $PipeSpawnUpper
@onready var pipe_spawn_lower: Marker2D = $PipeSpawnLower
@onready var pipes_holder: Node = $PipesHolder


func _ready() -> void:
	spawn_pipes()


func _process(delta: float) -> void:
	pass


func spawn_pipes() -> void:
	var new_pipes: Pipes = PIPES.instantiate()
	var yPosition:float = randf_range(pipe_spawn_upper.position.y, pipe_spawn_lower.position.y)
	new_pipes.position = Vector2(pipe_spawn_lower.position.x, yPosition)
	pipes_holder.add_child(new_pipes)


func _on_spawn_timer_timeout() -> void:
	spawn_pipes()


func stop_pipes() -> void:
	spawn_timer.stop()
	for pipe in pipes_holder.get_children():
		pipe.set_process(false)

func _on_plane_died() -> void:
	stop_pipes()
