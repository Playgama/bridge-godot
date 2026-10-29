signal state_changed
signal room_left
signal room_updated
signal player_joined
signal player_left
signal player_updated
signal host_changed
signal message_received
signal sync_state_received

var is_supported setget , _is_supported_getter
var state setget , _state_getter
var is_in_room setget , _is_in_room_getter
var is_host setget , _is_host_getter
var player_id setget , _player_id_getter
var host_id setget , _host_id_getter
var room_id setget , _room_id_getter
var room setget , _room_getter
var players setget , _players_getter
var is_invite_supported setget , _is_invite_supported_getter
var launch_room_id setget , _launch_room_id_getter
var sync_state setget , _sync_state_getter
var last_error setget , _last_error_getter


func _is_supported_getter():
	return false

func _state_getter():
	return Bridge.MultiplayerState.DISCONNECTED

func _is_in_room_getter():
	return false

func _is_host_getter():
	return false

func _player_id_getter():
	return null

func _host_id_getter():
	return null

func _room_id_getter():
	return null

func _room_getter():
	return null

func _players_getter():
	return []

func _is_invite_supported_getter():
	return false

func _launch_room_id_getter():
	return null

func _sync_state_getter():
	return _sync_state.duplicate(true)

func _last_error_getter():
	return null

# The world is only stored, nothing is sent.
var _sync_state = {}


func create_room(options = null, callback = null):
	if callback != null:
		callback.call_func(false, null)

func join_room(id, options = null, callback = null):
	if callback != null:
		callback.call_func(false)

func join_or_create_room(options = null, callback = null):
	if callback != null:
		callback.call_func(false, null)

func get_rooms(options = null, callback = null):
	if callback != null:
		callback.call_func(false, [])

func invite_to_room(options = null, callback = null):
	if callback != null:
		callback.call_func(false)

func leave_room():
	pass

func set_room_open(is_open):
	pass

func set_room_visible(is_visible):
	pass

func set_room_properties(properties):
	pass

func set_player_properties(properties):
	pass

func send(type, data = null, options = null):
	pass

func set_sync_state(state):
	if typeof(state) == TYPE_DICTIONARY:
		_sync_state = state.duplicate(true)
