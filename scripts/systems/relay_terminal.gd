extends Area2D

signal activated()

@export var prompt_text: String = "Press E to reroute relay power"
@export var sprite_path: String = "res://art/entities/relay_terminal_proto.png"

var _player_in_range: bool = false
var _is_activated: bool = false

func _ready() -> void:
	_load_sprite()
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(_delta: float) -> void:
	if _is_activated:
		return
	if _player_in_range and Input.is_action_just_pressed("interact"):
		_is_activated = true
		activated.emit()

func _on_body_entered(body: Node) -> void:
	if body.name == "PlayerWallace":
		_player_in_range = true

func _on_body_exited(body: Node) -> void:
	if body.name == "PlayerWallace":
		_player_in_range = false

func _load_sprite() -> void:
	var sprite := get_node_or_null("Sprite2D") as Sprite2D
	if sprite == null:
		return
	var image := Image.new()
	var load_status := image.load(sprite_path)
	if load_status != OK:
		push_warning("Failed to load terminal sprite: %s" % sprite_path)
		return
	var texture := ImageTexture.create_from_image(image)
	sprite.texture = texture
	sprite.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
