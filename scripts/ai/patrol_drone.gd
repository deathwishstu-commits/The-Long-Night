extends Node2D

enum DroneState {
	PATROL,
	CHASE
}

@export var player_path: NodePath
@export var stealth_system_path: NodePath
@export var patrol_speed: float = 60.0
@export var chase_speed: float = 105.0
@export var vision_range: float = 170.0
@export var view_angle_degrees: float = 90.0
@export var detection_rate: float = 40.0
@export var chase_break_seconds: float = 2.0
@export var sprite_path: String = "res://art/entities/security_drone_proto.png"

var _state: DroneState = DroneState.PATROL
var _target_index: int = 0
var _lost_sight_timer: float = 0.0
var _patrol_points: Array[Vector2] = []

@onready var _player: Node2D = get_node_or_null(player_path)
@onready var _stealth_system: Node = get_node_or_null(stealth_system_path)

func _ready() -> void:
	_load_sprite()
	_collect_patrol_points()

func _process(delta: float) -> void:
	if _patrol_points.is_empty():
		return

	if _player == null:
		_player = get_node_or_null(player_path)
	if _stealth_system == null:
		_stealth_system = get_node_or_null(stealth_system_path)

	var sees_player := _can_see_player()
	if sees_player:
		_lost_sight_timer = 0.0
		_state = DroneState.CHASE
		_add_detection(delta)
	else:
		_lost_sight_timer += delta
		if _state == DroneState.CHASE and _lost_sight_timer >= chase_break_seconds:
			_state = DroneState.PATROL

	if _state == DroneState.CHASE and _player != null:
		_move_toward(_player.global_position, chase_speed, delta)
	else:
		var target := _patrol_points[_target_index]
		_move_toward(target, patrol_speed, delta)
		if global_position.distance_to(target) < 6.0:
			_target_index = (_target_index + 1) % _patrol_points.size()

func _collect_patrol_points() -> void:
	_patrol_points.clear()
	var patrol_root := get_node_or_null("PatrolPoints")
	if patrol_root == null:
		return
	for child in patrol_root.get_children():
		if child is Marker2D:
			_patrol_points.append((child as Marker2D).global_position)

func _move_toward(target: Vector2, speed: float, delta: float) -> void:
	var direction := target - global_position
	if direction.length_squared() <= 0.001:
		return
	var velocity := direction.normalized() * speed
	global_position += velocity * delta
	rotation = velocity.angle()

func _can_see_player() -> bool:
	if _player == null:
		return false
	var to_player := _player.global_position - global_position
	if to_player.length() > vision_range:
		return false
	var forward := Vector2.RIGHT.rotated(rotation)
	var dot_value := forward.dot(to_player.normalized())
	var threshold := cos(deg_to_rad(view_angle_degrees * 0.5))
	return dot_value >= threshold

func _add_detection(delta: float) -> void:
	if _stealth_system == null:
		return
	var noise_level := 1.0
	if _player != null and _player.has_method("get_noise_level"):
		noise_level = _player.call("get_noise_level")
	if _stealth_system.has_method("add_detection"):
		_stealth_system.call("add_detection", detection_rate * noise_level * delta)

func _load_sprite() -> void:
	var sprite := get_node_or_null("Sprite2D") as Sprite2D
	if sprite == null:
		return
	var image := Image.new()
	var load_status := image.load(sprite_path)
	if load_status != OK:
		push_warning("Failed to load drone sprite: %s" % sprite_path)
		return
	var texture := ImageTexture.create_from_image(image)
	sprite.texture = texture
	sprite.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
