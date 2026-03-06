extends Node2D

var current_objective: String = "Restore local power relay"

func _ready() -> void:
	var hud := get_node_or_null("UI/DeckAHUD")
	var stealth_system := get_node_or_null("StealthSystem")
	if hud != null and hud.has_method("set_objective"):
		hud.call("set_objective", current_objective)
	if hud != null and hud.has_method("set_detection"):
		hud.call("set_detection", 0.0)
	if stealth_system != null and stealth_system.has_signal("detection_changed"):
		stealth_system.connect("detection_changed", _on_detection_changed)

func _on_detection_changed(value: float) -> void:
	var hud := get_node_or_null("UI/DeckAHUD")
	if hud != null and hud.has_method("set_detection"):
		hud.call("set_detection", value)
