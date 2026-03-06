extends CharacterBody2D

@export var move_speed: float = 120.0
@export var crouch_speed_multiplier: float = 0.55

var _is_crouching: bool = false

func _physics_process(_delta: float) -> void:
	_is_crouching = Input.is_action_pressed("crouch")
	var speed := move_speed
	if _is_crouching:
		speed *= crouch_speed_multiplier

	var input_vector := Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	velocity = input_vector.normalized() * speed
	move_and_slide()

func is_crouching() -> bool:
	return _is_crouching

func get_noise_level() -> float:
	if _is_crouching:
		return 0.5
	return 1.0
