extends Control

@onready var _objective_value: Label = $PanelContainer/MarginContainer/VBoxContainer/ObjectiveValue
@onready var _stealth_bar: ProgressBar = $PanelContainer/MarginContainer/VBoxContainer/StealthBar
@onready var _stealth_value: Label = $PanelContainer/MarginContainer/VBoxContainer/StealthValue

func set_objective(text: String) -> void:
	_objective_value.text = text

func set_detection(value: float) -> void:
	_stealth_bar.value = value
	_stealth_value.text = "Stealth Risk: %d%%" % int(round(value))
