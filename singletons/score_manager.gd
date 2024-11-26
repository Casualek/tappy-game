extends Node

const SCORES_PATH = "user://tappy.dat"

var _score: int = 0
var _highScore: int = 0

func _ready() -> void:
	load_high_score()

func get_score() -> int:
	return _score

func get_high_score() -> int:
	return _highScore

func set_score(value: int) -> void:
	_score = value
	if _score > _highScore:
		_highScore = _score
	SignalManager.on_score_udpated.emit(_score)

func increment_score() -> void:
	set_score(_score + 1)

func load_high_score() -> void:
	var file: FileAccess = FileAccess.open(SCORES_PATH, FileAccess.READ)
	if file:
		if file.get_length() > 0:
			_highScore = file.get_as_text().to_int()
		file.close()
	else:
		"Failed to load file"

func save_high_score_to_file() -> void:
	var file: FileAccess = FileAccess.open(SCORES_PATH, FileAccess.WRITE)
	if file:
		file.store_string(str(_highScore))
	file.close()
