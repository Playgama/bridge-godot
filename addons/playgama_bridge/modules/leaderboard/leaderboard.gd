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
var is_native_popup_supported : get = _is_native_popup_supported_getter
var is_multiple_boards_supported : get = _is_multiple_boards_supported_getter
var is_set_score_supported : get = _is_set_score_supported_getter
var is_get_score_supported : get = _is_get_score_supported_getter
var is_get_entries_supported : get = _is_get_entries_supported_getter


func _is_supported_getter():
	return _js_leaderboard.isSupported

func _is_native_popup_supported_getter():
	return _js_leaderboard.isNativePopupSupported

func _is_multiple_boards_supported_getter():
	return _js_leaderboard.isMultipleBoardsSupported

func _is_set_score_supported_getter():
	return _js_leaderboard.isSetScoreSupported

func _is_get_score_supported_getter():
	return _js_leaderboard.isGetScoreSupported

func _is_get_entries_supported_getter():
	return _js_leaderboard.isGetEntriesSupported

var _js_leaderboard = null
var _set_score_callback = null
var _js_set_score_then = JavaScriptBridge.create_callback(self._on_js_set_score_then)
var _js_set_score_catch = JavaScriptBridge.create_callback(self._on_js_set_score_catch)
var _get_score_callback = null
var _js_get_score_then = JavaScriptBridge.create_callback(self._on_js_get_score_then)
var _js_get_score_catch = JavaScriptBridge.create_callback(self._on_js_get_score_catch)
var _get_entries_callback = null
var _js_get_entries_then = JavaScriptBridge.create_callback(self._on_js_get_entries_then)
var _js_get_entries_catch = JavaScriptBridge.create_callback(self._on_js_get_entries_catch)
var _show_native_popup_callback = null
var _js_show_native_popup_then = JavaScriptBridge.create_callback(self._on_js_show_native_popup_then)
var _js_show_native_popup_catch = JavaScriptBridge.create_callback(self._on_js_show_native_popup_catch)
var _utils = load("res://addons/playgama_bridge/utils.gd").new()


func set_score(options = null, callback = null):
	if _set_score_callback != null:
		return
	
	_set_score_callback = callback
	
	var js_options = null
	if options:
		js_options = _utils.convert_to_js(options)
	
	_js_leaderboard.setScore(js_options).then(_js_set_score_then).catch(_js_set_score_catch)

func get_score(options = null, callback = null):
	if _get_score_callback != null:
		return
	
	_get_score_callback = callback
	
	var js_options = null
	if options:
		js_options = _utils.convert_to_js(options)
	
	_js_leaderboard.getScore(js_options).then(_js_get_score_then).catch(_js_get_score_catch)

func get_entries(options = null, callback = null):
	if _get_entries_callback != null:
		return
	
	_get_entries_callback = callback
	
	var js_options = null
	if options:
		js_options = _utils.convert_to_js(options)
	
	_js_leaderboard.getEntries(js_options).then(_js_get_entries_then).catch(_js_get_entries_catch)

func show_native_popup(options = null, callback = null):
	if _show_native_popup_callback != null:
		return
	
	_show_native_popup_callback = callback
	
	var js_options = null
	if options:
		js_options = _utils.convert_to_js(options)
		
	_js_leaderboard.showNativePopup(js_options).then(_js_show_native_popup_then).catch(_js_show_native_popup_catch)


func _init(js_leaderboard):
	_js_leaderboard = js_leaderboard

func _on_js_set_score_then(args):
	if _set_score_callback != null:
		_set_score_callback.call(true)
		_set_score_callback = null

func _on_js_set_score_catch(args):
	if _set_score_callback != null:
		_set_score_callback.call(false)
		_set_score_callback = null

func _on_js_get_score_then(args):
	if _get_score_callback != null:
		_get_score_callback.call(true, args[0])
		_get_score_callback = null

func _on_js_get_score_catch(args):
	if _get_score_callback != null:
		_get_score_callback.call(false, 0)
		_get_score_callback = null

func _on_js_get_entries_then(args):
	if _get_entries_callback != null:
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
				_get_entries_callback.call(true, array)
			_:
				_get_entries_callback.call(false, [])
		_get_entries_callback = null

func _on_js_get_entries_catch(args):
	if _get_entries_callback != null:
		_get_entries_callback.call(false, [])
		_get_entries_callback = null

func _on_js_show_native_popup_then(args):
	if _show_native_popup_callback != null:
		_show_native_popup_callback.call(true)
		_show_native_popup_callback = null

func _on_js_show_native_popup_catch(args):
	if _show_native_popup_callback != null:
		_show_native_popup_callback.call(false)
		_show_native_popup_callback = null
