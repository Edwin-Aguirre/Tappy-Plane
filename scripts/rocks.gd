extends Node2D


@onready var star: Area2D = $Star

var scroll_speed: float = 120.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= scroll_speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	set_process(false)
	queue_free()


func _on_rock_body_entered(body: Node2D) -> void:
	if body is Tappy:
		body.die()


func _on_star_body_entered(body: Node2D) -> void:
	if body is Tappy:
		star.body_entered.disconnect(_on_star_body_entered)
		SignalHub.emit_on_point_scored()
		star.hide()
