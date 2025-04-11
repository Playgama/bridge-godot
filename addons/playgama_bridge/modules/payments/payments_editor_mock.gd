var is_supported setget , _is_supported_getter
var is_get_catalog_supported setget , _is_get_catalog_supported_getter
var is_get_purchases_supported setget , _is_get_purchases_supported_getter
var is_consume_purchase_supported setget , _is_consume_purchase_supported_getter


func _is_supported_getter():
	return false

func _is_get_catalog_supported_getter():
	return false

func _is_get_purchases_supported_getter():
	return false

func _is_consume_purchase_supported_getter():
	return false


func purchase(options = null, callback = null):
	if callback != null:
		callback.call_func(false)

func consume_purchase(options = null, callback = null):
	if callback != null:
		callback.call_func(false)

func get_catalog(callback = null):
	if callback != null:
		callback.call_func(false, [])

func get_purchases(callback = null):
	if callback != null:
		callback.call_func(false, [])
