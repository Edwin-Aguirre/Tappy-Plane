extends Node2D

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
