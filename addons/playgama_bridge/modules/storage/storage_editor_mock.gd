const _FILE_EXTENSION = ".save"


func get(key, callback = null):
	if callback == null:
		return

	var key_type = typeof(key)
	var success = false
	var data = null

	match key_type:
		TYPE_STRING:
			data = _get(key)
			success = true

		TYPE_ARRAY:
			data = []
			for k in key:
				data.append(_get(k))
			success = true

		_:
			success = false

	callback.call_func(success, data)

func set(key, value, callback = null):
	var key_type = typeof(key)
	var success = false

	match key_type:
		TYPE_STRING:
			_set(key, value)
			success = true
		TYPE_ARRAY:
			for i in key.size():
				_set(key[i], value[i])
			success = true
		_:
			success = false

	if callback != null:
		callback.call_func(success)

func delete(key, callback = null):
	var key_type = typeof(key)
	var success = false

	match key_type:
		TYPE_STRING:
			_delete(key)
			success = true
		TYPE_ARRAY:
			for k in key:
				_delete(k)
			success = true
		_:
			success = false

	if callback != null:
		callback.call_func(success)


func _get_file_path(key):
	return "user://" + key + _FILE_EXTENSION

func _get(key):
	var path = _get_file_path(key)
	var dir = Directory.new()

	if not dir.file_exists(path):
		return null

	var file = File.new()
	file.open(path, File.READ)

	var data = file.get_as_text()
	file = null

	if data.empty():
		return null
	else:
		return data

func _set(key, value):
	var path = _get_file_path(key)

	var file = File.new()
	file.open(path, File.WRITE)

	if (typeof(value) != TYPE_STRING):
		value = str(value)

	file.store_string(value)
	file = null

func _delete(key):
	var path = _get_file_path(key)
	var dir = Directory.new()

	if not dir.file_exists(path):
		return

	dir.remove(path)
