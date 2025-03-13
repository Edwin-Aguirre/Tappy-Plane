extends CharacterBody2D

var gravity: float = ProjectSettings.get("physics/2d/default_gravity")
var jump_force : float = -350.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	if (Input.is_action_just_pressed("jump")):
		velocity.y = jump_force
	
	move_and_slide()
