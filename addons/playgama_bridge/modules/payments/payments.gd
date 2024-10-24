# This file is part of Playgama Bridge.
# 
# Playgama Bridge is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
# 
# Playgama Bridge is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Lesser General Public License for more details.
# 
# You should have received a copy of the GNU Lesser General Public License
# along with Playgama Bridge. If not, see <https://www.gnu.org/licenses/>.

var is_supported : get = _is_supported_getter


func _is_supported_getter():
	return _js_payments.isSupported


var _js_payments = null
var _purchase_callback = null
var _js_purchase_then = JavaScriptBridge.create_callback(self._on_js_purchase_then)
var _js_purchase_catch = JavaScriptBridge.create_callback(self._on_js_purchase_catch)
var _consume_purchase_callback = null
var _js_consume_purchase_then = JavaScriptBridge.create_callback(self._on_js_consume_purchase_then)
var _js_consume_purchase_catch = JavaScriptBridge.create_callback(self._on_js_consume_purchase_catch)
var _get_catalog_callback = null
var _js_get_catalog_then = JavaScriptBridge.create_callback(self._on_js_get_catalog_then)
var _js_get_catalog_catch = JavaScriptBridge.create_callback(self._on_js_get_catalog_catch)
var _get_purchases_callback = null
var _js_get_purchases_then = JavaScriptBridge.create_callback(self._on_js_get_purchases_then)
var _js_get_purchases_catch = JavaScriptBridge.create_callback(self._on_js_get_purchases_catch)
var _utils = load("res://addons/playgama_bridge/utils.gd").new()


func purchase(options = null, callback = null):
	if _purchase_callback != null:
		return
	
	_purchase_callback = callback
	
	var js_options = null
	if options:
		js_options = _utils.convert_to_js(options)
	
	_js_payments.purchase(js_options).then(_js_purchase_then).catch(_js_purchase_catch)

func consume_purchase(options = null, callback = null):
	if _consume_purchase_callback != null:
		return

	_consume_purchase_callback = callback
	
	var js_options = null
	if options:
		js_options = _utils.convert_to_js(options)
	
	_js_payments.consumePurchase(js_options).then(_js_consume_purchase_then).catch(_js_consume_purchase_catch)

func get_catalog(callback = null):
	if _get_catalog_callback != null:
		return

	_get_catalog_callback = callback
	_js_payments.getCatalog().then(_js_get_catalog_then).catch(_js_get_catalog_catch)

func get_purchases(callback = null):
	if _get_purchases_callback != null:
		return

	_get_purchases_callback = callback
	_js_payments.getPurchases().then(_js_get_purchases_then).catch(_js_get_purchases_catch)


func _init(js_payments):
	_js_payments = js_payments

func _on_js_purchase_then(args):
	if _purchase_callback != null:
		_purchase_callback.call(true)
		_purchase_callback = null

func _on_js_purchase_catch(args):
	if _purchase_callback != null:
		_purchase_callback.call(false)
		_purchase_callback = null

func _on_js_consume_purchase_then(args):
	if _consume_purchase_callback != null:
		_consume_purchase_callback.call(true)
		_consume_purchase_callback = null

func _on_js_consume_purchase_catch(args):
	if _consume_purchase_callback != null:
		_consume_purchase_callback.call(false)
		_consume_purchase_callback = null

func _on_js_get_catalog_then(args):
	if _get_catalog_callback != null:
		var data = args[0]
		var data_type = typeof(data)
		match data_type:
			TYPE_OBJECT:
				var array = []
				for i in range(data.length):
					var js_item = data[i]
					var js_item_keys = JavaScriptBridge.get_interface("Object").keys(js_item)
					var item = {}
					for j in range(js_item_keys.length):
						var key = js_item_keys[j]
						item[key] = js_item[key]
					array.append(item)
				_get_catalog_callback.call(true, array)
			_:
				_get_catalog_callback.call(false, [])
		_get_catalog_callback = null

func _on_js_get_catalog_catch(args):
	if _get_catalog_callback != null:
		_get_catalog_callback.call(false, [])
		_get_catalog_callback = null

func _on_js_get_purchases_then(args):
	if _get_purchases_callback != null:
		var data = args[0]
		var data_type = typeof(data)
		match data_type:
			TYPE_OBJECT:
				var array = []
				for i in range(data.length):
					var js_item = data[i]
					var js_item_keys = JavaScriptBridge.get_interface("Object").keys(js_item)
					var item = {}
					for j in range(js_item_keys.length):
						var key = js_item_keys[j]
						item[key] = js_item[key]
					array.append(item)
				_get_purchases_callback.call(true, array)
			_:
				_get_purchases_callback.call(false, [])
		_get_purchases_callback = null

func _on_js_get_purchases_catch(args):
	if _get_purchases_callback != null:
		_get_purchases_callback.call(false, [])
		_get_purchases_callback = null
