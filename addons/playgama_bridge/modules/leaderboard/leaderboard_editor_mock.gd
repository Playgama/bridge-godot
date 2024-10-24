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
	return false

func _is_native_popup_supported_getter():
	return false

func _is_multiple_boards_supported_getter():
	return false

func _is_set_score_supported_getter():
	return false

func _is_get_score_supported_getter():
	return false

func _is_get_entries_supported_getter():
	return false


func set_score(options = null, callback = null):
	if callback != null:
		callback.call(false)

func get_score(options = null, callback = null):
	if callback != null:
		callback.call(false, 0)

func get_entries(options = null, callback = null):
	if callback != null:
		callback.call(false, [])

func show_native_popup(options = null, callback = null):
	if callback != null:
		callback.call(false)
