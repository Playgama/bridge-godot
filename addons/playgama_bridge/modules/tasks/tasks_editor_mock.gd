func get_tasks(callback = null):
	if callback != null:
		callback.call_func(false, [])

func add_progress(metric, amount = 1, callback = null):
	if callback != null:
		callback.call_func(false)

func claim_reward(task_id, callback = null):
	if callback != null:
		callback.call_func(false)
