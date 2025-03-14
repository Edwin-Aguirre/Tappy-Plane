extends CharacterBody2D

var gravity: float = ProjectSettings.get("physics/2d/default_gravity")
var jump_force : float = -350.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

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

func die() -> void:
	animated_sprite_2d.stop()
	set_physics_process(false)
