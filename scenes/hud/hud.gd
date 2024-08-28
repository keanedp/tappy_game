extends Control


@onready var score_label: Label = $MarginContainer/ScoreLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_score_updated.connect(_on_score_updated)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_score_updated(score: int) -> void:
	score_label.text = str(score)
