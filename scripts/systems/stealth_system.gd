extends Node

signal detection_changed(value: float)
signal alert_state_changed(is_alert: bool)

@export var decay_rate: float = 14.0
@export var alert_threshold: float = 60.0

var detection: float = 0.0
var is_alert: bool = false

func _process(delta: float) -> void:
	add_detection(-decay_rate * delta)

func add_detection(amount: float) -> void:
	var next_value := clamp(detection + amount, 0.0, 100.0)
	if is_equal_approx(next_value, detection):
		return

	detection = next_value
	detection_changed.emit(detection)

	var next_alert := detection >= alert_threshold
	if next_alert != is_alert:
		is_alert = next_alert
		alert_state_changed.emit(is_alert)
