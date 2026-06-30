var is_supported setget , _is_supported_getter


func _is_supported_getter():
	return false


func set_context(parameters):
	pass


func get(callback = null):
	if callback == null:
		return

	callback.call_func(false, null)
