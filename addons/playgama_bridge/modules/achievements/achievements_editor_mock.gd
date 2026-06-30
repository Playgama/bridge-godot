func unlock(id, callback = null):
	if callback != null:
		callback.call_func(false)

func get_achievements(callback = null):
	if callback != null:
		callback.call_func(false, [])
