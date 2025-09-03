var is_authorization_supported setget , _is_authorization_supported_getter
var is_authorized setget , _is_authorized_getter
var id setget , _id_getter
var name setget , _name_getter
var photos setget , _photos_getter
var extra setget , _extra_getter


func _is_authorization_supported_getter():
	return false
	
func _is_authorized_getter():
	return false
	
func _id_getter():
	return null

func _name_getter():
	return null

func _photos_getter():
	return []

func _extra_getter():
	return {}


func authorize(options = null, callback = null):
	if callback != null:
		callback.call_func(false)
