signal audio_state_changed
signal pause_state_changed

var id setget , _id_getter
var payload setget , _payload_getter
var language setget , _language_getter
var tld setget , _tld_getter
var is_audio_enabled setget , _is_audio_enabled_getter
var is_external_calls_supported setget , _is_external_calls_supported_getter

func _id_getter():
	return "mock"

func _payload_getter():
	return null

func _language_getter():
	return "en"

func _tld_getter():
	return null

func send_message(message, options = null):
	pass

func _is_audio_enabled_getter():
	return true

func _is_external_calls_supported_getter():
	return true

func get_server_time(callback):
	if callback != null:
		callback.call_func(Time.get_unix_time_from_system() * 1000)
