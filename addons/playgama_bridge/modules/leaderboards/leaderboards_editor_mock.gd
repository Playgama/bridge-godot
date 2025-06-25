var type setget , _type_getter


func _type_getter():
	return Bridge.LeaderboardType.NOT_AVAILABLE


func set_score(id, score, callback = null):
	if callback != null:
		callback.call_func(false)

func get_entries(id, callback = null):
	if callback != null:
		callback.call_func(false, [])
