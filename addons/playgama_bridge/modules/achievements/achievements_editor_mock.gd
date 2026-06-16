var is_supported setget , _is_supported_getter


func _is_supported_getter():
	return false


func unlock(id, callback = null):
	if callback != null:
		callback.call_func(false)

func get_list(callback = null):
	if callback != null:
		callback.call_func(false, [])
