extends DetailedSceneBase


@onready var device_type_label = $MarginContainer2/VBoxContainer/DeviceType


func _ready():
	device_type_label.text = "Device Type: " + Bridge.device.type
