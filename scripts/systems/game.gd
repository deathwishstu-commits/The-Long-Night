extends Node2D

const DECK_A_SCENE := "res://scenes/levels/deck_a.tscn"

func _ready() -> void:
	# Boot the first playable level once it exists.
	if ResourceLoader.exists(DECK_A_SCENE):
		var level: PackedScene = load(DECK_A_SCENE)
		add_child(level.instantiate())
	else:
		push_warning("Deck A scene not found yet: %s" % DECK_A_SCENE)
