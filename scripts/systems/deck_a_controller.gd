extends Node2D

var current_objective: String = "Restore local power relay"

func _ready() -> void:
	var hud := get_node_or_null("UI/DeckAHUD")
	var stealth_system := get_node_or_null("StealthSystem")
	var relay_terminal := get_node_or_null("Entities/RelayTerminal")
	var blast_door_lock := get_node_or_null("Entities/BlastDoorLock")

	if hud != null and hud.has_method("set_objective"):
		hud.call("set_objective", current_objective)
	if hud != null and hud.has_method("set_detection"):
		hud.call("set_detection", 0.0)
	if hud != null and hud.has_method("set_status"):
		hud.call("set_status", "Use WASD/Arrows to move, Shift to crouch, E to interact.")
	if stealth_system != null and stealth_system.has_signal("detection_changed"):
		stealth_system.connect("detection_changed", _on_detection_changed)
	if relay_terminal != null and relay_terminal.has_signal("activated"):
		relay_terminal.connect("activated", _on_relay_activated)
	if blast_door_lock != null and blast_door_lock.has_method("is_locked") and hud != null and hud.has_method("set_status"):
		if blast_door_lock.call("is_locked"):
			hud.call("set_status", "Power lock active. Reach Reactor Control and press E at relay terminal.")

	_connect_room_triggers()
	_set_camera_bounds()

func _on_detection_changed(value: float) -> void:
	var hud := get_node_or_null("UI/DeckAHUD")
	if hud != null and hud.has_method("set_detection"):
		hud.call("set_detection", value)

func _on_relay_activated() -> void:
	current_objective = "Proceed through unlocked blast door and secure Deck B access"
	var hud := get_node_or_null("UI/DeckAHUD")
	var blast_door_lock := get_node_or_null("Entities/BlastDoorLock")

	if blast_door_lock != null and blast_door_lock.has_method("unlock"):
		blast_door_lock.call("unlock")
	if hud != null and hud.has_method("set_objective"):
		hud.call("set_objective", current_objective)
	if hud != null and hud.has_method("set_status"):
		hud.call("set_status", "Relay restored. Blast door lock disengaged.")

func _connect_room_triggers() -> void:
	var room_triggers := get_tree().get_nodes_in_group("room_trigger")
	for trigger in room_triggers:
		if trigger.has_signal("room_entered"):
			trigger.connect("room_entered", _on_room_entered)

func _on_room_entered(room_name: String) -> void:
	var hud := get_node_or_null("UI/DeckAHUD")
	if hud != null and hud.has_method("set_status"):
		hud.call("set_status", "Entered: %s" % room_name)

func _set_camera_bounds() -> void:
	var camera: Camera2D = get_node_or_null("Entities/PlayerWallace/Camera2D")
	var rooms_root: Node2D = get_node_or_null("Rooms")
	if camera == null or rooms_root == null:
		return

	var min_x: float = 1e20
	var min_y: float = 1e20
	var max_x: float = -1e20
	var max_y: float = -1e20

	for room in rooms_root.get_children():
		if not room.has_method("get") or not room.has_method("get_position"):
			continue
		var size: Vector2 = room.get("room_size")
		var top_left: Vector2 = room.position
		var bottom_right: Vector2 = room.position + size
		min_x = min(min_x, top_left.x)
		min_y = min(min_y, top_left.y)
		max_x = max(max_x, bottom_right.x)
		max_y = max(max_y, bottom_right.y)

	if min_x > 9e19:
		return
	camera.limit_left = int(min_x)
	camera.limit_top = int(min_y)
	camera.limit_right = int(max_x)
	camera.limit_bottom = int(max_y)
