extends Node


const HIGH_SCORE_PATH = "user://tappy_highscore"

var score: int = 0: set = _set_score
var high_score: int = 0


func _ready() -> void:
	load_highscore()
	
	
func increment_score() -> void:
	score += 1
	

func _set_score(value) -> void:
	score = value
	
	if score > high_score:
		high_score = score
		
	SignalManager.on_score_updated.emit(score)
	
	
func load_highscore() -> void:
	var file = FileAccess.open(HIGH_SCORE_PATH, FileAccess.READ)
	if file:
		if file.get_length() > 0:
			high_score = file.get_32()
			file.close()
			return
	else:
		print("FAILED to open high score file")
		
	high_score = 0
	

func save_highscore() -> void:
	var file = FileAccess.open(HIGH_SCORE_PATH, FileAccess.WRITE)
	if file:
		file.store_32(high_score)
		file.close()
	else:
		print("FAILED to open high score file")
