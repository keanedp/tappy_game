extends Node


var score: int = 0: set = _set_score
var high_score: int = 0


func _ready() -> void:
	pass
	
	
func increment_score() -> void:
	score += 1
	

func _set_score(value) -> void:
	score = value
	
	if score > high_score:
		high_score = score
		
	SignalManager.on_score_updated.emit(score)
		
