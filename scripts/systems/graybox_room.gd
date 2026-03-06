extends Node2D

@export var room_size: Vector2 = Vector2(320, 180)
@export var fill_color: Color = Color(0.12, 0.14, 0.18, 0.75)
@export var border_color: Color = Color(0.45, 0.52, 0.62, 0.9)

func _ready() -> void:
	queue_redraw()

func _draw() -> void:
	var rect := Rect2(Vector2.ZERO, room_size)
	draw_rect(rect, fill_color, true)
	draw_rect(rect, border_color, false, 3.0)
