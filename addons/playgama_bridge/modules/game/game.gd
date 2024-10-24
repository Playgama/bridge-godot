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

signal visibility_state_changed
var visibility_state : get = _visibility_state_getter

var _js_game = null
var _js_on_visibility_state_changed = JavaScriptBridge.create_callback(self._on_visibility_state_changed)

func _visibility_state_getter():
	return _js_game.visibilityState

func _init(js_game):
	_js_game = js_game
	_js_game.on('visibility_state_changed', _js_on_visibility_state_changed)

func _on_visibility_state_changed(args):
	emit_signal("visibility_state_changed", args[0])
