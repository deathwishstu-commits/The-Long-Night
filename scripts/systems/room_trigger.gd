extends Area2D

signal room_entered(room_name: String)

@export var room_name: String = "Unknown Room"

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.name == "PlayerWallace":
		room_entered.emit(room_name)
