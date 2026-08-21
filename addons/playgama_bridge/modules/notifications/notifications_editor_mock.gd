var is_supported setget , _is_supported_getter


func _is_supported_getter():
	return false


func schedule(notification, callback = null):
	if callback != null:
		callback.call_func(false)


func cancel(id, callback = null):
	if callback != null:
		callback.call_func(false)


func cancel_all(callback = null):
	if callback != null:
		callback.call_func(false)
