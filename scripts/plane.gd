extends CharacterBody2D

class_name Tappy

var gravity: float = ProjectSettings.get("physics/2d/default_gravity")
var jump_force : float = -350.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var tap_icons: Node2D = $TapIcons

const TAP = preload("res://assets/ui/tap.png")
const TAP_TICK = preload("res://assets/ui/tapTick.png")

signal on_plane_died

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	fly(delta)
	
	move_and_slide()
	
	if is_on_floor():
		die()

func fly(delta) -> void:
	velocity.y += gravity * delta
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_force
		animation_player.play("jump")
		Input.set_custom_mouse_cursor(TAP_TICK)
	elif Input.is_action_just_released("jump"):
		Input.set_custom_mouse_cursor(TAP)

func die() -> void:
	animated_sprite_2d.stop()
	set_physics_process(false)
	on_plane_died.emit()


func _on_timer_timeout() -> void:
	tap_icons.hide()
