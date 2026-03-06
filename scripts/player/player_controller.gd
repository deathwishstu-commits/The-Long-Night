extends CharacterBody2D

@export var move_speed: float = 120.0
@export var crouch_speed_multiplier: float = 0.55
@export var sprite_path: String = "res://art/characters/wallace_proto.png"

var _is_crouching: bool = false

func _ready() -> void:
	_load_sprite()

func _physics_process(_delta: float) -> void:
	_is_crouching = Input.is_action_pressed("crouch")
	var speed: float = move_speed
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

func _load_sprite() -> void:
	var sprite := get_node_or_null("Sprite2D") as Sprite2D
	if sprite == null:
		return
	var image := Image.new()
	var load_status := image.load(sprite_path)
	if load_status != OK:
		push_warning("Failed to load player sprite: %s" % sprite_path)
		return
	var texture := ImageTexture.create_from_image(image)
	sprite.texture = texture
	sprite.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
