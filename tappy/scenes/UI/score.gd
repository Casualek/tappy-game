extends Control

@onready var score: Label = $score


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_score_udpated.connect(update)


func update(score_: int) -> void:
	score.text = str(score_)
