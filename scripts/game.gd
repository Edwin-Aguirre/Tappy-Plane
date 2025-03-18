extends Node2D

@onready var upper_point: Marker2D = $UpperPoint
@onready var lower_point: Marker2D = $LowerPoint
@onready var rocks_holder: Node = $RocksHolder

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_rocks()

func _enter_tree() -> void:
	SignalHub.on_plane_died.connect(_on_plane_died)


func _on_spawn_timer_timeout() -> void:
	spawn_rocks()


func spawn_rocks():
	var new_rocks =  preload("res://scenes/rocks.tscn").instantiate()
	new_rocks.position.x = upper_point.position.x
	new_rocks.position.y = randf_range(lower_point.position.y, upper_point.position.y)
	rocks_holder.add_child(new_rocks)


func _on_plane_died() -> void:
	get_tree().paused = true
