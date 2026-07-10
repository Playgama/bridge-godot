extends DetailedSceneBase


onready var id_label = $MarginContainer2/VBoxContainer/PlatformID
onready var language_label = $MarginContainer2/VBoxContainer/Language
onready var payload_label = $MarginContainer2/VBoxContainer/Payload
onready var tld_label = $MarginContainer2/VBoxContainer/Tld
onready var server_time_label = $MarginContainer2/VBoxContainer/HBoxContainer4/ServerTimeLabel
onready var options_input = $MarginContainer2/VBoxContainer/HBoxContainerOptions/OptionsInput

func _ready():
	id_label.text = "Platform ID: " + Bridge.platform.id
	language_label.text = "Language: " + Bridge.platform.language
	payload_label.text = "Payload: " + str(Bridge.platform.payload)
	tld_label.text = "TLD: " + str(Bridge.platform.tld)

func _on_send_game_ready_button_pressed():
	Bridge.platform.send_message(Bridge.PlatformMessage.GAME_READY)

func _on_send_in_game_loading_started_button_pressed():
	Bridge.platform.send_message(Bridge.PlatformMessage.IN_GAME_LOADING_STARTED)

func _on_send_in_game_loading_stopped_button_pressed():
	Bridge.platform.send_message(Bridge.PlatformMessage.IN_GAME_LOADING_STOPPED)

func _on_send_gameplay_started_button_pressed():
	Bridge.platform.send_message(Bridge.PlatformMessage.GAMEPLAY_STARTED)

func _on_send_gameplay_stopped_button_pressed():
	Bridge.platform.send_message(Bridge.PlatformMessage.GAMEPLAY_STOPPED)

func _on_send_player_got_achievement_button_pressed():
	Bridge.platform.send_message(Bridge.PlatformMessage.PLAYER_GOT_ACHIEVEMENT)

func _parse_options():
	var text = options_input.text.strip_edges()
	if text.empty():
		return null
	var parse_result = JSON.parse(text)
	if parse_result.error != OK:
		print("Invalid JSON: " + parse_result.error_string)
		return null
	return parse_result.result

func _on_send_level_started_button_pressed():
	Bridge.platform.send_message(Bridge.PlatformMessage.LEVEL_STARTED, _parse_options())

func _on_send_level_completed_button_pressed():
	Bridge.platform.send_message(Bridge.PlatformMessage.LEVEL_COMPLETED, _parse_options())

func _on_send_level_failed_button_pressed():
	Bridge.platform.send_message(Bridge.PlatformMessage.LEVEL_FAILED, _parse_options())

func _on_send_level_paused_button_pressed():
	Bridge.platform.send_message(Bridge.PlatformMessage.LEVEL_PAUSED, _parse_options())

func _on_send_level_resumed_button_pressed():
	Bridge.platform.send_message(Bridge.PlatformMessage.LEVEL_RESUMED, _parse_options())

func _on_get_server_time_button_pressed():
	Bridge.platform.get_server_time(funcref(self, "_on_get_server_time_completed"))

func _on_get_server_time_completed(milliseconds):
	server_time_label.text = "Server Time (UTC): " + str(milliseconds)

