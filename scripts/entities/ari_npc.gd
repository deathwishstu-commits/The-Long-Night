extends Node2D

@export var sprite_path: String = "res://art/characters/ari_proto.png"

func _ready() -> void:
	var sprite := get_node_or_null("Sprite2D") as Sprite2D
	if sprite == null:
		return
	var image := Image.new()
	var load_status := image.load(sprite_path)
	if load_status != OK:
		push_warning("Failed to load Ari sprite: %s" % sprite_path)
		return
	var texture := ImageTexture.create_from_image(image)
	sprite.texture = texture
	sprite.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
