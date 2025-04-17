var id setget , _id_getter
var payload setget , _payload_getter
var language setget , _language_getter
var tld setget , _tld_getter
var is_get_all_games_supported setget , _is_get_all_games_supported_getter
var is_get_game_by_id_supported setget , _is_get_game_by_id_supported_getter

func _id_getter():
	return "mock"

func _payload_getter():
	return null

func _language_getter():
	return "en"

func _tld_getter():
	return null

func send_message(message):
	pass

func _is_get_all_games_supported_getter():
	return false

func _is_get_game_by_id_supported_getter():
	return false

func get_server_time(callback):
	if callback != null:
		callback.call_func(Time.get_unix_time_from_system() * 1000)

func get_all_games(callback):
	if callback != null:
		callback.call_func(true, [])

func get_game_by_id(options, callback):
	if callback != null:
		callback.call_func(true, {
			"appID": "mock",
			"title": "Mock Game",
			"url": "https://mock.com",
			"coverURL": "https://mock.com/cover.png",
			"iconURL": "https://mock.com/icon.png",
			"isAvailable": true
		})
