# This file is part of Playgama Bridge.
#
# Playgama Bridge is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Playgama Bridge is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Playgama Bridge. If not, see <https://www.gnu.org/licenses/>.

var is_authorization_supported setget , _is_authorization_supported_getter
var is_authorized setget , _is_authorized_getter
var id setget , _id_getter
var name setget , _name_getter
var photos setget , _photos_getter


func _is_authorization_supported_getter():
	return _js_player.isAuthorizationSupported

func _is_authorized_getter():
	return _js_player.isAuthorized

func _id_getter():
	return _js_player.id

func _name_getter():
	return _js_player.name

func _photos_getter():
	var array = []
	for i in range(_js_player.photos.length):
		array.append(_js_player.photos[i])
	return array

var _js_player = null
var _js_authorize_then = JavaScript.create_callback(self, "_on_js_authorize_then")
var _js_authorize_catch = JavaScript.create_callback(self, "_on_js_authorize_catch")
var _authorize_callback = null
var _utils = load("res://addons/playgama_bridge/utils.gd").new()


func authorize(options = null, callback = null):
	if _authorize_callback != null:
		return
	
	_authorize_callback = callback
	
	var js_options = null
	if options:
		js_options = _utils.convert_to_js(options)
	
	_js_player.authorize(js_options) \
		.then(_js_authorize_then) \
		.catch(_js_authorize_catch)


func _init(js_player):
	_js_player = js_player

func _on_js_authorize_then(args):
	if _authorize_callback != null:
		_authorize_callback.call_func(true)
		_authorize_callback = null

func _on_js_authorize_catch(args):
	if _authorize_callback != null:
		_authorize_callback.call_func(false)
		_authorize_callback = null
