extends Control


@onready var score_label: Label = $MarginContainer/ScoreLabel
@onready var press_space_label: Label = $MarginContainer/PressSpaceLabel
@onready var game_over_label: Label = $MarginContainer/GameOverLabel
@onready var timer: Timer = $Timer

var score: int = 0


func _ready() -> void:
	score = 0


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		GameManager.load_main_scene()
	elif press_space_label.visible == true and event.is_action_pressed("jump"):
		HighScoreManager.high_score = score
		GameManager.load_main_scene()


func _enter_tree() -> void:
	SignalHub.on_plane_died.connect(on_plane_died)
	SignalHub.on_point_scored.connect(on_point_scored)


func on_plane_died() -> void:
	game_over_label.show()
	timer.start()


func on_point_scored() -> void:
	score += 1
	score_label.text = "%04d" % score


func _on_timer_timeout() -> void:
	game_over_label.hide()
	press_space_label.show()
