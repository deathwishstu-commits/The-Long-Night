extends StaticBody2D

@export var sprite_path: String = "res://art/entities/blast_door_proto.png"

@onready var _collision: CollisionShape2D = $CollisionShape2D
@onready var _sprite: Sprite2D = $Sprite2D

var _is_locked: bool = true

func _ready() -> void:
	_load_sprite()

func unlock() -> void:
	_is_locked = false
	if _collision != null:
		_collision.disabled = true
	if _sprite != null:
		_sprite.modulate = Color(0.32, 0.8, 0.42, 1.0)

func is_locked() -> bool:
	return _is_locked

func _load_sprite() -> void:
	if _sprite == null:
		return
	var image := Image.new()
	var load_status := image.load(sprite_path)
	if load_status != OK:
		push_warning("Failed to load door sprite: %s" % sprite_path)
		return
	var texture := ImageTexture.create_from_image(image)
	_sprite.texture = texture
	_sprite.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
