extends Node2D

@export var room_size: Vector2 = Vector2(320, 180)
@export var fill_color: Color = Color(0.12, 0.14, 0.18, 0.75)
@export var border_color: Color = Color(0.45, 0.52, 0.62, 0.9)
@export var wall_thickness: float = 8.0
@export var door_width: float = 56.0
@export var left_door: bool = false
@export var right_door: bool = false
@export var top_door: bool = false
@export var bottom_door: bool = false

func _ready() -> void:
	_build_collision_walls()
	queue_redraw()

func _draw() -> void:
	var rect := Rect2(Vector2.ZERO, room_size)
	draw_rect(rect, fill_color, true)
	draw_rect(rect, border_color, false, 3.0)

func _build_collision_walls() -> void:
	var collision_root: Node2D = get_node_or_null("Collision")
	if collision_root != null:
		collision_root.queue_free()

	collision_root = Node2D.new()
	collision_root.name = "Collision"
	add_child(collision_root)

	var half_door: float = door_width * 0.5
	var center_x: float = room_size.x * 0.5
	var center_y: float = room_size.y * 0.5

	_rebuild_horizontal_side(collision_root, true, top_door, center_x, half_door)
	_rebuild_horizontal_side(collision_root, false, bottom_door, center_x, half_door)
	_rebuild_vertical_side(collision_root, true, left_door, center_y, half_door)
	_rebuild_vertical_side(collision_root, false, right_door, center_y, half_door)

func _rebuild_horizontal_side(root: Node2D, is_top: bool, has_door: bool, center_x: float, half_door: float) -> void:
	var y: float = wall_thickness * 0.5 if is_top else room_size.y - wall_thickness * 0.5
	if not has_door:
		_add_wall_segment(root, Vector2(room_size.x * 0.5, y), Vector2(room_size.x, wall_thickness))
		return

	var left_width: float = max(0.0, center_x - half_door)
	var right_width: float = max(0.0, room_size.x - (center_x + half_door))
	if left_width > 0.0:
		_add_wall_segment(root, Vector2(left_width * 0.5, y), Vector2(left_width, wall_thickness))
	if right_width > 0.0:
		var right_center: float = center_x + half_door + (right_width * 0.5)
		_add_wall_segment(root, Vector2(right_center, y), Vector2(right_width, wall_thickness))

func _rebuild_vertical_side(root: Node2D, is_left: bool, has_door: bool, center_y: float, half_door: float) -> void:
	var x: float = wall_thickness * 0.5 if is_left else room_size.x - wall_thickness * 0.5
	if not has_door:
		_add_wall_segment(root, Vector2(x, room_size.y * 0.5), Vector2(wall_thickness, room_size.y))
		return

	var top_height: float = max(0.0, center_y - half_door)
	var bottom_height: float = max(0.0, room_size.y - (center_y + half_door))
	if top_height > 0.0:
		_add_wall_segment(root, Vector2(x, top_height * 0.5), Vector2(wall_thickness, top_height))
	if bottom_height > 0.0:
		var bottom_center: float = center_y + half_door + (bottom_height * 0.5)
		_add_wall_segment(root, Vector2(x, bottom_center), Vector2(wall_thickness, bottom_height))

func _add_wall_segment(root: Node2D, position_value: Vector2, size: Vector2) -> void:
	if size.x <= 0.0 or size.y <= 0.0:
		return
	var body := StaticBody2D.new()
	body.position = position_value
	root.add_child(body)

	var shape_node := CollisionShape2D.new()
	var rect := RectangleShape2D.new()
	rect.size = size
	shape_node.shape = rect
	body.add_child(shape_node)
