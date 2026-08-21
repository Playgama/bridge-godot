var is_visible setget , _is_visible_getter


var _is_visible = false

func _is_visible_getter():
	return _is_visible

func get_games(callback):
	if callback != null:
		callback.call_func(true, [])

func show():
	_is_visible = true

func hide():
	_is_visible = false
